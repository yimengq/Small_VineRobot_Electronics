#!/usr/bin/env python3


'''
TODO : figure out pipeline for this rpi camera
currently using this line of bash code:  gst-launch-1.0 v4l2src device=/dev/video0 io-mode=dmabuf ! video/x-raw,format=NV12! videoconvert ! jpegenc ! queue max-size-buffers=10 leaky=downstream ! tcpserversink host=0.0.0.0  port=8080 sync=false

running this on client side: gst-launch-1.0 tcpclientsrc host=192.168.1.53 port=8080 !  jpegdec ! videoconvert ! autovideosink

it works when runnning locally on radxa, but doesn't work when running remotely
but even when it works, it freezes sometimes.

'''
import gi
gi.require_version('Gst', '1.0')
gi.require_version('GstRtspServer', '1.0')
from gi.repository import Gst, GstRtspServer, GLib

Gst.init(None)

def build_launch(device, w, h, fps, bps):
    h_enc = h if (h % 16) == 0 else ((h + 15) // 16) * 16
    caps_src = f"video/x-raw,format=NV12,width={w},height={h},framerate={fps}/1"
    caps_enc = f"video/x-raw,format=NV12,width={w},height={h_enc}"

    # Choose encoder
    if Gst.ElementFactory.find('v4l2h264enc'):
        enc = f'v4l2h264enc extra-controls="encode,video_bitrate={bps}" ! h264parse config-interval=1'
    elif Gst.ElementFactory.find('mpph264enc'):
        enc = f"mpph264enc rc-mode=cbr bps={bps} gop={fps} ! h264parse config-interval=1"
    else:
        # Software fallback → x264enc expects I420
        caps_enc = f"video/x-raw,format=I420,width={w},height={h_enc}"
        enc = f"x264enc tune=zerolatency speed-preset=ultrafast bitrate={bps//1000} key-int-max={fps} ! h264parse config-interval=1"

    # Converter
    if Gst.ElementFactory.find('rkvideoconvert'):
        convert = f"rkvideoconvert ! {caps_enc}"
    elif Gst.ElementFactory.find('mppvideoconvert'):
        convert = f"mppvideoconvert ! {caps_enc}"
    else:
        convert = f"videoconvert ! {caps_enc}"

    pipeline = (
        f"v4l2src device={device} io-mode=dmabuf ! {caps_src} ! "
        f"{convert} ! "
        f"{enc} ! rtph264pay name=pay0 pt=96"
    )
    return pipeline

class Server(GstRtspServer.RTSPServer):
    def __init__(self, device, w, h, fps, bps, port, mount="/stream"):
        super().__init__()
        self.set_service(str(port))  # set port before attach
        factory = GstRtspServer.RTSPMediaFactory()
        pipe = build_launch(device, w, h, fps, bps)
        print("LAUNCH:", pipe)
        factory.set_launch(pipe)  # no extra ')'
        factory.set_shared(True)
        self.get_mount_points().add_factory(mount, factory)
        self.attach(None)

if __name__ == "__main__":
    srv = Server("/dev/video0", 1280, 720, 20, 2_000_000, 8554)
    print("RTSP stream ready at rtsp://0.0.0.0:8554/stream")
    GLib.MainLoop().run()
