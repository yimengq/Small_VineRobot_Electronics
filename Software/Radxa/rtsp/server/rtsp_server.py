

# #!/usr/bin/env python3
# import socket
# import gi
# import subprocess
# gi.require_version('Gst', '1.0')
# gi.require_version('GstRtspServer', '1.0')
# from gi.repository import Gst, GstRtspServer, GLib

# Gst.init(None)

# def build_launch(device, w, h, fps, bps):
#     # Source requests EXACTLY 1280x720 @ 20 fps NV12
#     caps_src = f"video/x-raw,format=NV12,width={w},height={h},framerate={fps}/1"
#     caps_enc = f"video/x-raw,format=NV12,width={w},height={h}"

#     # Pick encoder (HW → MPP → software)
#     if Gst.ElementFactory.find('v4l2h264enc'):
#         enc = (
#             f'v4l2h264enc extra-controls="encode,video_bitrate={bps}" '
#             f'! h264parse config-interval=1'
#         )
#         print("v4l2h264enc")
#     elif Gst.ElementFactory.find('mpph264enc'):
#         # Low-latency CBR, GOP ≈ fps
#         enc = f"mpph264enc rc-mode=cbr bps={bps} gop={fps} ! h264parse config-interval=1"
#         print("mpph264enc")
#     else:
#         # Software fallback – true low-latency
#         caps_enc = f"video/x-raw,format=I420,width={w},height={h}"
#         enc = (
#             f"x264enc tune=zerolatency speed-preset=ultrafast bitrate={bps//1000} "
#             f"key-int-max={fps} vbv-buf-capacity=1 threads=2 "
#             f"! h264parse config-interval=1 aggregate-mode=zero-latency"
#         )
#         print("x264enc")

#     # Converter (prefer rk/mpp, else generic)
#     if Gst.ElementFactory.find('rkvideoconvert'):
#         convert = f"rkvideoconvert ! {caps_enc}"
#     elif Gst.ElementFactory.find('mppvideoconvert'):
#         convert = f"mppvideoconvert ! {caps_enc}"
#     else:
#         convert = f"videoconvert ! {caps_enc}"

#     # Leaky queues keep latency tiny (drop old frames)
#     pipeline = (
#         f"v4l2src device={device} io-mode=mmap do-timestamp=true ! {caps_src} "
#         f"! queue max-size-buffers=1 max-size-bytes=0 max-size-time=0 leaky=downstream "
#         f"! {convert} "
#         f"! queue max-size-buffers=1 max-size-bytes=0 max-size-time=0 leaky=downstream "
#         f"! {enc} "
#         f"! rtph264pay name=pay0 pt=96 config-interval=1"
#     )
#     return pipeline

# class Server(GstRtspServer.RTSPServer):
#     def __init__(self, device, w, h, fps, bps, port, mount="/stream"):
#         super().__init__()
#         self.set_service(str(port))
#         factory = GstRtspServer.RTSPMediaFactory()
#         pipe = build_launch(device, w, h, fps, bps)
#         print("LAUNCH:", pipe)
#         factory.set_launch(pipe)
#         factory.set_shared(True)
#         self.get_mount_points().add_factory(mount, factory)
#         self.attach(None)

# def get_local_ip():
#     s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
#     try:
#         # doesn’t need to be reachable — just a non-local address
#         s.connect(("8.8.8.8", 80))
#         return s.getsockname()[0]
#     except Exception:
#         return "127.0.0.1"
#     finally:
#         s.close()

# # ffmpeg -f v4l2 -i /dev/video10        -vf format=yuv420p        -vcodec mjpeg -q:v 5        -f mpjpeg -listen 1 http://0.0.0.0:8080/
# if __name__ == "__main__":
#     DEVICE = "/dev/video0"
#     WIDTH, HEIGHT = 1280, 720
#     FPS = 20                 # <- requested 20 fps
#     BITRATE = 4_000_000      # 4 Mbps (tune up/down as needed)
#     PORT = 8554
#     MOUNT = "/stream"

