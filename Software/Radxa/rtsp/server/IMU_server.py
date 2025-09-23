#!/usr/bin/env python3
import os
import time
import json
import struct
import threading
from collections import deque
from typing import Optional, Deque, Dict, Any

from aiohttp import web
import spidev

# =========================
# ---- IMU SPI CONFIG  ----
# =========================
SPI_BUS, SPI_DEV = 3, 0         # /dev/spidev3.0
SPI_MODE = 3                    # CPOL=1, CPHA=1
SPI_HZ   = 1_000_000            # Start at 1 MHz; raise if stable
PAD_BYTES = 256                 # Additional clocks to pull reply

INIT_FRAME = [
    0xEF,0x49,0x03,0x00,0x08,0x00,0x03,0x00,
    0x28,0x00,0x00,0x00,0x00,0x00,0x6E,0x43
]
QUERY_FRAME = bytes(INIT_FRAME)

SYNC0, SYNC1  = 0xEF, 0x49
PKT_TYPE_DATA = 0x04
DID_PIMU      = 0x03

# pimu_t payload layout: double time; float dt; uint32 status; float theta[3]; float vel[3]
PIMU_FMT  = "<d f I 3f 3f"
PIMU_SIZE = struct.calcsize(PIMU_FMT)  # 40

# =========================
# ---- RUNTIME STATE   ----
# =========================
DEFAULT_PERIOD_S = 0.01  # 100 Hz target; adjust live via POST /imu/rate
BUFFER_CAPACITY  = 2000  # rolling history

class IMUService:
    """
    Manages SPI, polling thread, byte-stream decode, and a rolling buffer of samples.
    Each sample is a dict: {time, dt, status, theta: (3), vel: (3), ts_host}
    """
    def __init__(self):
        self._spi = None
        self._period_s = DEFAULT_PERIOD_S
        self._rxbuf = bytearray()
        self._latest: Optional[Dict[str, Any]] = None
        self._buf: Deque[Dict[str, Any]] = deque(maxlen=BUFFER_CAPACITY)
        self._lock = threading.Lock()
        self._run_evt = threading.Event()
        self._thread: Optional[threading.Thread] = None
        self._sse_clients = set()  # set of asyncio.Queues for /imu/stream

    # ---------- SPI lifecycle ----------
    def open_spi(self):
        if self._spi is not None:
            return
        spi = spidev.SpiDev()
        spi.open(SPI_BUS, SPI_DEV)
        spi.mode = SPI_MODE
        spi.max_speed_hz = SPI_HZ
        spi.bits_per_word = 8
        spi.lsbfirst = False
        self._spi = spi

        # Kick once with INIT
        init_burst = bytearray(INIT_FRAME + [0x00]*PAD_BYTES)
        _ = self._spi.xfer2(list(init_burst))

    def close_spi(self):
        if self._spi is not None:
            try:
                self._spi.close()
            except Exception:
                pass
            self._spi = None

    # ---------- Polling control ----------
    def start(self):
        if self._thread and self._thread.is_alive():
            self._run_evt.set()
            return
        self.open_spi()
        self._run_evt.set()
        self._thread = threading.Thread(target=self._worker, name="IMUWorker", daemon=True)
        self._thread.start()

    def stop(self):
        self._run_evt.clear()
        # don't block forever; worker loop checks event each cycle

    def set_period(self, period_s: float):
        with self._lock:
            self._period_s = max(0.001, float(period_s))  # clamp >=1kHz

    def get_period(self) -> float:
        with self._lock:
            return self._period_s

    # ---------- Data access ----------
    def get_latest(self) -> Optional[Dict[str, Any]]:
        with self._lock:
            return dict(self._latest) if self._latest else None

    def get_tail(self, n: int) -> list:
        with self._lock:
            if n <= 0:
                return []
            return list(self._buf)[-n:]

    # ---------- Parser helpers ----------
    @staticmethod
    def _parse_pimu(payload: bytes) -> Optional[Dict[str, Any]]:
        if len(payload) < PIMU_SIZE:
            return None
        t, dt, status, th0, th1, th2, v0, v1, v2 = struct.unpack_from(PIMU_FMT, payload, 0)
        return {
            "time": t,
            "dt": dt,
            "status": int(status),
            "theta": (float(th0), float(th1), float(th2)),
            "vel":   (float(v0),  float(v1),  float(v2)),
        }

    def _parse_stream_incremental(self, rx: bytes):
        """
        Append bytes to internal buffer and extract full packets:
        Layout: [EF][49][04][did][size_lo][size_hi][payload...]
        Emits dicts when DID_PIMU is seen with exact payload size.
        """
        self._rxbuf.extend(rx)
        out = []
        i = 0
        n = len(self._rxbuf)
        while i + 6 <= n:
            if self._rxbuf[i] != SYNC0 or self._rxbuf[i+1] != SYNC1:
                i += 1
                continue
            if self._rxbuf[i+2] != PKT_TYPE_DATA:
                i += 1
                continue
            did   = self._rxbuf[i+3]
            size  = self._rxbuf[i+4] | (self._rxbuf[i+5] << 8)
            start = i + 6
            end   = start + size
            if end > n:  # incomplete; wait for more
                break

            payload = bytes(self._rxbuf[start:end])
            if did == DID_PIMU and size == PIMU_SIZE:
                p = self._parse_pimu(payload)
                if p:
                    out.append(p)
            i = end

        # trim consumed
        if i > 0:
            del self._rxbuf[:i]
        return out

    # ---------- Worker ----------
    def _worker(self):
        tx = bytearray(QUERY_FRAME + bytes([0x00])*PAD_BYTES)
        spi = self._spi
        while True:
            if not self._run_evt.is_set():
                time.sleep(0.02)
                continue
            t0 = time.time()
            try:
                rx = spi.xfer2(list(tx))
                parsed = self._parse_stream_incremental(bytes(rx))
                if parsed:
                    now = time.time()
                    with self._lock:
                        for p in parsed:
                            sample = dict(p)
                            sample["ts_host"] = now
                            self._latest = sample
                            self._buf.append(sample)
                        # fan out to SSE listeners (non-blocking)
                        payload = json.dumps(self._latest, separators=(",", ":"))
                    for q in list(self._sse_clients):
                        try:
                            q.put_nowait(payload)
                        except Exception:
                            # drop slow/closed clients
                            self._sse_clients.discard(q)
            except Exception as e:
                # On SPI error, pause briefly but keep thread alive
                err = {"error": f"spi transfer failed: {e}", "ts": time.time()}
                with self._lock:
                    self._buf.append(err)
                    self._latest = err

            # pacing
            period = self.get_period()
            dt = time.time() - t0
            if dt < period:
                time.sleep(period - dt)

    # ---------- SSE client management ----------
    def register_sse_client(self, queue):
        self._sse_clients.add(queue)

    def unregister_sse_client(self, queue):
        self._sse_clients.discard(queue)

