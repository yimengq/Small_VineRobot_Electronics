#!/usr/bin/env python3
"""
Check that 4 I2C devices respond on a given bus.

- DRV8234 at 0x31 and 0x34: probe by reading REG_FAULT (0x00)
- MCP4725 at 0x62 and 0x63: probe by doing a 2-byte "fast mode" write of code=0

Run:
  sudo python3 i2c_check4.py --bus 5
"""

import argparse
import errno
from smbus2 import SMBus, i2c_msg

DRV_ADDRS = [0x31, 0x34]
DAC_ADDRS = [0x62, 0x63]

REG_FAULT = 0x00  # DRV8234 fault register


def fmt_err(e: OSError) -> str:
    return f"{e} (errno={getattr(e, 'errno', None)})"


def drv_read_reg_rs(bus: SMBus, addr: int, reg: int) -> int:
    """Repeated-start style: write reg pointer then read 1 byte in one i2c_rdwr call."""
    w = i2c_msg.write(addr, [reg & 0xFF])
    r = i2c_msg.read(addr, 1)
    bus.i2c_rdwr(w, r)
    return list(r)[0] & 0xFF


def drv_read_reg_stop(bus: SMBus, addr: int, reg: int) -> int:
    """STOP-separated style: write reg pointer (STOP), then read 1 byte (STOP)."""
    bus.i2c_rdwr(i2c_msg.write(addr, [reg & 0xFF]))
    r = i2c_msg.read(addr, 1)
    bus.i2c_rdwr(r)
    return list(r)[0] & 0xFF


def probe_drv(bus: SMBus, addr: int) -> tuple[bool, str]:
    """
    Probe DRV by reading REG_FAULT.
    Try repeated-start first, then STOP-separated if ENXIO occurs.
    """
    try:
        v = drv_read_reg_rs(bus, addr, REG_FAULT)
        return True, f"ACK (RS) REG_FAULT=0x{v:02X}"
    except OSError as e:
        # If it's a NACK, try STOP-separated transaction
        if getattr(e, "errno", None) == errno.ENXIO:
            try:
                v = drv_read_reg_stop(bus, addr, REG_FAULT)
                return True, f"ACK (STOP) REG_FAULT=0x{v:02X}"
            except OSError as e2:
                return False, f"NACK/ERR (STOP): {fmt_err(e2)}"
        return False, f"ERR (RS): {fmt_err(e)}"


def probe_dac(bus: SMBus, addr: int) -> tuple[bool, str]:
    """
    Probe MCP4725 by doing a 2-byte fast-mode write with code=0, pd=0.
    If the address is wrong or missing, you'll usually get ENXIO.
    """
    b0 = 0x00  # pd=0, high nibble of code=0
    b1 = 0x00  # low byte of code=0
    try:
        bus.i2c_rdwr(i2c_msg.write(addr, [b0, b1]))
        return True, "ACK (fast write 0x000)"
    except OSError as e:
        return False, f"NACK/ERR: {fmt_err(e)}"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--bus", type=int, default=5, help="I2C bus number (e.g. 5 for /dev/i2c-5)")
    args = ap.parse_args()

    print(f"Checking /dev/i2c-{args.bus}")
    print("Devices: DRV8234 @ 0x31,0x34 | MCP4725 @ 0x62,0x63\n")

    with SMBus(args.bus) as bus:
        for a in DRV_ADDRS:
            ok, msg = probe_drv(bus, a)
            print(f"DRV 0x{a:02X}: {'OK' if ok else 'FAIL'} - {msg}")

        for a in DAC_ADDRS:
            ok, msg = probe_dac(bus, a)
            print(f"DAC 0x{a:02X}: {'OK' if ok else 'FAIL'} - {msg}")

    print("\nTip: if you see errno=13, run with sudo or add your user to the i2c group.")


if __name__ == "__main__":
    main()