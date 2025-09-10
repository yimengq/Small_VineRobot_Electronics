#!/usr/bin/env python3
import gpiod
import time
import sys

# ===== Pin mapping (check with gpioinfo!) =====
CHIP_NAME = "/dev/gpiochip3"   # adjust if needed
PIN_CLK   = 6   # A6
PIN_DIN   = 7   # A7
N_LEDS    = 6 # adjust to your LED count

# ===== Clock rate (5 kHz) =====
CLK_HZ   = 500000
_DELAY_S = 1.0 / (2.0 * CLK_HZ)  # 100 µs high, 100 µs low

# ===== Setup =====
chip = gpiod.Chip(CHIP_NAME)
clk  = chip.get_line(PIN_CLK)
din  = chip.get_line(PIN_DIN)

clk.request(consumer="led-clk", type=gpiod.LINE_REQ_DIR_OUT, default_vals=[0])
din.request(consumer="led-din", type=gpiod.LINE_REQ_DIR_OUT, default_vals=[0])

def pulse_clk():
    clk.set_value(1)
    time.sleep(_DELAY_S)
    clk.set_value(0)
    time.sleep(_DELAY_S)

def send_frame(data):
    # small guard: idle low before shifting
    din.set_value(0); clk.set_value(0)
    for b in data:
        for i in range(7, -1, -1):  # MSB first
            din.set_value((b >> i) & 1)
            pulse_clk()
    # idle low after
    din.set_value(0); clk.set_value(0)

def _latch(n_leds):
    # End frame: ceil(N/16) bytes of 0xFF + 1 extra for safety
    end_len = (n_leds + 15) // 16 + 1
    send_frame([0xFF] * end_len)
    # brief settle
    time.sleep(0.0001)
    din.set_value(0); clk.set_value(0)

def apa102_show(n_leds, on=True, bright=10, r=255, g=255, b=255):
    """Show all LEDs white (on) or black (off) using robust APA102 framing."""
    # Start frame (32 zeros)
    send_frame([0x00, 0x00, 0x00, 0x00])

    if on:
        hdr = 0xE0 | max(1, min(31, int(bright)))  # 1..31
        led = [hdr, b & 0xFF, g & 0xFF, r & 0xFF]
    else:
        hdr = 0xE0 | 0  # brightness=0 + colors=0 = black
        led = [hdr, 0x00, 0x00, 0x00]

    for _ in range(n_leds):
        send_frame(led)

    _latch(n_leds)

    # Some SK9822/APA102 clones need an extra flush when turning OFF
    if not on:
        send_frame([0x00, 0x00, 0x00, 0x00])
        for _ in range(n_leds):
            send_frame(led)
        _latch(n_leds)


print("Controls: 'o' = ON, 'f' = OFF, 'q' = quit")
try:
    while True:
        cmd = input("> ").strip().lower()
        if cmd == "o":
            print("Turning LEDs ON (white)")
            apa102_show(N_LEDS, on=True)
        elif cmd == "f":
            print("Turning LEDs OFF")
            apa102_show(N_LEDS, on=False)
        elif cmd == "q":
            break
        else:
            print("Unknown command, use o/f/q")
finally:
    clk.set_value(0)
    din.set_value(0)
    clk.release()
    din.release()
    chip.close()
    print("GPIO released, exiting.")