#     srv = Server(DEVICE, WIDTH, HEIGHT, FPS, BITRATE, PORT, MOUNT)
#     ip = get_local_ip()
#     print(f"RTSP stream: rtsp://{ip}:{PORT}{MOUNT}")
#     GLib.MainLoop().run()

#!/usr/bin/env python3
import socket
import gi
gi.require_version("Gst", "1.0")
gi.require_version("GstRtspServer", "1.0")
from gi.repository import Gst, GstRtspServer, GLib

Gst.init(None)

# ----------------------------
# Helpers
# ----------------------------
def get_local_ip():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        s.connect(("8.8.8.8", 80))  # doesn't need to be reachable
        return s.getsockname()[0]
    except Exception:
        return "127.0.0.1"
    finally:
        s.close()

def pick_convert_to_nv12():
    # Prefer Rockchip-specific converters if present; else generic.
    if Gst.ElementFactory.find("rkvideoconvert"):
        return "rkvideoconvert"
    if Gst.ElementFactory.find("mppvideoconvert"):
        return "mppvideoconvert"
    return "videoconvert"

def pick_encoder(bps, fps):
    # Prefer MPP on Radxa/Rockchip; fallback to v4l2h264enc; then x264enc.
    if Gst.ElementFactory.find("mpph264enc"):
        return f"mpph264enc rc-mode=cbr bps={bps} gop={fps} ! h264parse config-interval=1"
    if Gst.ElementFactory.find("v4l2h264enc"):
        # Not all builds support this extra-controls string, but keep it as a second choice.
        return f'v4l2h264enc extra-controls="encode,video_bitrate={bps}" ! h264parse config-interval=1'
    # Software fallback
    # NOTE: x264enc bitrate is in kbps
    kbps = max(1, bps // 1000)
    return (
        f"x264enc tune=zerolatency speed-preset=ultrafast bitrate={kbps} "
        f"key-int-max={fps} vbv-buf-capacity=1 threads=2 "
        f"! h264parse config-interval=1 aggregate-mode=zero-latency"
    )

def build_launch(device, w, h, fps, bps,
                 io_mode="dmabuf",
                 src_format="NV12",
                 use_dmabuf_caps=False,
                 convert_to_nv12=False):
    """
    Key changes vs your version:
      - First attempt: NO videoconvert at all if source is already NV12 (fixes RGA_BLIT spam).
      - Prefer io-mode=dmabuf when possible (keeps frames in DMABUF, avoids bad blits).
      - Only insert a converter when we must (e.g., UYVY -> NV12).
    """
    enc = pick_encoder(bps, fps)

    # Source caps
    mem = "(memory:DMABuf)" if use_dmabuf_caps else ""
    caps_src = f"video/x-raw{mem},format={src_format},width={w},height={h},framerate={fps}/1"

    # Conversion (only if needed)
    chain = (
        f"v4l2src device={device} io-mode={io_mode} do-timestamp=true ! {caps_src} "
        f"! queue max-size-buffers=1 max-size-bytes=0 max-size-time=0 leaky=downstream "
    )

    if convert_to_nv12:
        conv = pick_convert_to_nv12()
        chain += (
            f"! {conv} "
            f"! video/x-raw,format=NV12,width={w},height={h} "
            f"! queue max-size-buffers=1 max-size-bytes=0 max-size-time=0 leaky=downstream "
        )

    chain += f"! {enc} ! rtph264pay name=pay0 pt=96 config-interval=1"
    return chain

def _preflight_ok(launch, timeout_s=2.0):
    """
    Try to actually start the pipeline briefly (PLAYING) and see if it errors.
    This catches "caps not supported / invalid argument" cases up front.
    """
    try:
        pipe = Gst.parse_launch(launch)
    except Exception:
        return False

    bus = pipe.get_bus()
    bus.add_signal_watch()

    ok = True
    pipe.set_state(Gst.State.PLAYING)

    loop = GLib.MainLoop()
    done = {"hit": False}

    def on_msg(bus, msg):
        t = msg.type
        if t == Gst.MessageType.ERROR:
            done["hit"] = True
            nonlocal_ok[0] = False
            loop.quit()
        elif t == Gst.MessageType.ASYNC_DONE:
            # We'll still wait a tiny bit for late errors; ASYNC_DONE alone isn't enough.
            pass

    nonlocal_ok = [True]
    bus.connect("message", on_msg)

    def stop():
        if not done["hit"]:
            loop.quit()
        return False

    GLib.timeout_add(int(timeout_s * 1000), stop)
    try:
        loop.run()
    except Exception:
        ok = False

    pipe.set_state(Gst.State.NULL)
    bus.remove_signal_watch()

    return nonlocal_ok[0] and ok

def pick_working_launch(device, w, h, fps, bps):
    """
    Try a small set of pipelines, most-likely-to-work first.
    Order is tuned to avoid the RGA_BLIT spam you saw.
    """
    candidates = [
        # Best case: NV12 directly, no convert, dmabuf
        ("dmabuf + NV12 (no convert)", build_launch(device, w, h, fps, bps,
                                                   io_mode="dmabuf", src_format="NV12",
                                                   use_dmabuf_caps=True, convert_to_nv12=False)),
        ("dmabuf + NV12 (no convert, no mem caps)", build_launch(device, w, h, fps, bps,
                                                                 io_mode="dmabuf", src_format="NV12",
                                                                 use_dmabuf_caps=False, convert_to_nv12=False)),
        # If camera is UYVY, convert to NV12 (still prefer dmabuf)
        ("dmabuf + UYVY -> NV12", build_launch(device, w, h, fps, bps,
                                              io_mode="dmabuf", src_format="UYVY",
                                              use_dmabuf_caps=True, convert_to_nv12=True)),
        ("dmabuf + UYVY -> NV12 (no mem caps)", build_launch(device, w, h, fps, bps,
                                                             io_mode="dmabuf", src_format="UYVY",
                                                             use_dmabuf_caps=False, convert_to_nv12=True)),
        # Fallbacks: mmap
        ("mmap + NV12 (no convert)", build_launch(device, w, h, fps, bps,
                                                 io_mode="mmap", src_format="NV12",
                                                 use_dmabuf_caps=False, convert_to_nv12=False)),
        ("mmap + UYVY -> NV12", build_launch(device, w, h, fps, bps,
                                            io_mode="mmap", src_format="UYVY",
                                            use_dmabuf_caps=False, convert_to_nv12=True)),
    ]

    for label, launch in candidates:
        print(f"[TRY] {label}")
        print(f"      {launch}")
        if _preflight_ok(launch):
            print(f"[OK ] Using: {label}")
            return launch

    raise RuntimeError("No working pipeline found for this device/mode/caps combination.")

# ----------------------------
# RTSP Server
# ----------------------------
class Server(GstRtspServer.RTSPServer):
    def __init__(self, launch, port, mount="/stream"):
        super().__init__()
        self.set_service(str(port))

        factory = GstRtspServer.RTSPMediaFactory()
        factory.set_launch(launch)
        factory.set_shared(True)

        # Optional; not all gi builds expose it—safe to ignore if missing.
        try:
            factory.set_latency(0)
        except Exception:
            pass

        self.get_mount_points().add_factory(mount, factory)
        self.attach(None)

# ----------------------------
# Main
# ----------------------------
if __name__ == "__main__":
    DEVICE = "/dev/video0"
    WIDTH, HEIGHT = 1280, 720
    FPS = 20
    BITRATE = 4_000_000
    PORT = 8554
    MOUNT = "/stream"

    launch = pick_working_launch(DEVICE, WIDTH, HEIGHT, FPS, BITRATE)
    print("LAUNCH:", launch)

    srv = Server(launch, PORT, MOUNT)
    ip = get_local_ip()
    print(f"RTSP stream: rtsp://{ip}:{PORT}{MOUNT}")

    GLib.MainLoop().run()