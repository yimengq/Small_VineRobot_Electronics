#!/usr/bin/env python3
import argparse
import sys
import time
import errno
from smbus2 import SMBus, i2c_msg

# --- Registers (match testDRV.ino) ---
REG_FAULT      = 0x00
REG_CONFIG0    = 0x09
REG_CONFIG3    = 0x0C  # IMODE[1:0] (bits 7:6), INT_VREF (bit 4)   [oai_citation:3‡drv8234.pdf](file-service://file-7yaZ4uPmrDYPKvwAsuP62k)
REG_CONFIG4    = 0x0D

REG_REG_CTRL0  = 0x0E  # REG_CTRL[1:0] at bits 4:3             [oai_citation:4‡drv8234.pdf](file-service://file-7yaZ4uPmrDYPKvwAsuP62k)

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

# --------- MCP4725 DAC helper ---------
class MCP4725:
    """
    Uses MCP4725 "Fast Mode" 2-byte write:
      [ 00 PD1 PD0 D11 D10 D9 D8 ] [ D7 ... D0 ]   [oai_citation:5‡mcp4725.pdf](file-service://file-DRfS8hWYFmn2t4KCmToF5Y)
    """
    def __init__(self, bus: SMBus, addr: int = 0x62, vdd: float = 3.3):
        self.bus = bus
        self.addr = addr
        self.vdd = float(vdd)
        self.last_code = None

    def probe(self) -> bool:
        try:
            self.write_code(0)
            return True
        except OSError:
            return False

    def write_code(self, code: int, pd: int = 0):
        code = int(max(0, min(4095, code)))
        pd = int(max(0, min(3, pd)))
        b0 = ((pd & 0x3) << 4) | ((code >> 8) & 0x0F)  # 00 + PD + D11..D8
        b1 = code & 0xFF                               # D7..D0
        self.bus.i2c_rdwr(i2c_msg.write(self.addr, [b0, b1]))
        self.last_code = code

    def set_voltage(self, vout: float) -> float:
        vout = float(vout)
        if self.vdd <= 0:
            raise ValueError("DAC vdd must be > 0")
        v = max(0.0, min(self.vdd, vout))
        code = int(round((v / self.vdd) * 4095.0))
        self.write_code(code)
        # Return actual voltage after quantization
        return (code / 4095.0) * self.vdd

    def set_current_limit(self, amps: float, ripropi_ohm: float, aipropi_uA_per_A: float) -> tuple[float, float]:
        """
        From DRV8234: ITRIP * AIPROPI = VVREF / RIPROPI   [oai_citation:6‡drv8234.pdf](file-service://file-7yaZ4uPmrDYPKvwAsuP62k)
        => VVREF = ITRIP * AIPROPI * RIPROPI
        """
        amps = float(amps)
        vref_cmd = amps * (aipropi_uA_per_A * 1e-6) * ripropi_ohm
        vref_act = self.set_voltage(vref_cmd)
        itrip_act = (vref_act / ripropi_ohm) / (aipropi_uA_per_A * 1e-6)
        return vref_act, itrip_act

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
        self.last_dir = None

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
                time.sleep(0.0005)
                r = i2c_msg.read(self.addr, 1)
                self.bus.i2c_rdwr(r)
                return list(r)[0] & 0xFF
            except OSError as e:
                if e.errno == errno.ENXIO:
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

    # Starred bits: must write with EN_OUT=0
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

    # PH/EN commands
    def _write_phen(self, en: int, ph: int):
        c4 = self.read_reg(REG_CONFIG4)
        c4 &= ~(CFG4_I2C_EN1 | CFG4_I2C_PH2)
        if en: c4 |= CFG4_I2C_EN1
        if ph: c4 |= CFG4_I2C_PH2
        self.write_reg(REG_CONFIG4, c4)

    def motor_forward(self): self._write_phen(1, 1)
    def motor_reverse(self): self._write_phen(1, 0)
    def motor_brake(self):   self._write_phen(0, 0)

    # --- Current regulation config ---
    def configure_current_regulation(self, imode: int = 0b10, use_int_vref: bool = False, reg_ctrl: int = 0b00):
        """
        IMODE=10b => current regulation enabled at all times.  [oai_citation:7‡drv8234.pdf](file-service://file-7yaZ4uPmrDYPKvwAsuP62k)
        REG_CTRL:
          00b Fixed Off-Time, 01b Cycle-By-Cycle             [oai_citation:8‡drv8234.pdf](file-service://file-7yaZ4uPmrDYPKvwAsuP62k)
        """
        was_enabled = bool(self.read_reg(REG_CONFIG0) & CFG0_EN_OUT)

        # Starred fields require EN_OUT=0.  [oai_citation:9‡drv8234.pdf](file-service://file-7yaZ4uPmrDYPKvwAsuP62k)
        self.enable_output(False)
        time.sleep(0.002)

        # CONFIG3: IMODE bits [7:6], INT_VREF bit [4]
        c3 = self.read_reg(REG_CONFIG3)
        
        c3 = (c3 & ~0xC0) | ((imode & 0x3) << 6)          # IMODE
        if use_int_vref:
            c3 |= (1 << 4)                               # INT_VREF=1 => 3V internal
        else:
            c3 &= ~(1 << 4)                              # INT_VREF=0 => external VVREF
        # Force SMODE=1 (indication only)
        c3 |= (1 << 5)
        self.write_reg(REG_CONFIG3, c3)

        # REG_CTRL0: REG_CTRL bits [4:3]
        rc0 = self.read_reg(REG_REG_CTRL0)
        rc0 = (rc0 & ~(0x3 << 3)) | ((reg_ctrl & 0x3) << 3)
        self.write_reg(REG_REG_CTRL0, rc0)

        if was_enabled:
            self.enable_output(True)
            time.sleep(0.005)

    # Ripple counting setup
    def enable_ripple(self, enable: bool = True, inv_r: int = 1):
        rc0 = self.read_reg(REG_RC_CTRL0)
        rc0 = (rc0 | 0x80) if enable else (rc0 & ~0x80)
        self.write_reg(REG_RC_CTRL0, rc0)
        if not enable:
            return

        self.write_reg(REG_RC_CTRL1, 0xFF)

        rc2 = self.read_reg(REG_RC_CTRL2)
        rc2 &= ~0x0F
        rc2 |= (0x03 << 2) | 0x03
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
    print("  f [counts]           -> forward counts (default 2000)")
    print("  r [counts]           -> reverse counts (default 2000)")
    print("  brake|stop           -> brake immediately")
    print("  status               -> print fault + RC count + speed")
    print("  ilimit <amps>        -> set current limit (A) via DAC (VREF)")
    print("  vref <volts>         -> set VREF directly (V)")
    print("  dac <0..4095>        -> write raw DAC code")
    print("  clim                 -> show current-limit estimate")
    print("  help                 -> show this help\n")

