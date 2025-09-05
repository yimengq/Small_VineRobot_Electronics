#!/usr/bin/env python3
import spidev
from aiohttp import web

# --- Hardware config (change to match yours) ---
N_LEDS = 3          # number of LEDs
BUS, DEV = 3, 0     # /dev/spidev3.0
HZ = 1_000_000      # 1 MHz
BRIGHT = 50         # 0..31 (global brightness)

def _frame_all(r, g, b):
    start = [0x00, 0x00, 0x00, 0x00]
    leds  = [(0b11100000 | BRIGHT, b & 0xFF, g & 0xFF, r & 0xFF)] * N_LEDS
    end   = [0xFF] * ((N_LEDS + 15) // 16)
    return start + [x for led in leds for x in led] + end

def _write(frame):
    spi = spidev.SpiDev()
    spi.open(BUS, DEV)
    spi.max_speed_hz = HZ
    spi.mode = 0
    spi.xfer2(frame)
    spi.close()

async def led_on(_):
    _write(_frame_all(255, 255, 255))  # all white
    return web.json_response({"ok": True, "state": "on"})

async def led_off(_):
    _write(_frame_all(0, 0, 0))        # all off
    return web.json_response({"ok": True, "state": "off"})

app = web.Application()
app.router.add_post("/on",  led_on)
app.router.add_post("/off", led_off)

if __name__ == "__main__":
    web.run_app(app, host="0.0.0.0", port=8080)
