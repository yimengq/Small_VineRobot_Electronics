#!/usr/bin/env python3
import argparse, gi
import os
import spidev

gi.require_version('Gst', '1.0')
gi.require_version('GstRtspServer', '1.0')
gi.require_version('GLib', '2.0')
from gi.repository import Gst, GstRtspServer, GLib

os.environ["GST_PLUGIN_PATH"] = "/usr/lib/aarch64-linux-gnu/gstreamer-1.0"
os.environ["GST_PLUGIN_SYSTEM_PATH"] = "/usr/lib/aarch64-linux-gnu/gstreamer-1.0"
os.environ["GST_PLUGIN_SCANNER"] = "/usr/lib/aarch64-linux-gnu/gstreamer-1.0/gst-plugin-scanner"


Gst.init(None)

#LED CODE --------------------
N = 3                # total LEDs on your strip (change me)
BUS, DEV = 3, 0        # /dev/spidev3.0
HZ = 1_000_000         # 1 MHz SPI
BRIGHT = 31            # 0..31 APA102 global brightness

spi = spidev.SpiDev()
spi.open(BUS, DEV)
spi.max_speed_hz = HZ
spi.mode = 0

# Build frame:
# start frame: 4x 0x00
start = [0x00, 0x00, 0x00, 0x00]

# first 3 LEDs: white (R=G=B=255), APA102 order is [0b111xxxxx, B, G, R]
on = [ (0b11100000 | BRIGHT, 255, 255, 255) ] * 3

# remaining LEDs off
off = [ (0b11100000 | BRIGHT, 0, 0, 0) ] * (N - 3)

# end frame: at least ceil(N/16) bytes of 0xFF
end = [0xFF] * ((N + 15) // 16)

frame = start + [b for led in (on + off) for b in led] + end
spi.xfer2(frame)
spi.close()
#LED CODE --------------------


def have(elem: str) -> bool:
    return bool(Gst.ElementFactory.find(elem))

def build_launch(device, w, h, fps, bps):
    # Rockchip encoders generally want 16-aligned height; pad 1080->1088
    h_enc = h if (h % 16) == 0 else ((h + 15) // 16) * 16

    caps_src = f"video/x-raw,format=NV12,width={w},height={h},framerate={fps}/1"
    caps_enc = f"video/x-raw,format=NV12,width={w},height={h_enc}"

    if have('mpph264enc'):
        enc = f"mpph264enc rc-mode=cbr bps={bps} gop={fps} ! h264parse config-interval=-1"
    else:
        # Software fallback encoder... some issues with gst/mpp264 on Rockchip 
        enc = f"x264enc tune=zerolatency speed-preset=veryfast bitrate={bps//1000} key-int-max={fps} ! h264parse config-interval=-1"

    if have('rkvideoconvert'):
        convert = f"rkvideoconvert ! {caps_enc}"
    elif have('mppvideoconvert'):
        convert = f"mppvideoconvert ! {caps_enc}"
    else:
        convert = f"videoscale ! {caps_enc}"

    pipeline = (
        f"v4l2src device={device} ! {caps_src} ! "
        f"{convert} ! "
        f"{enc} ! rtph264pay name=pay0 pt=96"
    )
    return pipeline

class Server(GstRtspServer.RTSPServer):
    def __init__(self, device, w, h, fps, bps, mount="/stream"):
        super().__init__()
        factory = GstRtspServer.RTSPMediaFactory()
        factory.set_launch(build_launch(device, w, h, fps, bps))
        factory.set_shared(True)
        self.get_mount_points().add_factory(mount, factory)
        self.attach(None)

def main():
    ap = argparse.ArgumentParser(description="GStreamer RTSP server (with MPP fallback)")
    ap.add_argument("--device", default="/dev/video0")
    ap.add_argument("--width", type=int, default=1920)
    ap.add_argument("--height", type=int, default=1080)
    ap.add_argument("--fps", type=int, default=60)
    ap.add_argument("--bitrate", type=int, default=20_000_000, help="bps (e.g. 20000000 for 20 Mbps)")
    ap.add_argument("--port", type=int, default=8554)
    ap.add_argument("--mount", default="/stream")
    args = ap.parse_args()

    # Optional: print which encoder we’ll use
    enc_name = "mpph264enc" if have('mpph264enc') else "x264enc"
    print(f"Using encoder: {enc_name}")
    print(f"RTSP: rtsp://192.168.1.49:{args.port}{args.mount}")
    print("This IP addr is not guaranteed. Inspect Radxa ip if encountering issues")

    # Bind port
    server = Server(args.device, args.width, args.height, args.fps, args.bitrate, args.mount)
    server.props.service = str(args.port)

    loop = GLib.MainLoop()
    loop.run()

if __name__ == "__main__":
    main()

