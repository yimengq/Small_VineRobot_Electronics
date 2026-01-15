# #!/usr/bin/env python3
# import spidev
# from aiohttp import web

# # --- Hardware config (change to match yours) ---
# N_LEDS = 3          # number of LEDs
# BUS, DEV = 3, 0     # /dev/spidev3.0
# HZ = 1_000_000      # 1 MHz
# BRIGHT = 31         # 0..31 (global brightness)

# def _frame_all(r, g, b):
#     start = [0x00, 0x00, 0x00, 0x00]
#     leds  = [(0b11100000 | BRIGHT, b & 0xFF, g & 0xFF, r & 0xFF)] * N_LEDS
#     end   = [0xFF] * ((N_LEDS + 15) // 16)
#     return start + [x for led in leds for x in led] + end

# def _write(frame):
#     spi = spidev.SpiDev()
#     spi.open(BUS, DEV)
#     spi.max_speed_hz = HZ
#     spi.mode = 0
#     spi.xfer2(frame)
#     spi.close()

# async def led_on(_):
#     _write(_frame_all(255, 255, 255))  # all white
#     print("led on")
#     return web.json_response({"ok": True, "state": "on"})

# async def led_off(_):
#     _write(_frame_all(0, 0, 0))        # all off
#     print("led off")
#     return web.json_response({"ok": True, "state": "off"})

# app = web.Application()
# app.router.add_post("/on",  led_on)
# app.router.add_post("/off", led_off)

# if __name__ == "__main__":
#     web.run_app(app, host="0.0.0.0", port=8080)

#!/usr/bin/env python3
import time
import spidev
from aiohttp import web

# --- Hardware config (change to match yours) ---
N_LEDS = 12         # WS2812B LED count
BUS, DEV = 3, 0     # /dev/spidev3.0
HZ = 2_400_000      # 2.4 MHz is a good starting point for 3-bit symbols
RESET_US = 900      # latch time (>50us). Longer helps on SBCs.

# WS2812 expects GRB byte order on the wire.
# Encode each WS2812 bit into 3 SPI bits:
#   0 -> 100
#   1 -> 110
SYMBOL_0 = 0b100
SYMBOL_1 = 0b110

def _encode_grb(grb: bytes) -> bytearray:
    """Convert raw GRB bytes into an SPI byte stream that approximates WS2812 NZR timing."""
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

def _frame_all_ws2812(r: int, g: int, b: int, brightness: float = 1.0) -> bytes:
    """
    Build a WS2812 frame for all LEDs, with optional brightness scaling (0.0..1.0).
    """
    br = max(0.0, min(1.0, float(brightness)))
    r = int((r & 255) * br)
    g = int((g & 255) * br)
    b = int((b & 255) * br)

    # GRB per LED
    return bytes([g, r, b]) * N_LEDS

def _write_ws2812(grb_frame: bytes, clear_twice: bool = False):
    spi = spidev.SpiDev()
    spi.open(BUS, DEV)
    spi.max_speed_hz = HZ
    spi.mode = 0

    payload = _encode_grb(grb_frame)
    spi.xfer2(payload)
    time.sleep(RESET_US / 1_000_000.0)

    # “stubborn first LED” helper: send the same frame twice (useful for OFF)
    if clear_twice:
        spi.xfer2(payload)
        time.sleep(RESET_US / 1_000_000.0)

    spi.close()

# ---------- HTTP handlers ----------
async def led_on(_):
    # White @ 20% brightness so it’s not blinding (change as you like)
    _write_ws2812(_frame_all_ws2812(255, 255, 255, brightness=0.20), clear_twice=False)
    print("led on (white)")
    return web.json_response({"ok": True, "state": "on"})

async def led_off(_):
    # Send OFF twice + long reset to kill the “one green LED stays on” issue
    _write_ws2812(_frame_all_ws2812(0, 0, 0), clear_twice=True)
    print("led off")
    return web.json_response({"ok": True, "state": "off"})

# Optional: set arbitrary color + brightness via JSON
# POST /set  {"r":255,"g":0,"b":0,"brightness":0.1}
async def led_set(request):
    data = await request.json()
    r = int(data.get("r", 0))
    g = int(data.get("g", 0))
    b = int(data.get("b", 0))
    brightness = float(data.get("brightness", 1.0))
    _write_ws2812(_frame_all_ws2812(r, g, b, brightness=brightness), clear_twice=False)
    return web.json_response({"ok": True, "state": "set", "r": r, "g": g, "b": b, "brightness": brightness})

app = web.Application()
app.router.add_post("/on",  led_on)
app.router.add_post("/off", led_off)
app.router.add_post("/set", led_set)   # optional but handy

if __name__ == "__main__":
    web.run_app(app, host="0.0.0.0", port=8080)

