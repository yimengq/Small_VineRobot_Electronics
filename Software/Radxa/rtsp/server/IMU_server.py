# #!/usr/bin/env python3
import os
import time
import struct
import threading
import asyncio
import contextlib

from aiohttp import web
import spidev

# ================= Config =================
SPI_BUS, SPI_DEV = 3, 0
SPI_MODE = 3
SPI_HZ   = 1_000_000
PAD_BYTES = 256

# --- NEW: payload interpretation toggles ---
# Some firmware variants send [time, dt, status, 3f, 3f] with the 3f blocks swapped.
FLIP_THETA_VEL = True       # True => payload order is [Δv][Δθ]; False => [Δθ][Δv]
THETA_SCALE    = 1e1       # 1e-3 if Δθ is in milliradians; 1.0 if already in radians
VEL_SCALE      = 1.0        # keep Δv as-is (m/s); change if yours is scaled
# -------------------------------------------


# Optional: pulse a GPIO low at startup (disabled by default)
USE_GPIO_PULSE = False
DRIVE_LOW_CHIP = "/dev/gpiochip3"  # GPIO3
DRIVE_LOW_LINE = 17                # GPIO3_C1 -> 16+1=17
DRIVE_LOW_MS   = 1

INIT_FRAME = [
    0xEF,0x49,0x03,0x00,0x08,0x00,0x03,0x00,
    0x28,0x00,0x00,0x00,0x00,0x00,0x6E,0x43
]
QUERY_FRAME = bytes(INIT_FRAME)

SYNC0, SYNC1  = 0xEF, 0x49
PKT_TYPE_DATA = 0x04
DID_PIMU      = 0x03

# pimu_t: double (8) + float (4) + uint32 (4) + 3f (12) + 3f (12) = 40
PIMU_FMT  = "<d f I 3f 3f"
PIMU_SIZE = struct.calcsize(PIMU_FMT)  # 40

# ============== Globals / runtime ==============
loop: asyncio.AbstractEventLoop | None = None
line_queue: asyncio.Queue[str] | None = None
latest_line: str | None = None
running_flag = threading.Event()

# ================= Helpers =================
def to_bytes(x):
    if isinstance(x, (bytes, bytearray)):
        return bytes(x)
    if isinstance(x, list):
        return bytes(x)
    return bytes(bytearray(x))

def parse_pimu(payload):
    payload = to_bytes(payload)
    if len(payload) < 40:
        return None
    # header
    t,     = struct.unpack_from("<d", payload, 0)
    dt,    = struct.unpack_from("<f", payload, 8)
    status,= struct.unpack_from("<I", payload, 12)

    # raw blocks straight from wire
    b0 = struct.unpack_from("<3f", payload, 16)
    b1 = struct.unpack_from("<3f", payload, 28)

    # interpret according to toggles
    if FLIP_THETA_VEL:
        dv_raw   = b0
        dth_raw  = b1
    else:
        dth_raw  = b0
        dv_raw   = b1

    # apply unit/scale
    dtheta = tuple(x * THETA_SCALE for x in dth_raw)  # -> radians
    dvel   = tuple(x * VEL_SCALE   for x in dv_raw)   # -> m/s

    return {
        "time": t, "dt": dt, "status": status,
        "theta": dtheta,    # Δθ (rad)
        "vel":   dvel,      # Δv (m/s)
        "_raw":  {"b0": b0, "b1": b1}  # keep for debugging
    }


def scan_and_format_lines(rx_bytes: bytes) -> list[str]:
    """Return already-formatted '[PIMU decode] ...' lines found in rx_bytes.
    Robust to partial frames by carrying leftovers between calls.
    """
    global _scan_carry
    out: list[str] = []

    # concatenate new bytes with any leftover from the previous call
    buf = _scan_carry + bytearray(rx_bytes)
    n = len(buf)
    i = 0

    while True:
        # need at least a full header to proceed
        if i + _HEADER_LEN > n:
            break

        # look for sync
        if not (buf[i] == SYNC0 and buf[i+1] == SYNC1):
            i += 1
            continue

        # check packet type
        if buf[i+2] != PKT_TYPE_DATA:
            # not a data packet; advance by one to resync
            i += 1
            continue

        did  = buf[i+3]
        size = buf[i+4] | (buf[i+5] << 8)  # little-endian payload size

        total = _HEADER_LEN + size
        end   = i + total

        # incomplete frame: stop here and keep the tail for next time
        if end > n:
            break

        # full frame available
        payload = bytes(buf[i + _HEADER_LEN : end])

        if did == DID_PIMU and size == PIMU_SIZE:
            p = parse_pimu(payload)
            if p:
                line = (
                    f"[PIMU decode] t={p['time']:.6f}s dt={p['dt']:.6f}s "
                    f"theta=[{p['theta'][0]:+.6f} {p['theta'][1]:+.6f} {p['theta'][2]:+.6f}] "
                    f"vel=[{p['vel'][0]:+.6f} {p['vel'][1]:+.6f} {p['vel'][2]:+.6f}] "
                    f"status=0x{p['status']:08X}"
                )
                out.append(line)

        # advance to next frame candidate
        i = end

    # save any unconsumed tail (partial header/frame) for the next call
    _scan_carry = buf[i:]
    return out


