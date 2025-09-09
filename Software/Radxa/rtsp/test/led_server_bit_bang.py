#!/usr/bin/env python3
"""
Bit-banged APA102 LED server

- Replaces spidev with libgpiod line toggling to match newLEDCodeV1.py
- Uses the same chip + pins:
    CHIP_NAME = "/dev/gpiochip2"
    CLK (SCK) = line 6 (A6)
    DIN (MOSI)= line 7 (A7)
- Exposes two endpoints:
    POST /on  -> all LEDs white
    POST /off -> all LEDs off
"""

import time
import gpiod
from aiohttp import web

# ===== Pin mapping (copied to match newLEDCodeV1.py) =====
CHIP_NAME = "/dev/gpiochip2"   # adjust if needed
PIN_CLK   = 6   # A6
PIN_DIN   = 7   # A7
N_LEDS    = 20  # adjust to your LED count
BRIGHT    = 31  # 0..31 (global brightness); max for visibility

# ===== libgpiod (v1) setup =====
chip = gpiod.Chip(CHIP_NAME)
clk  = chip.get_line(PIN_CLK)
din  = chip.get_line(PIN_DIN)

clk.request(consumer="led_server_clk", type=gpiod.LINE_REQ_DIR_OUT, default_vals=[0])
din.request(consumer="led_server_din", type=gpiod.LINE_REQ_DIR_OUT, default_vals=[0])

def _clk_high():
    clk.set_value(1)

def _clk_low():
    clk.set_value(0)

def _mosi(v: int):
    din.set_value(1 if v else 0)

# A tiny delay so bit-bang timing isn't too fast for long lines
# ~200 ns to a few µs is fine. We'll use ~1 µs.
_DELAY_S = 1e-6

def _tick():
    _clk_high()
    time.sleep(_DELAY_S)
    _clk_low()
    time.sleep(_DELAY_S)

def _send_byte(b: int):
    # MSB first for APA102
    for i in range(7, -1, -1):
        _mosi((b >> i) & 1)
        _tick()

def _send_bytes(buf: bytes):
    for b in buf:
        _send_byte(b)

def _frame_all(r: int, g: int, b: int) -> bytes:
    # APA102 frames: start, per-LED (0b111BBBBB, B, G, R), end
    start = bytes([0x00, 0x00, 0x00, 0x00])
    led   = bytes([0b11100000 | (BRIGHT & 0x1F), b & 0xFF, g & 0xFF, r & 0xFF])
    leds  = led * N_LEDS
    end   = bytes([0xFF] * ((N_LEDS + 15) // 16))
    return start + leds + end

def _write(buf: bytes):
    # Drive the APA102 string using bit-bang
    _send_bytes(buf)

# ===== Web handlers =====
async def led_on(_):
    _write(_frame_all(255, 255, 255))
    return web.json_response({"ok": True, "state": "on", "n": N_LEDS})

async def led_off(_):
    _write(_frame_all(0, 0, 0))
    return web.json_response({"ok": True, "state": "off", "n": N_LEDS})

# (Optional) dynamic set with JSON like {"r":255,"g":80,"b":0,"bright":20}
async def led_set(request):
    try:
        data = await request.json()
    except Exception:
        data = {}
    r = int(data.get("r", 255))
    g = int(data.get("g", 255))
    b = int(data.get("b", 255))
    global BRIGHT
    if "bright" in data:
        BRIGHT = max(0, min(31, int(data["bright"])))
    _write(_frame_all(r, g, b))
    return web.json_response({"ok": True, "state": "set", "n": N_LEDS, "r": r, "g": g, "b": b, "bright": BRIGHT})

app = web.Application()
app.router.add_post("/on",  led_on)
app.router.add_post("/off", led_off)
app.router.add_post("/set", led_set)

# ===== Cleanup on shutdown =====
async def on_shutdown(app):
    # Turn off LEDs and release lines
    try:
        _write(_frame_all(0, 0, 0))
    except Exception:
        pass
    try:
        clk.set_value(0)
        din.set_value(0)
    except Exception:
        pass
    try:
        clk.release()
        din.release()
        chip.close()
    except Exception:
        pass

app.on_shutdown.append(on_shutdown)

if __name__ == "__main__":
    web.run_app(app, host="0.0.0.0", port=8080)
