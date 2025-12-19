#!/usr/bin/env python3
import argparse
import sys
import time
import errno
from smbus2 import SMBus, i2c_msg

# --- Registers (match testDRV.ino) ---
REG_FAULT      = 0x00
REG_CONFIG0    = 0x09
REG_CONFIG4    = 0x0D

REG_RC_STATUS1 = 0x01  # SPEED[7:0]
REG_RC_STATUS2 = 0x02  # RC_CNT[7:0]
REG_RC_STATUS3 = 0x03  # RC_CNT[15:8]

REG_RC_CTRL0   = 0x11  # EN_RC (bit7)
REG_RC_CTRL1   = 0x12  # RC_THR[7:0]
REG_RC_CTRL2   = 0x13  # RC_THR_SCALE[3:2], RC_THR[9:8][1:0]
REG_RC_CTRL3   = 0x14  # INV_R (must be non-zero)

# --- Bit masks (match testDRV.ino) ---
CFG0_EN_OUT    = 0x80
CFG0_CLR_FLT   = 0x02
CFG0_CLR_CNT   = 0x04

CFG4_PMODE     = 0x08  # * writable only when EN_OUT=0
CFG4_I2C_BC    = 0x04  # * writable only when EN_OUT=0
CFG4_I2C_EN1   = 0x02
CFG4_I2C_PH2   = 0x01

DEFAULT_COUNTS = 2000
MOVE_TIMEOUT_S = 8.0

def median3(a, b, c):
    if (a <= b <= c) or (c <= b <= a):
        return b
    if (b <= a <= c) or (c <= a <= b):
        return a
    return c

