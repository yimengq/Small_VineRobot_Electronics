#!/usr/bin/env python3
import argparse, time
import spidev

# WS2812-over-SPI 3-bit symbols:
# 0 -> 100, 1 -> 110
SYMBOL_0 = 0b100
SYMBOL_1 = 0b110

def encode_grb(grb: bytes) -> bytearray:
    out = bytearray()
    acc = 0
    acc_bits = 0
    for byte in grb:
        for bit in range(7, -1, -1):
            sym = SYMBOL_1 if ((byte >> bit) & 1) else SYMBOL_0
            acc = (acc << 3) | sym
            acc_bits += 3
            while acc_bits >= 8:
                shift = acc_bits - 8
                out.append((acc >> shift) & 0xFF)
                acc_bits -= 8
                acc &= (1 << acc_bits) - 1
    if acc_bits:
        out.append((acc << (8 - acc_bits)) & 0xFF)
    return out

def send_frame(spi, grb_buf, reset_us):
    spi.xfer2(encode_grb(grb_buf))
    time.sleep(reset_us / 1_000_000.0)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--bus", type=int, default=3)
    ap.add_argument("--dev", type=int, default=0)
    ap.add_argument("--hz",  type=int, default=2_400_000)
    ap.add_argument("--n",   type=int, default=12)
    ap.add_argument("--r",   type=int, default=0)
    ap.add_argument("--g",   type=int, default=0)
    ap.add_argument("--b",   type=int, default=0)
    ap.add_argument("--reset_us", type=int, default=900)     # longer latch helps
    ap.add_argument("--clear_twice", action="store_true")     # for stubborn first LED
    args = ap.parse_args()

    spi = spidev.SpiDev()
    spi.open(args.bus, args.dev)
    spi.max_speed_hz = args.hz
    spi.mode = 0

    # WS2812 uses GRB byte order on the wire
    grb = bytes([args.g & 255, args.r & 255, args.b & 255]) * args.n

    # For OFF, "clear twice" is often the difference on SBCs
    send_frame(spi, grb, args.reset_us)
    if args.clear_twice:
        send_frame(spi, grb, args.reset_us)

    spi.close()

if __name__ == "__main__":
    main()
