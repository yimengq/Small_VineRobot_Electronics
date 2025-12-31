

#!/usr/bin/env python3
import socket
import gi
import subprocess
gi.require_version('Gst', '1.0')
gi.require_version('GstRtspServer', '1.0')
from gi.repository import Gst, GstRtspServer, GLib

Gst.init(None)

def detect_v4l2_format(device: str) -> str | None:
    """
    Returns a V4L2 fourcc like 'NV12', 'UYVY', 'YUYV' if v4l2-ctl is available.
    If it fails, return None and we fall back to NV12 request.
    """
    try:
        out = subprocess.check_output(
            ["v4l2-ctl", "-d", device, "--get-fmt-video"],
            text=True, stderr=subprocess.STDOUT
        )
        # Example line: "Pixel Format      : 'UYVY'"
        for line in out.splitlines():
            if "Pixel Format" in line and "'" in line:
                return line.split("'")[1]
    except Exception:
        return None
    return None


def build_launch(device, w, h, fps, bps):
    # --- Decide source format (prefer what the camera truly outputs) ---
    cam_fmt = detect_v4l2_format(device)  # e.g., 'NV12', 'UYVY', 'YUYV'
    # If we can't detect, keep your original assumption
    src_fmt = cam_fmt if cam_fmt else "NV12"

    # --- Encoder selection ---
    use_v4l2_hw = bool(Gst.ElementFactory.find("v4l2h264enc"))
    use_mpp_hw  = bool(Gst.ElementFactory.find("mpph264enc"))

    if use_v4l2_hw:
        # v4l2 encoder usually wants NV12/I420; NV12 is a good target
        enc_in_fmt = "NV12"
        enc = (
            f'v4l2h264enc extra-controls="encode,video_bitrate={bps}" '
            f'! h264parse config-interval=1'
        )
        print("v4l2h264enc")
    elif use_mpp_hw:
        enc_in_fmt = "NV12"
        enc = f"mpph264enc rc-mode=cbr bps={bps} gop={fps} ! h264parse config-interval=1"
        print("mpph264enc")
    else:
        # software x264 likes I420
        enc_in_fmt = "I420"
        enc = (
            f"x264enc tune=zerolatency speed-preset=ultrafast bitrate={bps//1000} "
            f"key-int-max={fps} vbv-buf-capacity=1 threads=2 "
            f"! h264parse config-interval=1 aggregate-mode=zero-latency"
        )
        print("x264enc")

    # --- Caps ---
    caps_src = f"video/x-raw,format={src_fmt},width={w},height={h},framerate={fps}/1"
    caps_enc = f"video/x-raw,format={enc_in_fmt},width={w},height={h}"

    # --- Convert ONLY if needed; avoid RGA by not using rkvideoconvert/mppvideoconvert ---
    if src_fmt == enc_in_fmt:
        convert = ""  # no-op (prevents RGA blit errors)
    else:
        convert = f"videoconvert ! {caps_enc}"

    # --- io-mode: try dmabuf (often better on rk), fall back to mmap if you want ---
    # If dmabuf isn't supported on your kernel/driver, change back to mmap.
    io_mode = "dmabuf"

    pipeline = (
        f"v4l2src device={device} io-mode={io_mode} do-timestamp=true ! {caps_src} "
        f"! queue max-size-buffers=1 max-size-bytes=0 max-size-time=0 leaky=downstream "
        f"! {convert} "
        f"! queue max-size-buffers=1 max-size-bytes=0 max-size-time=0 leaky=downstream "
        f"! {enc} "
        f"! rtph264pay name=pay0 pt=96 config-interval=1"
    )

    # Clean up double spaces if convert == ""
    pipeline = " ".join(pipeline.split())
    return pipeline

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

class Server(GstRtspServer.RTSPServer):
    def __init__(self, device, w, h, fps, bps, port, mount="/stream"):
        super().__init__()
        self.set_service(str(port))
        factory = GstRtspServer.RTSPMediaFactory()
        pipe = build_launch(device, w, h, fps, bps)
        print("LAUNCH:", pipe)
        factory.set_launch(pipe)
        factory.set_shared(True)
        self.get_mount_points().add_factory(mount, factory)
        self.attach(None)

def get_local_ip():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        # doesn’t need to be reachable — just a non-local address
        s.connect(("8.8.8.8", 80))
        return s.getsockname()[0]
    except Exception:
        return "127.0.0.1"
    finally:
        s.close()

# ffmpeg -f v4l2 -i /dev/video10        -vf format=yuv420p        -vcodec mjpeg -q:v 5        -f mpjpeg -listen 1 http://0.0.0.0:8080/
if __name__ == "__main__":
    DEVICE = "/dev/video0"
    WIDTH, HEIGHT = 1280, 720
    FPS = 15                 # <- requested 20 fps
    BITRATE = 4_000_000      # 4 Mbps (tune up/down as needed)
    PORT = 8554
    MOUNT = "/stream"

    srv = Server(DEVICE, WIDTH, HEIGHT, FPS, BITRATE, PORT, MOUNT)
    ip = get_local_ip()
    print(f"RTSP stream: rtsp://{ip}:{PORT}{MOUNT}")
    GLib.MainLoop().run()