def drive_line_low_once(chip_name: str, line_offset: int, ms: int = 1):
    """Drive a GPIO line LOW briefly, then release. Works with python3-gpiod v1 or v2."""
    try:
        import gpiod
        if hasattr(gpiod, "request_lines"):  # v2
            req = gpiod.request_lines(
                chip_name,
                consumer="imu-init-low",
                config={ line_offset: gpiod.LineSettings(
                    direction=gpiod.LineDirection.OUTPUT,
                    output_value=0
                )}
            )
            time.sleep(max(0, ms) / 1000.0)
            req.release()
        else:  # v1
            chip = gpiod.Chip(chip_name)
            line = chip.get_line(line_offset)
            line.request(consumer="imu-init-low", type=gpiod.LINE_REQ_DIR_OUT, default_vals=[0])
            time.sleep(max(0, ms) / 1000.0)
            line.release()
            chip.close()
        print(f"[GPIO] Drove {chip_name} line {line_offset} LOW for {ms} ms.")
    except Exception as e:
        print(f"[GPIO] WARN: could not drive {chip_name}:{line_offset} LOW: {e}")

def emit_line(line: str):
    """Thread-safe: enqueue a line into the asyncio queue for SSE clients."""
    global latest_line
    latest_line = line
    if loop and line_queue:
        try:
            # robust: schedule a real coroutine put() into the running loop
            asyncio.run_coroutine_threadsafe(line_queue.put(line), loop)
        except Exception as e:
            # If this ever fails, we at least still printed the line above
            print(f"[SSE] WARN could not enqueue line: {e}")

# ================= SPI worker =================
def spi_worker():
    """Runs in a background thread; reads SPI and emits formatted lines."""
    if USE_GPIO_PULSE:
        drive_line_low_once(DRIVE_LOW_CHIP, DRIVE_LOW_LINE, DRIVE_LOW_MS)

    spi = spidev.SpiDev()
    try:
        spi.open(SPI_BUS, SPI_DEV)
        spi.mode = SPI_MODE
        spi.max_speed_hz = SPI_HZ
        spi.lsbfirst = False
        spi.bits_per_word = 8

        init_burst  = bytes(INIT_FRAME) + bytes([0x00]) * PAD_BYTES
        query_burst = QUERY_FRAME       + bytes([0x00]) * PAD_BYTES

        # one init transfer
        rx0 = spi.xfer2(list(init_burst))
        for line in scan_and_format_lines(bytes(rx0)):
            emit_line(line)

        # main loop
        running_flag.set()
        while running_flag.is_set():
            t0 = time.time()
            rx = spi.xfer2(list(query_burst))
            for line in scan_and_format_lines(bytes(rx)):
                emit_line(line)

            # 10 Hz by default (adjust if you want)
            dt = time.time() - t0
            period = 0.10
            if dt < period:
                time.sleep(period - dt)
    except Exception as e:
        emit_line(f"[ERROR] SPI transfer failed: {e!r}")
    finally:
        try: spi.close()
        except: pass

# ================= HTTP (SSE) =================
async def imu_health(_req: web.Request):
    return web.json_response({
        "ok": True,
        "spi": {"bus": SPI_BUS, "dev": SPI_DEV, "mode": SPI_MODE, "hz": SPI_HZ, "pad_bytes": PAD_BYTES},
        "running": running_flag.is_set(),
        "latest_present": latest_line is not None,
    })

async def imu_latest_text(_req: web.Request):
    return web.json_response({"latest": latest_line})

async def imu_stream(req: web.Request):
    """SSE endpoint that streams the formatted text lines."""
    resp = web.StreamResponse(
        status=200,
        headers={
            "Content-Type": "text/event-stream",
            "Cache-Control": "no-cache",
            "Connection": "keep-alive",
            "Access-Control-Allow-Origin": "*",
            "X-Accel-Buffering": "no",
        },
    )
    await resp.prepare(req)

    # send something immediately to keep clients alive
    await resp.write(b": hello\n\n")

    # send the most recent line once if present
    if latest_line:
        l = latest_line.encode("utf-8")
        await resp.write(b"data: " + l + b"\n\n")

    # heartbeat task
    async def _heartbeat():
        try:
            while True:
                await asyncio.sleep(3)
                await resp.write(b": keep-alive\n\n")
        except asyncio.CancelledError:
            pass

    hb_task = asyncio.create_task(_heartbeat())

    try:
        # stream new lines as they arrive
        assert line_queue is not None
        while True:
            line = await line_queue.get()
            try:
                lb = line.encode("utf-8")
            except Exception:
                lb = b"[WARN] invalid unicode line"
            await resp.write(b"data: " + lb + b"\n\n")
    except (asyncio.CancelledError, ConnectionResetError, BrokenPipeError):
        pass
    finally:
        hb_task.cancel()
        with contextlib.suppress(Exception):
            await resp.write_eof()

    return resp

# ================= Startup / Main =================
async def on_startup(app: web.Application):
    """Create loop-bound queue and start SPI reader AFTER loop exists."""
    global loop, line_queue
    loop = asyncio.get_running_loop()
    line_queue = asyncio.Queue(maxsize=200)
    # start SPI thread now that loop & queue are ready
    t = threading.Thread(target=spi_worker, name="SPIWorker", daemon=True)
    t.start()
    print("[IMU] SPI worker started.")

async def on_cleanup(app: web.Application):
    running_flag.clear()

def main():
    app = web.Application()
    app.router.add_get("/imu/health", imu_health)
    app.router.add_get("/imu/latest_text", imu_latest_text)
    app.router.add_get("/imu/stream", imu_stream)

    app.on_startup.append(on_startup)
    app.on_cleanup.append(on_cleanup)

    # pick port (prefer IMU_PORT, fall back to 8181)
    raw = os.getenv("IMU_PORT") or os.getenv("PORT") or "8181"
    try: port = int(raw)
    except ValueError: port = 8181
    if not (0 <= port <= 65535) or port < 1024: port = 8181

    print(f"[IMU] SPI reader + SSE on 0.0.0.0:{port}")
    web.run_app(app, host="0.0.0.0", port=port)

if __name__ == "__main__":
    main()
