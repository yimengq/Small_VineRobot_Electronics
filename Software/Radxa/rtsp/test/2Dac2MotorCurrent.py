#!/usr/bin/env python3
import argparse
import sys
import time
import errno
import math
from smbus2 import SMBus, i2c_msg

# --- DRV8234 Registers ---
REG_FAULT      = 0x00
REG_CONFIG0    = 0x09
REG_CONFIG3    = 0x0C  # IMODE[7:6], SMODE[5], INT_VREF[4]
REG_CONFIG4    = 0x0D
REG_REG_CTRL0  = 0x0E  # REG_CTRL[4:3]

REG_RC_STATUS1 = 0x01  # SPEED[7:0]
REG_RC_STATUS2 = 0x02  # RC_CNT[7:0]
REG_RC_STATUS3 = 0x03  # RC_CNT[15:8]

REG_RC_CTRL0   = 0x11  # EN_RC (bit7)
REG_RC_CTRL1   = 0x12
REG_RC_CTRL2   = 0x13
REG_RC_CTRL3   = 0x14

# --- Bit masks ---
CFG0_EN_OUT    = 0x80
CFG0_CLR_FLT   = 0x02
CFG0_CLR_CNT   = 0x04

CFG4_PMODE     = 0x08  # writable only when EN_OUT=0
CFG4_I2C_BC    = 0x04  # writable only when EN_OUT=0
CFG4_I2C_EN1   = 0x02
CFG4_I2C_PH2   = 0x01

DEFAULT_COUNTS = 2000
MOVE_TIMEOUT_S = 8.0

# --------- MCP4725 DAC helper ---------
class MCP4725:
    """
    MCP4725 fast mode (2-byte) write:
      [00 PD1 PD0 D11..D8] [D7..D0]
    """
    def __init__(self, bus: SMBus, addr: int, vdd: float = 3.3, name: str = "DAC"):
        self.bus = bus
        self.addr = addr
        self.vdd = float(vdd)
        self.name = name
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
        b0 = ((pd & 0x3) << 4) | ((code >> 8) & 0x0F)
        b1 = code & 0xFF
        self.bus.i2c_rdwr(i2c_msg.write(self.addr, [b0, b1]))
        self.last_code = code

    def set_voltage(self, vout: float) -> float:
        if self.vdd <= 0:
            raise ValueError("DAC vdd must be > 0")
        v = max(0.0, min(self.vdd, float(vout)))
        code = int(round((v / self.vdd) * 4095.0))
        self.write_code(code)
        return (code / 4095.0) * self.vdd

    def set_current_limit(self, amps: float, ripropi_ohm: float, aipropi_uA_per_A: float):
        # VVREF = ITRIP * AIPROPI * RIPROPI
        amps = float(amps)
        vref_cmd = amps * (aipropi_uA_per_A * 1e-6) * ripropi_ohm
        vref_act = self.set_voltage(vref_cmd)
        itrip_act = (vref_act / ripropi_ohm) / (aipropi_uA_per_A * 1e-6)
        return vref_act, itrip_act

