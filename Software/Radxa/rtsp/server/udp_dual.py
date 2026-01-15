#!/usr/bin/env python3
import argparse
import gi
import threading

gi.require_version("Gst", "1.0")
from gi.repository import Gst, GLib
from aiohttp import web

Gst.init(None)

def build_pipeline(device: str, host: str, port: int, width: int, height: int, fps: int,
                   mode: str, encoder: str = "mpph264enc") -> str:
    """
    mode:
      - "raw-uyvy" / "raw-yuy2": expects raw frames directly from v4l2
      - "mjpg": expects MJPG from v4l2 and decodes via jpegdec
    """
    common_tail = (
        f"queue max-size-buffers=1 leaky=downstream ! "
        f"videorate drop-only=true ! video/x-raw,framerate={fps}/1 ! "
        f"queue max-size-buffers=1 leaky=downstream ! "
        f"videoconvert ! video/x-raw,format=NV12 ! "
        f"queue max-size-buffers=1 leaky=downstream ! "
        f"videoscale ! video/x-raw,format=NV12,width={width},height={height},framerate={fps}/1 ! "
        f"queue max-size-buffers=1 leaky=downstream ! "
        f"{encoder} ! h264parse ! "
        f"rtph264pay pt=96 config-interval=1 ! "
        f"udpsink host={host} port={port} sync=false async=false"
    )

    if mode == "raw-uyvy":
        head = (
            f"v4l2src device={device} io-mode=2 do-timestamp=true ! "
            f"video/x-raw,format=UYVY,width={width},height={height} ! "
        )
        return head + common_tail

    if mode == "raw-yuy2":
        head = (
            f"v4l2src device={device} io-mode=2 do-timestamp=true ! "
            f"video/x-raw,format=YUY2,width={width},height={height} ! "
        )
        return head + common_tail

    if mode == "mjpg":
        head = (
            f"v4l2src device={device} io-mode=2 do-timestamp=true ! "
            f"image/jpeg,width={width},height={height},framerate={fps}/1 ! "
            f"queue max-size-buffers=1 leaky=downstream ! "
            f"jpegdec ! "
        )
        return head + common_tail

    raise ValueError(f"Unknown mode: {mode}")

class StreamManager:
    def __init__(self, args, loop: GLib.MainLoop):
        self.args = args
        self.loop = loop
        self.pipeline = None
        self.bus = None

        # active cam: 0 or 10
        self.active = 0

        # for AUTO usb mode fallback logic
        self.dev10_tried = None   # None, "mjpg", "yuy2"

    def _teardown(self):
        if self.pipeline:
            try:
                self.pipeline.set_state(Gst.State.NULL)
            except Exception:
                pass
        if self.bus:
            try:
                self.bus.remove_signal_watch()
            except Exception:
                pass
        self.pipeline = None
        self.bus = None

    def _on_bus_message(self, bus, message):
        t = message.type
        if t == Gst.MessageType.ERROR:
            err, dbg = message.parse_error()
            print(f"[GStreamer ERROR] {err}\n  debug: {dbg}")

            # If we’re on /dev/video10 with AUTO, try fallback once
            if self.active == 10 and self.args.dev10_mode == "auto":
                if self.dev10_tried == "mjpg":
                    print("[AUTO] MJPG failed; retrying /dev/video10 as YUY2")
                    self.dev10_tried = "yuy2"
                    self._restart_current()
                    return True
                elif self.dev10_tried == "yuy2":
                    print("[AUTO] YUY2 also failed; staying stopped")
                    self._teardown()
                    return True

            # Otherwise, stop pipeline but keep process alive
            self._teardown()
        elif t == Gst.MessageType.EOS:
            print("[GStreamer] EOS")
            self._teardown()
        return True

    def _start_pipeline(self, pipeline_str: str) -> bool:
        self._teardown()

        print("[PIPELINE]", pipeline_str)
        self.pipeline = Gst.parse_launch(pipeline_str)

        self.bus = self.pipeline.get_bus()
        self.bus.add_signal_watch()
        self.bus.connect("message", self._on_bus_message)

        ret = self.pipeline.set_state(Gst.State.PLAYING)
        if ret == Gst.StateChangeReturn.FAILURE:
            print("[GStreamer] Failed to start pipeline (state change failure)")
            self._teardown()
            return False

        return True

    def _restart_current(self):
        # rebuild pipeline for current active cam
        if self.active == 0:
            p = build_pipeline(
                device=self.args.dev0,
                host=self.args.host,
                port=self.args.port,
                width=self.args.w0,
                height=self.args.h0,
                fps=self.args.fps0,
                mode="raw-uyvy",
                encoder=self.args.encoder,
            )
            self._start_pipeline(p)
        else:
            # /dev/video10
            if self.args.dev10_mode == "mjpg":
                mode = "mjpg"
                self.dev10_tried = "mjpg"
            elif self.args.dev10_mode == "yuy2":
                mode = "raw-yuy2"
                self.dev10_tried = "yuy2"
            else:
                # auto: start with mjpg
                if self.dev10_tried is None:
                    self.dev10_tried = "mjpg"
                mode = "mjpg" if self.dev10_tried == "mjpg" else "raw-yuy2"

            p = build_pipeline(
                device=self.args.dev10,
                host=self.args.host,
                port=self.args.port,
                width=self.args.w10,
                height=self.args.h10,
                fps=self.args.fps10,
                mode=mode,
                encoder=self.args.encoder,
            )
            ok = self._start_pipeline(p)
            # if immediate failure and auto, try the other mode
            if (not ok) and self.args.dev10_mode == "auto":
                if self.dev10_tried == "mjpg":
                    print("[AUTO] Immediate MJPG start failure; retrying YUY2")
                    self.dev10_tried = "yuy2"
                    self._restart_current()

    def start(self):
        # default start on cam0
        self.active = 0
        self.dev10_tried = None
        self._restart_current()

    def switch_to(self, which: int):
        # schedule on GLib main thread
        def _do():
            if which == self.active:
                return False
            self.active = which
            if which == 10:
                self.dev10_tried = None  # reset auto probing each time you switch to usb cam
            print(f"[SWITCH] Switching to {'/dev/video0 (1080p)' if which==0 else '/dev/video10 (480p)'}")
            self._restart_current()
            return False

        GLib.idle_add(_do)