class DRV8234:
    def __init__(self, bus: SMBus, addr: int):
        self.bus = bus
        self.addr = addr

    def read_reg(self, reg: int) -> int:
        w = i2c_msg.write(self.addr, [reg & 0xFF])
        r = i2c_msg.read(self.addr, 1)
        self.bus.i2c_rdwr(w, r)
        return list(r)[0] & 0xFF

    def read_reg_stop(self, reg: int) -> int:
        # Write register pointer (STOP), then read 1 byte (STOP)
        for attempt in range(20):
            try:
                self.bus.i2c_rdwr(i2c_msg.write(self.addr, [reg & 0xFF]))
                time.sleep(0.0005)  # small settle; bump to 0.002 if needed
                r = i2c_msg.read(self.addr, 1)
                self.bus.i2c_rdwr(r)
                return list(r)[0] & 0xFF
            except OSError as e:
                if e.errno == errno.ENXIO:  # Errno 6
                    time.sleep(0.003 * (attempt + 1))
                    continue
                raise
        raise OSError(errno.ENXIO, "NACK while reading register with STOP")

    def write_reg(self, reg: int, val: int):
        w = i2c_msg.write(self.addr, [reg & 0xFF, val & 0xFF])
        self.bus.i2c_rdwr(w)

    def probe(self) -> bool:
        try:
            _ = self.read_reg(REG_FAULT)
            return True
        except OSError:
            return False

    def enable_output(self, enable: bool):
        c0 = self.read_reg(REG_CONFIG0)
        c0 = (c0 | CFG0_EN_OUT) if enable else (c0 & ~CFG0_EN_OUT)
        self.write_reg(REG_CONFIG0, c0)

    # Starred bits: must write with EN_OUT=0 (same as sketch)
    def set_bridge_control_i2c(self, use_i2c: bool):
        c4 = self.read_reg(REG_CONFIG4)
        c4 = (c4 | CFG4_I2C_BC) if use_i2c else (c4 & ~CFG4_I2C_BC)
        self.write_reg(REG_CONFIG4, c4)

    def set_pwm_mode(self, pwm_mode: bool):
        c4 = self.read_reg(REG_CONFIG4)
        c4 = (c4 | CFG4_PMODE) if pwm_mode else (c4 & ~CFG4_PMODE)
        self.write_reg(REG_CONFIG4, c4)

    def set_control_mode_phen(self):
        self.enable_output(False)
        time.sleep(0.002)
        self.set_bridge_control_i2c(True)
        self.set_pwm_mode(False)   # PH/EN
        time.sleep(0.002)
        self.enable_output(True)
        time.sleep(0.005)

    def clear_faults(self):
        c0 = self.read_reg(REG_CONFIG0)
        self.write_reg(REG_CONFIG0, c0 | CFG0_CLR_FLT)
        time.sleep(0.001)

    def set_ovp_enabled(self, enable: bool):
        c0 = self.read_reg(REG_CONFIG0)
        if enable:
            c0 |= (1 << 6)   # EN_OVP
        else:
            c0 &= ~(1 << 6)
        self.write_reg(REG_CONFIG0, c0)

    def get_fault(self) -> int:
        return self.read_reg_stop(REG_FAULT)

    def print_status(self):
        f = self.get_fault()
        print(f"Fault Register: 0x{f:02X}")
        if f & 0x80: print("  FAULT active")
        if f & 0x20: print("  Motor STALL detected")
        if f & 0x10: print("  OCP - Overcurrent")
        if f & 0x08: print("  OVP - Overvoltage")
        if f & 0x04: print("  TSD - Thermal shutdown")
        if f & 0x02: print("  NPOR - Power-on reset")

    # PH/EN commands (match sketch)
    def _write_phen(self, en: int, ph: int):
        c4 = self.read_reg(REG_CONFIG4)
        c4 &= ~(CFG4_I2C_EN1 | CFG4_I2C_PH2)
        if en: c4 |= CFG4_I2C_EN1
        if ph: c4 |= CFG4_I2C_PH2
        self.write_reg(REG_CONFIG4, c4)

    def motor_forward(self): self._write_phen(1, 1)
    def motor_reverse(self): self._write_phen(1, 0)
    def motor_brake(self):   self._write_phen(0, 0)

    # Ripple counting setup (match sketch)
    def enable_ripple(self, enable: bool = True, inv_r: int = 1):
        rc0 = self.read_reg(REG_RC_CTRL0)
        rc0 = (rc0 | 0x80) if enable else (rc0 & ~0x80)
        self.write_reg(REG_RC_CTRL0, rc0)
        if not enable:
            return

        # Big threshold so CNT_DONE doesn't trip early
        self.write_reg(REG_RC_CTRL1, 0xFF)

        rc2 = self.read_reg(REG_RC_CTRL2)
        rc2 &= ~0x0F
        rc2 |= (0x03 << 2) | 0x03   # scale=3 (64), thr[9:8]=3
        self.write_reg(REG_RC_CTRL2, rc2)

        cur_inv = self.read_reg(REG_RC_CTRL3)
        if cur_inv == 0:
            self.write_reg(REG_RC_CTRL3, inv_r if inv_r else 1)

    def read_speed(self) -> int:
        return self.read_reg(REG_RC_STATUS1)

    def read_count16(self) -> int:
        hi1 = self.read_reg(REG_RC_STATUS3)
        lo  = self.read_reg(REG_RC_STATUS2)
        hi2 = self.read_reg(REG_RC_STATUS3)
        if hi1 != hi2:
            lo  = self.read_reg(REG_RC_STATUS2)
            hi1 = hi2
        return ((hi1 << 8) | lo) & 0xFFFF

    def read_count16_stable(self) -> int:
        return self.read_count16()

    def clear_count(self):
        c0 = self.read_reg(REG_CONFIG0)
        self.write_reg(REG_CONFIG0, c0 | CFG0_CLR_CNT)
        time.sleep(0.001)

def print_help():
    print("\nCommands:")
    print("  f [counts]   -> forward counts (default 2000)")
    print("  r [counts]   -> reverse counts (default 2000)")
    print("  brake|stop   -> brake immediately")
    print("  status       -> print fault + RC count + speed")
    print("  help         -> show this help\n")

