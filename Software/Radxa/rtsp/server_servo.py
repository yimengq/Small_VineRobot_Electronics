#!/usr/bin/env python3
# server_servo.py — RTSP server + stdin-controlled, inverted-PWM servos
# HARD-CODED: servo1 -> pwmchip9:channel0, servo2 -> pwmchip8:channel0

import os, sys, shutil, argparse, gi, time

# ---------- Robust headless GStreamer env (auto-detect scanner) ----------
os.environ.setdefault("GST_PLUGIN_PATH", "/usr/lib/aarch64-linux-gnu/gstreamer-1.0")
os.environ.setdefault("GST_PLUGIN_SYSTEM_PATH", "/usr/lib/aarch64-linux-gnu/gstreamer-1.0")

scanner = shutil.which("gst-plugin-scanner")
if not scanner:
    fallback = "/usr/lib/aarch64-linux-gnu/gstreamer1.0/gstreamer-1.0/gst-plugin-scanner"
    if os.path.exists(fallback):
        scanner = fallback
if scanner:
    os.environ["GST_PLUGIN_SCANNER"] = scanner

# Headless runtime dir (avoid XDG warnings)
os.environ.setdefault("XDG_RUNTIME_DIR", f"/run/user/{os.getuid()}")
try:
    os.makedirs(os.environ["XDG_RUNTIME_DIR"], exist_ok=True)
except Exception:
    pass

gi.require_version('Gst', '1.0')
gi.require_version('GstRtspServer', '1.0')
gi.require_version('GLib', '2.0')
from gi.repository import Gst, GstRtspServer, GLib

Gst.init(None)

def have(elem: str) -> bool:
    return bool(Gst.ElementFactory.find(elem))