def make_app(mgr: StreamManager):
    app = web.Application()

    async def status(_):
        return web.json_response({
            "ok": True,
            "active": mgr.active,
            "device": mgr.args.dev0 if mgr.active == 0 else mgr.args.dev10,
            "udp": f"{mgr.args.host}:{mgr.args.port}",
        })

    async def cam0(_):
        mgr.switch_to(0)
        return web.json_response({"ok": True, "switching_to": mgr.args.dev0})

    async def cam10(_):
        mgr.switch_to(10)
        return web.json_response({"ok": True, "switching_to": mgr.args.dev10})

    app.router.add_get("/status", status)
    app.router.add_post("/cam/0", cam0)
    app.router.add_post("/cam/10", cam10)
    return app

def main():
    ap = argparse.ArgumentParser(description="UDP (RTP/H264) sender with single-active camera switching")

    ap.add_argument("--host", default="192.168.1.2")
    ap.add_argument("--port", type=int, default=5000)

    ap.add_argument("--dev0", default="/dev/video0")
    ap.add_argument("--dev10", default="/dev/video10")

    # Cam0 (1080p)
    ap.add_argument("--w0", type=int, default=1920)
    ap.add_argument("--h0", type=int, default=1080)
    ap.add_argument("--fps0", type=int, default=20)

    # Cam10 (480p usb)
    ap.add_argument("--w10", type=int, default=160)
    ap.add_argument("--h10", type=int, default=120)
    ap.add_argument("--fps10", type=int, default=30)

    # USB camera mode: try MJPG first then YUY2 fallback
    ap.add_argument("--dev10_mode", choices=["auto", "mjpg", "yuy2"], default="auto")

    # encoder (mpph264enc is hardware on Rockchip; swap if needed)
    ap.add_argument("--encoder", default="mpph264enc")

    # HTTP control
    ap.add_argument("--http_port", type=int, default=8081)

    args = ap.parse_args()

    loop = GLib.MainLoop()
    mgr = StreamManager(args, loop)
    mgr.start()

    def run_http():
        import asyncio
        async def _main():
            app = make_app(mgr)  # or make_app(switcher)
            runner = web.AppRunner(app)
            await runner.setup()
            site = web.TCPSite(runner, "0.0.0.0", args.http_port)
            await site.start()
            while True:
                await asyncio.sleep(3600)

        asyncio.run(_main())


    threading.Thread(target=run_http, daemon=True).start()

    print(f"[UDP] RTP/H264 -> {args.host}:{args.port}")
    print(f"[HTTP] POST /cam/0 or /cam/10, GET /status on port {args.http_port}")

    try:
        loop.run()
    except KeyboardInterrupt:
        pass
    finally:
        mgr._teardown()
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
