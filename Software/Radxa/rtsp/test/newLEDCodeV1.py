#!/usr/bin/env python3
import gpiod
import time
import sys

# ===== Pin mapping (check with gpioinfo!) =====
CHIP_NAME = "/dev/gpiochip2"   # adjust if needed
PIN_CLK   = 6   # A6
PIN_DIN   = 7   # A7
N_LEDS    = 20  # adjust to your LED count

# ===== Setup =====
chip = gpiod.Chip(CHIP_NAME)
clk  = chip.get_line(PIN_CLK)
din  = chip.get_line(PIN_DIN)

clk.request(consumer="led-clk", type=gpiod.LINE_REQ_DIR_OUT, default_vals=[0])
din.request(consumer="led-din", type=gpiod.LINE_REQ_DIR_OUT, default_vals=[0])

def pulse_clk():
    clk.set_value(1)
    clk.set_value(0)

def shift_out_byte(val):
    for i in range(7, -1, -1):  # MSB first
        din.set_value((val >> i) & 1)
        pulse_clk()

def send_frame(data):
    for b in data:
        shift_out_byte(b)

def apa102_show(n_leds, on=True):
    """Show all LEDs white (on) or black (off)."""
    # Start frame
    send_frame([0x00,0x00,0x00,0x00])
    # LED frames
    led_on  = [0xFF, 0xFF, 0xFF, 0xFF]  # full white
    led_off = [0xFF, 0x00, 0x00, 0x00]  # off
    frame = led_on if on else led_off
    for _ in range(n_leds):
        send_frame(frame)
    # End frame
    send_frame([0xFF,0xFF,0xFF,0xFF])

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