def build_launch(device, w, h, fps, bps):
    # Rockchip encoders like 16-aligned height
    h_enc = h if (h % 16) == 0 else ((h + 15) // 16) * 16
    caps_src = f"video/x-raw,format=NV12,width={w},height={h},framerate={fps}/1"
    caps_enc = f"video/x-raw,format=NV12,width={w},height={h_enc}"

    if have('mpph264enc'):
        enc = f"mpph264enc rc-mode=cbr bps={bps} gop={fps} ! h264parse config-interval=-1"
    else:
        enc = f"x264enc tune=zerolatency speed-preset=veryfast bitrate={bps//1000} key-int-max={fps} ! h264parse config-interval=-1"

    if have('rkvideoconvert'):
        convert = f"rkvideoconvert ! {caps_enc}"
    elif have('mppvideoconvert'):
        convert = f"mppvideoconvert ! {caps_enc}"
    else:
        convert = f"videoscale ! {caps_enc}"

    return (
        f"v4l2src device={device} ! {caps_src} ! "
        f"{convert} ! "
        f"{enc} ! rtph264pay name=pay0 pt=96"
    )

class Server(GstRtspServer.RTSPServer):
    def __init__(self, device, w, h, fps, bps, mount="/stream"):
        super().__init__()
        factory = GstRtspServer.RTSPMediaFactory()
        factory.set_launch(build_launch(device, w, h, fps, bps))
        factory.set_shared(True)
        self.get_mount_points().add_factory(mount, factory)
        self.attach(None)

# ----------------------------- PWM / Servo ------------------------------
import mraa

class PWMOut:
    """
    Simple PWM wrapper for servos (defaults to 50 Hz).
    NOTE: Inverts duty (active-low): duty = 1 - (pulse_us / period_us)
    """
    def __init__(self, chip: int, channel: int = 0, freq_hz: float = 50.0):
        self._chip = int(chip)
        self._channel = int(channel)
        self._p = mraa.Pwm(self._channel, True, self._chip)  # owner=True => unexport on delete
        self._enabled = False
        self._period_us = None
        self._closed = False
        self.set_frequency(freq_hz)
        self.enable(True)

    def set_frequency(self, freq_hz: float):
        if self._closed:
            raise RuntimeError("PWMOut is closed")
        if freq_hz <= 0:
            raise ValueError("freq_hz must be > 0")
        period_us = int(round(1_000_000.0 / float(freq_hz)))
        was_enabled = self._enabled
        if was_enabled:
            self.enable(False)
        self._p.period_us(period_us)
        self._period_us = period_us
        if was_enabled:
            self.enable(True)

    def set_pulse_us(self, pulse_us: int):
        if self._closed:
            raise RuntimeError("PWMOut is closed")
        if self._period_us is None:
            raise RuntimeError("Frequency/period not initialized")
        if not (0 <= pulse_us <= self._period_us):
            raise ValueError(f"pulse_us must be within [0, {self._period_us}]")
        duty = 1.0 - (pulse_us / self._period_us)  # inverted
        self._p.write(duty)

    def enable(self, on: bool):
        if self._closed:
            return
        self._p.enable(bool(on))
        self._enabled = bool(on)

    def close(self):
        if self._closed:
            return
        try:
            try:
                self.enable(False)
            except Exception:
                pass
            self._p = None
        finally:
            self._closed = True

def clamp(v, lo, hi):
    return lo if v < lo else hi if v > hi else v

def angle_to_us(angle: float, min_us: int = 1000, max_us: int = 2000) -> int:
    angle = max(0.0, min(180.0, float(angle)))
    return int(round(min_us + (angle / 180.0) * (max_us - min_us)))

# ----------------------------- Main / CLI -------------------------------
def main():
    ap = argparse.ArgumentParser(description="RTSP server + servo control via stdin (hardcoded pwmchip9:0 and pwmchip8:0)")
    ap.add_argument("--device", default="/dev/video0")
    ap.add_argument("--width", type=int, default=1920)
    ap.add_argument("--height", type=int, default=1080)
    ap.add_argument("--fps", type=int, default=60)
    ap.add_argument("--bitrate", type=int, default=20_000_000, help="bps (e.g. 20000000 for 20 Mbps)")
    ap.add_argument("--port", type=int, default=8554)
    ap.add_argument("--mount", default="/stream")
    ap.add_argument("--servo-freq", type=float, default=50.0, help="Servo PWM frequency in Hz")
    ap.add_argument("--min-us", type=int, default=1000)
    ap.add_argument("--max-us", type=int, default=2000)
    args = ap.parse_args()

    enc = "mpph264enc" if have('mpph264enc') else "x264enc"
    print(f"Using encoder: {enc}")
    print(f"RTSP: rtsp://<RADXA-IP>:{args.port}{args.mount}")
    print("Commands (stdin):")
    print("  s1 angle 90 | s1 us 1500 | s1 on | s1 off")
    print("  s2 angle 30 | s2 us 1800 | s2 on | s2 off")
    print("  freq 50     | quit\n")

    # RTSP
    server = Server(args.device, args.width, args.height, args.fps, args.bitrate, args.mount)
    server.props.service = str(args.port)

    # Servos — HARD-CODED: s1 -> pwmchip9:channel0, s2 -> pwmchip8:channel0
    servo1 = servo2 = None
    try:
        servo1 = PWMOut(chip=9, channel=0, freq_hz=args.servo_freq)
    except Exception as e:
        print(f"[WARN] servo1 init failed (chip=9, ch=0): {e}")
    try:
        servo2 = PWMOut(chip=8, channel=0, freq_hz=args.servo_freq)
    except Exception as e:
        print(f"[WARN] servo2 init failed (chip=8, ch=0): {e}")

    state = {"loop": None, "s1": servo1, "s2": servo2, "min_us": args.min_us, "max_us": args.max_us}

    # --------- FIXED stdin handler: properly unpack read_line() result ---------
    def on_stdin(channel, condition, _data):
        try:
            res = channel.read_line()
        except Exception:
            return True

        # res can be (status, line) or (status, line, length)
        if not isinstance(res, tuple) or len(res) < 2:
            return True
        status, line = res[0], res[1]

        if status != GLib.IOStatus.NORMAL or not line:
            return True

        cmd = line.strip()
        if not cmd:
            return True

        toks = cmd.split()
        t0 = toks[0].lower()

        def pick(which):
            return state.get(which)

        try:
            if t0 in ("quit", "exit"):
                print("Exiting…")
                if state["loop"]:
                    state["loop"].quit()
                return False

            elif t0 == "freq" and len(toks) >= 2:
                hz = float(toks[1])
                if state["s1"]: state["s1"].set_frequency(hz)
                if state["s2"]: state["s2"].set_frequency(hz)
                print(f"Frequency set to {hz} Hz")

            elif t0 in ("s1", "s2"):
                s = pick(t0)
                if not s:
                    print(f"{t0} not available")
                    return True
                if len(toks) == 1:
                    print(f"Usage: {t0} angle <deg> | {t0} us <µs> | {t0} on|off")
                    return True

                t1 = toks[1].lower()
                if t1 == "angle" and len(toks) >= 3:
                    deg = float(toks[2])
                    us = angle_to_us(deg, state["min_us"], state["max_us"])
                    s.set_pulse_us(us)
                    print(f"{t0} -> angle {deg:.1f}°, {us} µs")

                elif t1 == "us" and len(toks) >= 3:
                    us = int(float(toks[2]))
                    us = clamp(us, 0, s._period_us or 20000)
                    s.set_pulse_us(us)
                    print(f"{t0} -> {us} µs")

                elif t1 == "on":
                    s.enable(True); print(f"{t0} enabled")

                elif t1 == "off":
                    s.enable(False); print(f"{t0} disabled")

                else:
                    # shorthand: "s1 1500" means µs
                    try:
                        us = int(float(toks[1]))
                        us = clamp(us, 0, s._period_us or 20000)
                        s.set_pulse_us(us)
                        print(f"{t0} -> {us} µs")
                    except Exception:
                        print(f"Unrecognized: {cmd}")
            else:
                print(f"Unrecognized: {cmd}")

        except Exception as e:
            print(f"[ERR] {cmd!r} failed: {e}")

        return True  # keep watching
    # -------------------------------------------------------------------------

    # Make sure the IOChannel has a sane encoding for line reads
    ch = GLib.IOChannel.unix_new(sys.stdin.fileno())
    try:
        ch.set_encoding("UTF-8")
    except Exception:
        pass
    GLib.io_add_watch(ch, GLib.IOCondition.IN, on_stdin, None)

    loop = GLib.MainLoop()
    state["loop"] = loop

    try:
        loop.run()
    finally:
        for key in ("s1", "s2"):
            try:
                if state[key]:
                    state[key].close()
            except Exception:
                pass

if __name__ == "__main__":
    main()