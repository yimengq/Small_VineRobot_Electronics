#!/usr/bin/env python3
import spidev

N = 3                # total LEDs on your strip (change me)
BUS, DEV = 3, 0        # /dev/spidev3.0
HZ = 1_000_000         # 1 MHz SPI
BRIGHT = 31            # 0..31 APA102 global brightness

spi = spidev.SpiDev()
spi.open(BUS, DEV)
spi.max_speed_hz = HZ
spi.mode = 0

# Build frame:
# start frame: 4x 0x00
start = [0x00, 0x00, 0x00, 0x00]

# first 3 LEDs: white (R=G=B=255), APA102 order is [0b111xxxxx, B, G, R]
on = [ (0b11100000 | BRIGHT, 255, 255, 255) ] * 3

# remaining LEDs off
off = [ (0b11100000 | BRIGHT, 0, 0, 0) ] * (N - 3)

# end frame: at least ceil(N/16) bytes of 0xFF
end = [0xFF] * ((N + 15) // 16)

frame = start + [b for led in (on + off) for b in led] + end
spi.xfer2(frame)
spi.close()