def move_counts(dev: DRV8234, target: int, forward: bool):
    if target <= 0:
        print("targetCounts must be > 0")
        return

    dev.set_control_mode_phen()
    dev.clear_count()

    if dev.last_dir is not None and dev.last_dir != forward:
        dev.motor_brake()
        time.sleep(0.25)

    dev.motor_forward() if forward else dev.motor_reverse()
    time.sleep(0.05)

    max_seen = 0
    t0 = time.monotonic()
    last_fault_t = 0.0

    while max_seen < (target & 0xFFFF):
        if time.monotonic() - last_fault_t > 0.05:
            fault = dev.get_fault()
            last_fault_t = time.monotonic()
            HARD_FAULT_MASK = 0x10 | 0x04 | 0x02    # STALL, OCP, TSD, NPOR, OVP

            if fault & HARD_FAULT_MASK:
                print("HARD FAULT during move:")
                dev.print_status()
                break

            # If only 0x80 is set, keep going (often just current regulation active in CBC)
            if (fault & 0x80) and not (fault & HARD_FAULT_MASK):
                # optional: print once in a while for debugging
                # print("Current regulation active (not stopping).")
                pass

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
    ap.add_argument("--addr", type=lambda x: int(x, 0), default=0x30, help="DRV8234 7-bit I2C address (default: 0x30)")

    ap.add_argument("--dac-addr", type=lambda x: int(x, 0), default=0x62, help="MCP4725 7-bit I2C addr (default: 0x62)")
    ap.add_argument("--dac-vdd", type=float, default=3.3, help="DAC supply / full-scale voltage (default: 3.3)")
    ap.add_argument("--ripropi", type=float, default=4700.0, help="IPROPI resistor to GND in ohms (default: 4700)")
    ap.add_argument("--aipropi", type=float, default=1500.0, help="AIPROPI gain in uA/A (default: 1500)")
    ap.add_argument("--ilimit", type=float, default=0.25, help="Startup current limit in A (default: 0.25)")
    ap.add_argument("--cbc", action="store_true", help="Use cycle-by-cycle current regulation (REG_CTRL=01b) instead of fixed off-time")
    args = ap.parse_args()

    print("\n=== DRV8234 Serial Move-by-Counts (Ripple) + DAC Current Limit [Radxa/Linux] ===")
    print(f"Using /dev/i2c-{args.bus}, DRV addr=0x{args.addr:02X}, DAC addr=0x{args.dac_addr:02X}")

    with SMBus(args.bus) as bus:
        dev = DRV8234(bus, args.addr)

        print("Probing DRV8234...")
        if not dev.probe():
            print("No ACK from DRV8234. Check pullups/power/nSLEEP/A0/A1 and bus number.")
            sys.exit(1)
        print("ACK OK")

        # DAC init (best-effort)
        dac = MCP4725(bus, addr=args.dac_addr, vdd=args.dac_vdd)
        have_dac = dac.probe()
        if have_dac:
            print("DAC ACK OK")
            # Configure DRV current regulation only if DAC is present (so VREF isn't floating)
            reg_ctrl = 0b00 #0b01 if args.cbc else 0
            dev.configure_current_regulation(imode=0b10, use_int_vref=False, reg_ctrl=reg_ctrl)
            vref_act, itrip_act = dac.set_current_limit(args.ilimit, args.ripropi, args.aipropi)
            print(f"Startup current limit: ITRIP≈{itrip_act:.3f} A (VREF={vref_act:.3f} V, DAC={dac.last_code}/4095)")
        else:
            print("WARNING: DAC not found; current-limit commands disabled (leaving IMODE/VREF alone).")

        print("Configuring driver (safe starred writes)...")
        dev.set_control_mode_phen()
        dev.clear_faults()

        dev.set_ovp_enabled(False)
        dev.clear_faults()

        print("Enabling ripple encoding...")
        dev.enable_ripple(True, inv_r=1)
        dev.clear_count()

        print(f"CONFIG0: 0x{dev.read_reg(REG_CONFIG0):02X}")
        print(f"CONFIG3: 0x{dev.read_reg(REG_CONFIG3):02X}")
        print(f"CONFIG4: 0x{dev.read_reg(REG_CONFIG4):02X}")
        print(f"REG_CTRL0: 0x{dev.read_reg(REG_REG_CTRL0):02X}")
        dev.print_status()

        print_help()
        print("Ready. Type a command (e.g., `f 2000`, `ilimit 0.3`).")

        try:
            while True:
                line = input("> ").strip()
                if not line:
                    continue
                tokens = line.strip().split()
                cmd0 = tokens[0].lower()

                if cmd0 in ("help", "?"):
                    print_help()
                    continue

                if cmd0 in ("brake", "stop"):
                    dev.motor_brake()
                    print("Braked.")
                    continue

                if cmd0 == "status":
                    dev.print_status()
                    print(f"RC_CNT={dev.read_count16()}  SPEED={dev.read_speed()}")
                    continue

                if cmd0 == "clim":
                    if not have_dac or dac.last_code is None:
                        print("No DAC current-limit set.")
                        continue
                    vref = (dac.last_code / 4095.0) * dac.vdd
                    itrip = (vref / args.ripropi) / (args.aipropi * 1e-6)
                    print(f"Current limit estimate: ITRIP≈{itrip:.3f} A (VREF={vref:.3f} V, DAC={dac.last_code}/4095)")
                    continue

                if cmd0 in ("ilimit", "ilim"):
                    if not have_dac:
                        print("DAC not available.")
                        continue
                    if len(tokens) < 2:
                        print("Usage: ilimit <amps>")
                        continue
                    amps = float(tokens[1])
                    vref_act, itrip_act = dac.set_current_limit(amps, args.ripropi, args.aipropi)
                    print(f"Set ITRIP≈{itrip_act:.3f} A (VREF={vref_act:.3f} V, DAC={dac.last_code}/4095)")
                    continue

                if cmd0 == "vref":
                    if not have_dac:
                        print("DAC not available.")
                        continue
                    if len(tokens) < 2:
                        print("Usage: vref <volts>")
                        continue
                    v = float(tokens[1])
                    vref_act = dac.set_voltage(v)
                    itrip_act = (vref_act / args.ripropi) / (args.aipropi * 1e-6)
                    print(f"Set VREF={vref_act:.3f} V -> ITRIP≈{itrip_act:.3f} A (DAC={dac.last_code}/4095)")
                    continue

                if cmd0 == "dac":
                    if not have_dac:
                        print("DAC not available.")
                        continue
                    if len(tokens) < 2:
                        print("Usage: dac <0..4095>")
                        continue
                    code = int(tokens[1], 10)
                    dac.write_code(code)
                    vref = (dac.last_code / 4095.0) * dac.vdd
                    itrip = (vref / args.ripropi) / (args.aipropi * 1e-6)
                    print(f"DAC={dac.last_code}/4095 => VREF={vref:.3f} V -> ITRIP≈{itrip:.3f} A")
                    continue

                if cmd0 in ("f", "r"):
                    counts = DEFAULT_COUNTS
                    if len(tokens) >= 2:
                        try:
                            v = int(tokens[1], 10)
                            if v > 0:
                                counts = v
                        except ValueError:
                            pass

                    if cmd0 == "f":
                        print(f"Command: forward {counts} counts")
                        move_counts(dev, counts, True)
                    else:
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