# --------- INA219 helper ---------
class INA219:
    # Register pointers
    REG_CONFIG   = 0x00
    REG_SHUNT_V  = 0x01
    REG_BUS_V    = 0x02
    REG_POWER    = 0x03
    REG_CURRENT  = 0x04
    REG_CAL      = 0x05

    # Common default config (32V range, PGA=/8, 12-bit, continuous)
    DEFAULT_CONFIG = 0x399F

    def __init__(self, bus: SMBus, addr: int = 0x40, rshunt_ohm: float = 0.1,
                 max_expected_current_a: float = 1.0, name: str = "INA219"):
        self.bus = bus
        self.addr = int(addr)
        self.rshunt = float(rshunt_ohm)
        self.max_expected_current = float(max_expected_current_a)
        self.name = name

        self.current_lsb = None  # A/bit
        self.power_lsb = None    # W/bit
        self.cal = None

    def _read_u16(self, reg: int) -> int:
        w = i2c_msg.write(self.addr, [reg & 0xFF])
        r = i2c_msg.read(self.addr, 2)
        self.bus.i2c_rdwr(w, r)
        b = list(r)
        return ((b[0] << 8) | b[1]) & 0xFFFF

    def _read_s16(self, reg: int) -> int:
        v = self._read_u16(reg)
        return v - 0x10000 if (v & 0x8000) else v

    def _write_u16(self, reg: int, val: int):
        val &= 0xFFFF
        self.bus.i2c_rdwr(i2c_msg.write(self.addr, [reg & 0xFF, (val >> 8) & 0xFF, val & 0xFF]))

    def probe(self) -> bool:
        try:
            _ = self._read_u16(self.REG_CONFIG)
            return True
        except OSError:
            return False

    def configure(self, config: int = None):
        if config is None:
            config = self.DEFAULT_CONFIG
        self._write_u16(self.REG_CONFIG, int(config) & 0xFFFF)

    @staticmethod
    def _round_up_nice(x: float) -> float:
        # round up to 1/2/5 * 10^n
        if x <= 0:
            return 1e-6
        exp = math.floor(math.log10(x))
        base = x / (10 ** exp)
        for m in (1.0, 2.0, 5.0, 10.0):
            if base <= m:
                return m * (10 ** exp)
        return 10.0 * (10 ** exp)

    def calibrate(self, current_lsb_a: float = None):
        """
        Typical datasheet formulas:
          min Current_LSB = MaxExpectedCurrent / 2^15
          Cal = trunc(0.04096 / (Current_LSB * RSHUNT))
          Power_LSB = 20 * Current_LSB
        """
        if self.rshunt <= 0:
            raise ValueError("INA219 rshunt must be > 0")

        min_lsb = self.max_expected_current / 32768.0
        if current_lsb_a is None:
            current_lsb_a = self._round_up_nice(min_lsb)

        cal = int(0.04096 / (current_lsb_a * self.rshunt))
        cal = max(1, min(0xFFFE, cal))

        self._write_u16(self.REG_CAL, cal)

        self.current_lsb = float(current_lsb_a)
        self.power_lsb = 20.0 * self.current_lsb
        self.cal = cal
        return cal, self.current_lsb

    def shunt_voltage_mV(self) -> float:
        # Shunt Voltage LSB = 10 uV => 0.01 mV
        raw = self._read_s16(self.REG_SHUNT_V)
        return raw * 0.01

    def bus_voltage_V(self) -> float:
        # Bus voltage: shift right 3, LSB = 4 mV
        raw = self._read_u16(self.REG_BUS_V)
        return ((raw >> 3) & 0x1FFF) * 0.004

    def current_A(self) -> float:
        if not self.current_lsb or not self.cal:
            return float("nan")
        raw = self._read_s16(self.REG_CURRENT)
        return raw * self.current_lsb

    def power_W(self) -> float:
        if not self.power_lsb or not self.cal:
            return float("nan")
        raw = self._read_u16(self.REG_POWER)
        return raw * self.power_lsb

    def print_reading(self):
        try:
            vbus = self.bus_voltage_V()
            vsh_mV = self.shunt_voltage_mV()
            iA = self.current_A()
            pW = self.power_W()
            print(f"[{self.name}] VBUS={vbus:.3f} V | VSHUNT={vsh_mV:.2f} mV | I={iA:.3f} A | P={pW:.2f} W")
        except OSError as e:
            print(f"[{self.name}] Read failed: {e}")