def move_counts(dev: DRV8234, target: int, forward: bool):
    if target <= 0:
        print("targetCounts must be > 0")
        return

    dev.set_control_mode_phen()
    dev.clear_count()

    # If we’re changing direction, coast for a bit first to avoid a hard reverse transient
    if getattr(dev, "last_dir", None) is not None and dev.last_dir != forward:
        dev.motor_brake()          # EN=0 => coast/disable outputs in PH/EN
        time.sleep(0.25)           # dead-time (tune 0.1–0.5s)

    dev.motor_forward() if forward else dev.motor_reverse()
    time.sleep(0.05)

    max_seen = 0
    t0 = time.monotonic()

    last_fault_t = 0.0

    while max_seen < (target & 0xFFFF):
        if time.monotonic() - last_fault_t > 0.05:
            fault = dev.get_fault()
            last_fault_t = time.monotonic()
            if fault & 0x80:
                print("FAULT during move:")
                dev.print_status()
                break

        now = dev.read_count16_stable()
        if now > max_seen:
            max_seen = now

        if (time.monotonic() - t0) > MOVE_TIMEOUT_S:
            print("Move timeout!")
            break

        time.sleep(0.1)

    dev.motor_brake()
    time.sleep(0.010)
    final_now = dev.read_count16_stable()

    dev.last_dir = forward
    

    print(f"Move done. Dir={'FWD' if forward else 'REV'} target={target} "
          f"achieved(maxSeen)={max_seen} final_RC_CNT={final_now}")

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--bus", type=int, default=5, help="Linux I2C bus number (default: 5 => /dev/i2c-5)")
    ap.add_argument("--addr", type=lambda x: int(x, 0), default=0x30, help="7-bit I2C address (default: 0x30)")
    args = ap.parse_args()

    print("\n=== DRV8234 Serial Move-by-Counts (Ripple) [Radxa/Linux] ===")
    print(f"Using /dev/i2c-{args.bus}, addr=0x{args.addr:02X}")

    with SMBus(args.bus) as bus:
        dev = DRV8234(bus, args.addr)
        dev.last_dir = None

        print("Probing DRV8234...")
        if not dev.probe():
            print("No ACK from DRV8234. Check pullups/power/nSLEEP/A0/A1 and bus number.")
            sys.exit(1)
        print("ACK OK")

        print("Configuring driver (safe starred writes)...")
        dev.set_control_mode_phen()
        dev.clear_faults()

        # Match sketch: disable OVP then clear faults
        dev.set_ovp_enabled(False)
        dev.clear_faults()

        print("Enabling ripple encoding...")
        dev.enable_ripple(True, inv_r=1)
        dev.clear_count()

        print(f"CONFIG0: 0x{dev.read_reg(REG_CONFIG0):02X}")
        print(f"CONFIG4: 0x{dev.read_reg(REG_CONFIG4):02X}")
        dev.print_status()

        print_help()
        print("Ready. Type a command (e.g., `f 2000`).")

        try:
            while True:
                line = input("> ").strip()
                if not line:
                    continue
                lower = line.lower().strip()

                if lower in ("help", "?"):
                    print_help()
                    continue

                if lower in ("brake", "stop"):
                    dev.motor_brake()
                    print("Braked.")
                    continue

                if lower == "status":
                    dev.print_status()
                    print(f"RC_CNT={dev.read_count16()}  SPEED={dev.read_speed()}")
                    continue

                cmd = lower[0]
                counts = DEFAULT_COUNTS
                rest = lower[1:].strip()
                if rest:
                    try:
                        v = int(rest, 10)
                        if v > 0:
                            counts = v
                    except ValueError:
                        pass

                if cmd == "f":
                    print(f"Command: forward {counts} counts")
                    move_counts(dev, counts, True)
                    continue

                if cmd == "r":
                    print(f"Command: reverse {counts} counts")
                    move_counts(dev, counts, False)
                    continue

                print("Unknown command. Type `help`.")

        except (KeyboardInterrupt, EOFError):
            print("\nExiting: braking motor.")
            try:
                dev.motor_brake()
            except Exception:
                pass

if __name__ == "__main__":
    main()