#!/usr/bin/env python3
import socket
import gi

gi.require_version("Gst", "1.0")
gi.require_version("GstRtspServer", "1.0")
gi.require_version("GstRtsp", "1.0")

from gi.repository import Gst, GstRtspServer, GstRtsp, GLib

Gst.init(None)


def get_local_ip():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        s.connect(("8.8.8.8", 80))
        return s.getsockname()[0]
    except Exception:
        return "127.0.0.1"
    finally:
        s.close()


def build_launch(device, w, h, fps, bps, assume_nv12=True, io_mode="dmabuf"):
    """
    assume_nv12=True  -> expects camera can output NV12 directly (best/lowest-latency, no RGA conversion step)
    assume_nv12=False -> assumes camera outputs UYVY and converts to NV12 (use only if needed)
    """

    # Encoder preference: mpph264enc -> v4l2h264enc -> x264enc
    if Gst.ElementFactory.find("mpph264enc"):
        enc = f"mpph264enc rc-mode=cbr bps={bps} gop={fps} ! h264parse config-interval=1"
        print("[ENC] mpph264enc")
    elif Gst.ElementFactory.find("v4l2h264enc"):
        enc = f'v4l2h264enc extra-controls="encode,video_bitrate={bps}" ! h264parse config-interval=1'
        print("[ENC] v4l2h264enc")
    else:
        kbps = max(1, bps // 1000)
        enc = (
            f"x264enc tune=zerolatency speed-preset=ultrafast bitrate={kbps} "
            f"key-int-max={fps} threads=2 vbv-buf-capacity=1 "
            f"! h264parse config-interval=1 aggregate-mode=zero-latency"
        )
        print("[ENC] x264enc")

    # Source caps
    if assume_nv12:
        caps_src = f"video/x-raw,format=NV12,width={w},height={h},framerate={fps}/1"
        # IMPORTANT: no videoconvert here -> avoids RGA_BLIT issues you saw
        convert_chain = ""
    else:
        # Fallback if your camera is actually UYVY:
        caps_src = f"video/x-raw,format=UYVY,width={w},height={h},framerate={fps}/1"
        # Prefer Rockchip converters if present, else videoconvert
        if Gst.ElementFactory.find("rkvideoconvert"):
            conv = "rkvideoconvert"
        elif Gst.ElementFactory.find("mppvideoconvert"):
            conv = "mppvideoconvert"
        else:
            conv = "videoconvert"
        convert_chain = f"! {conv} ! video/x-raw,format=NV12,width={w},height={h} "

    pipeline = (
        f"v4l2src device={device} io-mode={io_mode} do-timestamp=true ! {caps_src} "
        f"! queue max-size-buffers=1 max-size-bytes=0 max-size-time=0 leaky=downstream "
        f"{convert_chain}"
        f"! queue max-size-buffers=1 max-size-bytes=0 max-size-time=0 leaky=downstream "
        f"! {enc} "
        f"! rtph264pay name=pay0 pt=96 config-interval=1"
    )
    return pipeline


class Server(GstRtspServer.RTSPServer):
    def __init__(self, launch, port=8554, mount="/stream"):
        super().__init__()

        # Bind to all interfaces (very important)
        self.set_address("0.0.0.0")
        self.set_service(str(port))

        factory = GstRtspServer.RTSPMediaFactory()
        factory.set_launch(launch)
        factory.set_shared(True)

        # Force RTSP/RTP over TCP (much more reliable than UDP on many LANs)
        factory.set_protocols(GstRtsp.RTSPLowerTrans.TCP)

        self.get_mount_points().add_factory(mount, factory)
        self.attach(None)


if __name__ == "__main__":
    DEVICE = "/dev/video0"
    WIDTH, HEIGHT = 1280, 720
    FPS = 20
    BITRATE = 4_000_000
    PORT = 8554
    MOUNT = "/stream"

    # Try NV12-first (most likely to avoid your RGA errors)
    # If your camera is not NV12, set assume_nv12=False
    LAUNCH = build_launch(DEVICE, WIDTH, HEIGHT, FPS, BITRATE, assume_nv12=True, io_mode="dmabuf")

    print("LAUNCH:", LAUNCH)
    srv = Server(LAUNCH, PORT, MOUNT)

    ip = get_local_ip()
    print(f"RTSP stream: rtsp://{ip}:{PORT}{MOUNT}  (TCP forced)")
    GLib.MainLoop().run()