class DRV8234:
    def __init__(self, bus: SMBus, addr: int, name: str):
        self.bus = bus
        self.addr = addr
        self.name = name
        self.last_dir = None

    def read_reg(self, reg: int) -> int:
        w = i2c_msg.write(self.addr, [reg & 0xFF])
        r = i2c_msg.read(self.addr, 1)
        self.bus.i2c_rdwr(w, r)
        return list(r)[0] & 0xFF

    def read_reg_stop(self, reg: int) -> int:
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
        self.bus.i2c_rdwr(i2c_msg.write(self.addr, [reg & 0xFF, val & 0xFF]))

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
        print(f"[{self.name}] Fault Register: 0x{f:02X}")
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

    def configure_current_regulation(self, imode: int = 0b10, use_int_vref: bool = False, reg_ctrl: int = 0b00):
        """
        IMODE=10b => current regulation enabled at all times.
        Force SMODE=1 (indication only) so it doesn't shut off outputs.
        REG_CTRL:
          00b Fixed Off-Time, 01b Cycle-By-Cycle
        """
        was_enabled = bool(self.read_reg(REG_CONFIG0) & CFG0_EN_OUT)

        self.enable_output(False)
        time.sleep(0.002)

        c3 = self.read_reg(REG_CONFIG3)
        c3 = (c3 & ~0xC0) | ((imode & 0x3) << 6)
        if use_int_vref:
            c3 |= (1 << 4)
        else:
            c3 &= ~(1 << 4)
        c3 |= (1 << 5)  # SMODE=1
        self.write_reg(REG_CONFIG3, c3)

        rc0 = self.read_reg(REG_REG_CTRL0)
        rc0 = (rc0 & ~(0x3 << 3)) | ((reg_ctrl & 0x3) << 3)
        self.write_reg(REG_REG_CTRL0, rc0)

        if was_enabled:
            self.enable_output(True)
            time.sleep(0.005)

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
    print("  m <1|2>                -> select active motor (default 1)")
    print("  f [counts] / r [counts] -> move active motor")
    print("  brake|stop              -> brake active motor")
    print("  status                  -> status active motor")
    print("  1f/2f/1r/2r/...          -> prefix 1 or 2 to target a motor explicitly")
    print("  brakeall / statusall     -> both motors")
    print("  ilimit <amps>            -> set current limit (active motor's DAC)")
    print("  vref <volts>             -> set VREF (active motor's DAC)")
    print("  dac <0..4095>            -> raw DAC code (active motor's DAC)")
    print("  clim                     -> show current-limit estimate (active motor)")
    print("  ilimitall <amps>         -> set current limit for both motors")
    print("  ina                      -> print INA219 bus voltage/current/power (if present)")
    print("  help                     -> show this help\n")

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

            HARD_FAULT_MASK = 0x10 | 0x08 | 0x04 | 0x02  # OCP|OVP|TSD|NPOR
            if fault & HARD_FAULT_MASK:
                print(f"[{dev.name}] HARD FAULT during move:")
                dev.print_status()
                break

        now = dev.read_count16_stable()
        if now > max_seen:
            max_seen = now

        if (time.monotonic() - t0) > MOVE_TIMEOUT_S:
            print(f"[{dev.name}] Move timeout!")
            break

        time.sleep(0.1)

    dev.motor_brake()
    time.sleep(0.010)
    final_now = dev.read_count16_stable()
    dev.last_dir = forward

    print(f"[{dev.name}] Move done. Dir={'FWD' if forward else 'REV'} target={target} "
          f"achieved(maxSeen)={max_seen} final_RC_CNT={final_now}")