imu = IMUService()

# =========================
# ---- HTTP HANDLERS   ----
# =========================
async def imu_health(_req: web.Request):
    return web.json_response({
        "ok": True,
        "spi": {
            "bus": SPI_BUS, "dev": SPI_DEV,
            "mode": SPI_MODE, "hz": SPI_HZ,
            "pad_bytes": PAD_BYTES
        },
        "parser": {
            "sync": [SYNC0, SYNC1],
            "pkt_type_data": PKT_TYPE_DATA,
            "did_pimu": DID_PIMU,
            "pimu_size": PIMU_SIZE,
            "fmt": PIMU_FMT,
        },
        "period_s": imu.get_period(),
        "buffer_capacity": BUFFER_CAPACITY,
        "running": imu._run_evt.is_set(),
        "latest_present": imu.get_latest() is not None,
    })

async def imu_latest(_req: web.Request):
    latest = imu.get_latest()
    if latest is None:
        return web.json_response({"error": "no data yet"}, status=404)
    return web.json_response(latest)

async def imu_buffer(req: web.Request):
    try:
        n = int(req.query.get("n", "200"))
    except ValueError:
        n = 200
    n = max(1, min(n, BUFFER_CAPACITY))
    return web.json_response(imu.get_tail(n))

async def imu_start(_req: web.Request):
    try:
        imu.start()
        return web.json_response({"ok": True, "running": True, "period_s": imu.get_period()})
    except Exception as e:
        return web.json_response({"error": f"start failed: {e}"}, status=500)

async def imu_stop(_req: web.Request):
    imu.stop()
    return web.json_response({"ok": True, "running": False})

async def imu_rate(req: web.Request):
    try:
        data = await req.json()
        period = float(data.get("period_s"))
        imu.set_period(period)
        return web.json_response({"ok": True, "period_s": imu.get_period()})
    except Exception as e:
        return web.json_response({"error": f"invalid body: {e}"}, status=400)

# ---- SSE stream: text/event-stream ----
async def imu_stream(req: web.Request):
    """
    Server-Sent Events endpoint. Each event line is 'data: {...}\n\n' with JSON sample.
    """
    import asyncio
    queue: asyncio.Queue[str] = asyncio.Queue(maxsize=100)
    imu.register_sse_client(queue)

    # Ensure producer is running
    imu.start()

    async def gen():
        try:
            # Immediately send the latest, if any
            latest = imu.get_latest()
            if latest:
                yield f"data: {json.dumps(latest, separators=(',', ':'))}\n\n"
            while True:
                payload = await queue.get()
                yield f"data: {payload}\n\n"
        finally:
            imu.unregister_sse_client(queue)

    headers = {
        "Content-Type": "text/event-stream",
        "Cache-Control": "no-cache",
        "Connection": "keep-alive",
        # Allow JS from anywhere (optional)
        "Access-Control-Allow-Origin": "*",
    }
    return web.Response(body=gen(), headers=headers)

# =========================
# ---- APP WIRING      ----
# =========================
app = web.Application()
# IMU endpoints
app.router.add_get("/imu/health", imu_health)
app.router.add_get("/imu/latest", imu_latest)
app.router.add_get("/imu/buffer", imu_buffer)
app.router.add_post("/imu/start", imu_start)
app.router.add_post("/imu/stop", imu_stop)
app.router.add_post("/imu/rate", imu_rate)
app.router.add_get("/imu/stream", imu_stream)

async def on_startup(_app):
    # Lazy-open SPI on first start request, or uncomment to auto-start:
    # imu.start()
    pass

async def on_cleanup(_app):
    imu.stop()
    imu.close_spi()

app.on_startup.append(on_startup)
app.on_cleanup.append(on_cleanup)

# =========================
# ---- MAIN            ----
# =========================
if __name__ == "__main__":
    port_env = os.getenv("PORT")
    try:
        port = int(port_env) if port_env else 8080  # prefer non-privileged
    except ValueError:
        port = 8080

    try:
        web.run_app(app, host="0.0.0.0", port=port)
    except PermissionError as e:
        # Auto-fallback if someone points to a privileged port
        if port < 1024:
            print(f"[WARN] Permission denied on port {port}; retrying on 8080...")
            web.run_app(app, host="0.0.0.0", port=808080)
        else:
            raise
