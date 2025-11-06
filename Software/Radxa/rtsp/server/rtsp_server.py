

#!/usr/bin/env python3
import socket
import gi
gi.require_version('Gst', '1.0')
gi.require_version('GstRtspServer', '1.0')
from gi.repository import Gst, GstRtspServer, GLib

Gst.init(None)

def build_launch(device, w, h, fps, bps):
    # Source requests EXACTLY 1280x720 @ 20 fps NV12
    caps_src = f"video/x-raw,format=NV12,width={w},height={h},framerate={fps}/1"
    caps_enc = f"video/x-raw,format=NV12,width={w},height={h}"

    # Pick encoder (HW → MPP → software)
    if Gst.ElementFactory.find('v4l2h264enc'):
        enc = (
            f'v4l2h264enc extra-controls="encode,video_bitrate={bps}" '
            f'! h264parse config-interval=1'
        )
        print("v4l2h264enc")
    elif Gst.ElementFactory.find('mpph264enc'):
        # Low-latency CBR, GOP ≈ fps
        enc = f"mpph264enc rc-mode=cbr bps={bps} gop={fps} ! h264parse config-interval=1"
        print("mpph264enc")
    else:
        # Software fallback – true low-latency
        caps_enc = f"video/x-raw,format=I420,width={w},height={h}"
        enc = (
            f"x264enc tune=zerolatency speed-preset=ultrafast bitrate={bps//1000} "
            f"key-int-max={fps} vbv-buf-capacity=1 threads=2 "
            f"! h264parse config-interval=1 aggregate-mode=zero-latency"
        )
        print("x264enc")

    # Converter (prefer rk/mpp, else generic)
    if Gst.ElementFactory.find('rkvideoconvert'):
        convert = f"rkvideoconvert ! {caps_enc}"
    elif Gst.ElementFactory.find('mppvideoconvert'):
        convert = f"mppvideoconvert ! {caps_enc}"
    else:
        convert = f"videoconvert ! {caps_enc}"

    # Leaky queues keep latency tiny (drop old frames)
    pipeline = (
        f"v4l2src device={device} io-mode=mmap do-timestamp=true ! {caps_src} "
        f"! queue max-size-buffers=1 max-size-bytes=0 max-size-time=0 leaky=downstream "
        f"! {convert} "
        f"! queue max-size-buffers=1 max-size-bytes=0 max-size-time=0 leaky=downstream "
        f"! {enc} "
        f"! rtph264pay name=pay0 pt=96 config-interval=1"
    )
    return pipeline

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