def setup_driver(dev: DRV8234, reg_ctrl: int, disable_ovp: bool = True):
    dev.set_control_mode_phen()
    dev.clear_faults()
    if disable_ovp:
        dev.set_ovp_enabled(False)
        dev.clear_faults()
    dev.configure_current_regulation(imode=0b10, use_int_vref=False, reg_ctrl=reg_ctrl)
    dev.enable_ripple(True, inv_r=1)
    dev.clear_count()

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--bus", type=int, default=5)

    ap.add_argument("--addr1", type=lambda x: int(x, 0), default=0x30, help="Motor1 DRV8234 addr")
    ap.add_argument("--addr2", type=lambda x: int(x, 0), default=0x32, help="Motor2 DRV8234 addr")

    ap.add_argument("--dac1-addr", type=lambda x: int(x, 0), default=0x62, help="DAC1 addr (motor1 VREF)")
    ap.add_argument("--dac2-addr", type=lambda x: int(x, 0), default=0x63, help="DAC2 addr (motor2 VREF)")
    ap.add_argument("--dac-vdd", type=float, default=3.3)

    ap.add_argument("--ripropi", type=float, default=4700.0)
    ap.add_argument("--aipropi", type=float, default=1500.0)

    ap.add_argument("--ilimit1", type=float, default=0.25, help="Startup current limit motor1 (A)")
    ap.add_argument("--ilimit2", type=float, default=0.25, help="Startup current limit motor2 (A)")

    ap.add_argument("--cbc", action="store_true")

    # INA219
    ap.add_argument("--ina-addr", type=lambda x: int(x, 0), default=0x40, help="INA219 addr")
    ap.add_argument("--ina-rshunt", type=float, default=0.1, help="INA219 shunt resistor (ohms)")
    ap.add_argument("--ina-max-a", type=float, default=1.0, help="INA219 expected max current (A) for calibration")

    args = ap.parse_args()

    print("\n=== Dual DRV8234 + Dual DAC Current Limit (independent) + INA219 Telemetry ===")
    print(f"/dev/i2c-{args.bus}")
    print(f"M1 DRV=0x{args.addr1:02X} DAC1=0x{args.dac1_addr:02X} | M2 DRV=0x{args.addr2:02X} DAC2=0x{args.dac2_addr:02X}")
    print(f"INA219=0x{args.ina_addr:02X} Rshunt={args.ina_rshunt:g}Ω Imax={args.ina_max_a:g}A")

    with SMBus(args.bus) as bus:
        dev1 = DRV8234(bus, args.addr1, "M1")
        dev2 = DRV8234(bus, args.addr2, "M2")
        dac1 = MCP4725(bus, args.dac1_addr, vdd=args.dac_vdd, name="DAC1")
        dac2 = MCP4725(bus, args.dac2_addr, vdd=args.dac_vdd, name="DAC2")

        ina = INA219(bus, addr=args.ina_addr, rshunt_ohm=args.ina_rshunt,
                     max_expected_current_a=args.ina_max_a, name="INA219")

        # Probe drivers
        if not dev1.probe():
            print("No ACK from M1 DRV8234"); sys.exit(1)
        if not dev2.probe():
            print("No ACK from M2 DRV8234"); sys.exit(1)
        print("Both drivers ACK OK")

        # Probe DACs
        have_dac1 = dac1.probe()
        have_dac2 = dac2.probe()
        if not have_dac1:
            print("WARNING: DAC1 not found (M1 current limit control unavailable)")
        if not have_dac2:
            print("WARNING: DAC2 not found (M2 current limit control unavailable)")

        # Probe INA219
        have_ina = ina.probe()
        if have_ina:
            ina.configure()
            cal, lsb = ina.calibrate()
            print(f"INA219 ACK OK: CAL=0x{cal:04X}, Current_LSB={lsb*1e3:.3f} mA/bit")
            ina.print_reading()
        else:
            print("WARNING: INA219 not found (no voltage/current telemetry)")

        reg_ctrl = 0b01 if args.cbc else 0b00

        print("Configuring M1...")
        setup_driver(dev1, reg_ctrl=reg_ctrl, disable_ovp=True)
        print("Configuring M2...")
        setup_driver(dev2, reg_ctrl=reg_ctrl, disable_ovp=True)

        # Set startup current limits (independent)
        if have_dac1:
            vref1, itrip1 = dac1.set_current_limit(args.ilimit1, args.ripropi, args.aipropi)
            print(f"M1 startup ITRIP≈{itrip1:.3f}A (VREF={vref1:.3f}V, DAC1={dac1.last_code}/4095)")
        if have_dac2:
            vref2, itrip2 = dac2.set_current_limit(args.ilimit2, args.ripropi, args.aipropi)
            print(f"M2 startup ITRIP≈{itrip2:.3f}A (VREF={vref2:.3f}V, DAC2={dac2.last_code}/4095)")

        active = 1
        print_help()

        def get_dev(n: int) -> DRV8234:
            return dev1 if n == 1 else dev2

        def get_dac(n: int) -> MCP4725:
            return dac1 if n == 1 else dac2

        def have_dac(n: int) -> bool:
            return have_dac1 if n == 1 else have_dac2

        try:
            while True:
                line = input("> ").strip()
                if not line:
                    continue

                tokens = line.split()
                cmd0 = tokens[0].lower()

                # prefix: "1ilimit", "2f", "1status", etc.
                explicit = None
                if cmd0[0] in ("1", "2") and len(cmd0) >= 2:
                    explicit = int(cmd0[0])
                    cmd0 = cmd0[1:]

                motor = explicit if explicit else active
                dev = get_dev(motor)
                dac = get_dac(motor)

                if cmd0 in ("help", "?"):
                    print_help()
                    continue

                if cmd0 == "m":
                    if len(tokens) < 2:
                        print("Usage: m <1|2>")
                        continue
                    try:
                        v = int(tokens[1], 10)
                        if v in (1, 2):
                            active = v
                            print(f"Active motor = M{active}")
                        else:
                            print("Motor must be 1 or 2.")
                    except ValueError:
                        print("Usage: m <1|2>")
                    continue

                if cmd0 == "brakeall":
                    dev1.motor_brake(); dev2.motor_brake()
                    print("Braked both motors.")
                    continue

                if cmd0 == "statusall":
                    dev1.print_status(); print(f"[M1] RC_CNT={dev1.read_count16()} SPEED={dev1.read_speed()}")
                    dev2.print_status(); print(f"[M2] RC_CNT={dev2.read_count16()} SPEED={dev2.read_speed()}")
                    if have_ina:
                        ina.print_reading()
                    continue

                if cmd0 in ("brake", "stop"):
                    dev.motor_brake()
                    print(f"Braked {dev.name}.")
                    continue

                if cmd0 == "status":
                    dev.print_status()
                    print(f"[{dev.name}] RC_CNT={dev.read_count16()}  SPEED={dev.read_speed()}")
                    if have_ina:
                        ina.print_reading()
                    continue

                if cmd0 == "ina":
                    if not have_ina:
                        print("INA219 not available.")
                    else:
                        ina.print_reading()
                    continue

                # DAC commands (per-motor)
                if cmd0 == "clim":
                    if not have_dac(motor) or dac.last_code is None:
                        print(f"{dev.name}: No DAC current-limit set.")
                        continue
                    vref = (dac.last_code / 4095.0) * dac.vdd
                    itrip = (vref / args.ripropi) / (args.aipropi * 1e-6)
                    print(f"{dev.name}: ITRIP≈{itrip:.3f} A (VREF={vref:.3f} V, {dac.name}={dac.last_code}/4095)")
                    continue

                if cmd0 in ("ilimit", "ilim"):
                    if not have_dac(motor):
                        print(f"{dev.name}: DAC not available.")
                        continue
                    if len(tokens) < 2:
                        print("Usage: ilimit <amps>")
                        continue
                    amps = float(tokens[1])
                    vref_act, itrip_act = dac.set_current_limit(amps, args.ripropi, args.aipropi)
                    print(f"{dev.name}: Set ITRIP≈{itrip_act:.3f} A (VREF={vref_act:.3f} V, {dac.name}={dac.last_code}/4095)")
                    continue

                if cmd0 == "ilimitall":
                    if len(tokens) < 2:
                        print("Usage: ilimitall <amps>")
                        continue
                    amps = float(tokens[1])
                    if have_dac1:
                        v1, i1 = dac1.set_current_limit(amps, args.ripropi, args.aipropi)
                        print(f"M1: ITRIP≈{i1:.3f}A (VREF={v1:.3f}V, DAC1={dac1.last_code}/4095)")
                    if have_dac2:
                        v2, i2 = dac2.set_current_limit(amps, args.ripropi, args.aipropi)
                        print(f"M2: ITRIP≈{i2:.3f}A (VREF={v2:.3f}V, DAC2={dac2.last_code}/4095)")
                    continue

                if cmd0 == "vref":
                    if not have_dac(motor):
                        print(f"{dev.name}: DAC not available.")
                        continue
                    if len(tokens) < 2:
                        print("Usage: vref <volts>")
                        continue
                    v = float(tokens[1])
                    vref_act = dac.set_voltage(v)
                    itrip_act = (vref_act / args.ripropi) / (args.aipropi * 1e-6)
                    print(f"{dev.name}: VREF={vref_act:.3f} V -> ITRIP≈{itrip_act:.3f} A ({dac.name}={dac.last_code}/4095)")
                    continue

                if cmd0 == "dac":
                    if not have_dac(motor):
                        print(f"{dev.name}: DAC not available.")
                        continue
                    if len(tokens) < 2:
                        print("Usage: dac <0..4095>")
                        continue
                    code = int(tokens[1], 10)
                    dac.write_code(code)
                    vref = (dac.last_code / 4095.0) * dac.vdd
                    itrip = (vref / args.ripropi) / (args.aipropi * 1e-6)
                    print(f"{dev.name}: {dac.name}={dac.last_code}/4095 => VREF={vref:.3f} V -> ITRIP≈{itrip:.3f} A")
                    continue

                # move commands
                if cmd0 in ("f", "r"):
                    counts = DEFAULT_COUNTS
                    if len(tokens) >= 2:
                        try:
                            v = int(tokens[1], 10)
                            if v > 0:
                                counts = v
                        except ValueError:
                            pass
                    forward = (cmd0 == "f")
                    print(f"{dev.name}: {'forward' if forward else 'reverse'} {counts} counts")
                    move_counts(dev, counts, forward)
                    continue

                print("Unknown command. Type `help`.")

        except (KeyboardInterrupt, EOFError):
            print("\nExiting: braking both motors.")
            try:
                dev1.motor_brake()
                dev2.motor_brake()
            except Exception:
                pass

if __name__ == "__main__":
    main()