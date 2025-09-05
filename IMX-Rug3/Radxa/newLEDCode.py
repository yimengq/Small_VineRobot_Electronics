#!/usr/bin/env python3
# leds_bitbang.py
# Control APA102-style LEDs (white on/off) by bit-banging on Radxa GPIO:
#   CLK -> GPIO line 6  (A6)
#   DIN -> GPIO line 7  (A7)
# Uses libgpiod v2.x API.

import time
import sys
import os
import gpiod

# ===== User settings =====
N_LEDS   = 20             # change to your LED count
CLK_LINE = 6              # A6
DIN_LINE = 7              # A7
CHIP_CANDIDATES = [       # we'll try these in order
    "/dev/gpiochip0",
    "/dev/gpiochip1",
    "/dev/gpiochip2",
    "/dev/gpiochip3",
]

# ===== libgpiod v2 request helper =====
def request_lines_any(chips, clk_line, din_line):
    last_err = None
    for chip in chips:
        if not os.path.exists(chip):
            continue
        try:
            req = gpiod.request_lines(
                chip,
                consumer="led-bitbang",
                config={
                    clk_line: gpiod.LineSettings(
                        direction=gpiod.LineDirection.OUTPUT,
                        output_value=0
                    ),
                    din_line: gpiod.LineSettings(
                        direction=gpiod.LineDirection.OUTPUT,
                        output_value=0
                    ),
                },
            )
            print(f"[GPIO] Using {chip} (CLK=line {clk_line}, DIN=line {din_line})")
            return req, chip
        except Exception as e:
            last_err = e
    raise RuntimeError(f"Could not request lines on any chip ({chips}). "
                       f"Last error: {last_err}")

# ===== Bit-bang primitives =====
def pulse_clk(req, clk_line):
    # short high-low pulse; tweak sleeps if needed for timing
    req.set_value(clk_line, 1)
    # Very short delay for stability; can be reduced
    # Removing sleeps will make it as fast as Python can toggle.
    # time.sleep(0.000001)
    req.set_value(clk_line, 0)
    # time.sleep(0.000001)

def shift_out_byte(req, clk_line, din_line, val):
    # MSB first
    for i in range(7, -1, -1):
        req.set_value(din_line, (val >> i) & 1)
        pulse_clk(req, clk_line)

def send_bytes(req, clk_line, din_line, data_bytes):
    for b in data_bytes:
        shift_out_byte(req, clk_line, din_line, b)

# ===== APA102 minimal protocol (global brightness max, white/black only) =====
def apa102_show(req, clk_line, din_line, n_leds, on=True):
    # Start frame: 32 zeros
    send_bytes(req, clk_line, din_line, [0x00, 0x00, 0x00, 0x00])

    # LED frames: 0b111xxxxx as brightness (0xE0..0xFF), then B, G, R
    # We'll use full brightness (0xFF) and white (255,255,255) or black (0,0,0)
    if on:
        led_frame = [0xFF, 0xFF, 0xFF, 0xFF]   # full white
    else:
        led_frame = [0xFF, 0x00, 0x00, 0x00]   # off (black)

    for _ in range(n_leds):
        send_bytes(req, clk_line, din_line, led_frame)

    # End frame: enough 1s to latch (use 32 ones)
    send_bytes(req, clk_line, din_line, [0xFF, 0xFF, 0xFF, 0xFF])

def main():
    # Request lines (auto-pick chip)
    try:
        req, chip_used = request_lines_any(CHIP_CANDIDATES, CLK_LINE, DIN_LINE)
    except Exception as e:
        print(e)
        sys.exit(1)

    print("Controls: 'o' = ON (white), 'f' = OFF, 'q' = quit")
    try:
        while True:
            try:
                cmd = input("> ").strip().lower()
            except EOFError:
                break

            if cmd == "o":
                print("Turning LEDs ON (white)")
                apa102_show(req, CLK_LINE, DIN_LINE, N_LEDS, on=True)
            elif cmd == "f":
                print("Turning LEDs OFF")
                apa102_show(req, CLK_LINE, DIN_LINE, N_LEDS, on=False)
            elif cmd == "q":
                break
            elif cmd == "":
                # ignore empty line
                continue
            else:
                print("Unknown command, use o/f/q")
    finally:
        # Drive lines low and release
        try:
            req.set_value(CLK_LINE, 0)
            req.set_value(DIN_LINE, 0)
        except Exception:
            pass
        try:
            req.release()
        except Exception:
            pass
        print("GPIO released, exiting.")

if __name__ == "__main__":
    # Helpful reminder
    if os.geteuid() != 0:
        print("Tip: run with sudo for GPIO access (sudo python3 leds_bitbang.py)")
    main()