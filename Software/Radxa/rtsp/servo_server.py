import math
from aiohttp import web
import mraa

# --------------------------
# Your PWMOut (unchanged)
# --------------------------
class PWMOut:
    def __init__(self, chip: int, channel: int = 0, freq_hz: float = 50.0):
        self._chip = int(chip)
        self._channel = int(channel)

        # owner=True makes mraa unexport on GC
        self._p = mraa.Pwm(self._channel, True, self._chip)

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

        self._p.period_us(period_us)  # setter only
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

        # NOTE: Your implementation inverts duty (1 - pulse/period).
        # Keep as-is to match your board’s polarity.
        duty = 1.0 - pulse_us / self._period_us
        print(f"[DEBUG] Set pulse: chip={self._chip}, channel={self._channel}, "
              f"pulse={pulse_us} us, duty={duty:.3%}")
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
            # Best-effort turn-off if you want:
            # self.enable(False)
            self._p = None
        finally:
            self._closed = True

    # context manager sugar
    def __enter__(self):
        if self._closed:
            raise RuntimeError("PWMOut is closed")
        return self

    def __exit__(self, exc_type, exc, tb):
        self.close()
# --------------------------
# Helpers
# --------------------------
def clamp(v, lo, hi):
    return lo if v < lo else hi if v > hi else v
def deg_to_us(deg: int) -> int:
    d = clamp(int(deg), ANGLE_MIN, ANGLE_MAX)
    span = SERVO_MAX_US - SERVO_MIN_US
    return int(SERVO_MIN_US + (span * (d / float(ANGLE_MAX))))
# --------------------------
# Configuration
# --------------------------
# Adjust these to match your /sys/class/pwm/pwmchipN/pwmM mapping:
SERVO1_PWM_CHIP = 9
SERVO1_PWM_CH   = 0
SERVO2_PWM_CHIP = 8
SERVO2_PWM_CH   = 0
SERVO_FREQ_HZ   = 50.0
# Angle → pulse mapping (change if your servos expect 500–2500 µs, etc.)
SERVO_MIN_US = 1000
SERVO_MAX_US = 2000
# Bounds
ANGLE_MIN = 0
ANGLE_MAX = 180
# --------------------------
# Hardware drivers (mraa-based)
# --------------------------
servo1 = PWMOut(chip=SERVO1_PWM_CHIP, channel=SERVO1_PWM_CH, freq_hz=SERVO_FREQ_HZ)
servo2 = PWMOut(chip=SERVO2_PWM_CHIP, channel=SERVO2_PWM_CH, freq_hz=SERVO_FREQ_HZ)

# Track last commanded angles (for /health)
last_angles = {"servo1": None, "servo2": None}

# --------------------------
# HTTP Handlers
# --------------------------
async def handle_servo(request: web.Request):
    """
    Expects JSON:
      { "servo1": int(0..180), "servo2": int(0..180) }
    Either field may be omitted (to move only one servo).
    """
    try:
        data = await request.json()
    except Exception:
        return web.json_response({"error": "invalid json"}, status=400)

    s1 = data.get("servo1", None)
    s2 = data.get("servo2", None)

    if s1 is None and s2 is None:
        return web.json_response({"error": "need servo1 and/or servo2"}, status=400)

    # Validate & clamp
    try:
        if s1 is not None:
            s1 = int(s1)
            s1 = clamp(s1, ANGLE_MIN, ANGLE_MAX)
        if s2 is not None:
            s2 = int(s2)
            s2 = clamp(s2, ANGLE_MIN, ANGLE_MAX)
    except ValueError:
        return web.json_response({"error": "servo values must be integers"}, status=400)

    # Convert to pulse width and write via mraa
    try:
        if s1 is not None:
            servo1.set_pulse_us(deg_to_us(s1))
            last_angles["servo1"] = s1
        if s2 is not None:
            servo2.set_pulse_us(deg_to_us(s2))
            last_angles["servo2"] = s2
    except Exception as e:
        return web.json_response({"error": f"hardware write failed: {e}"}, status=500)

    return web.json_response({"ok": True, "servo1": s1, "servo2": s2})

async def health(_request: web.Request):
    return web.json_response({
        "ok": True,
        "freq_hz": SERVO_FREQ_HZ,
        "pulse_range_us": [SERVO_MIN_US, SERVO_MAX_US],
        "angle_range_deg": [ANGLE_MIN, ANGLE_MAX],
        "last": last_angles,
    })

# --------------------------
# App wiring
# --------------------------
app = web.Application()
app.router.add_post("/servo", handle_servo)
app.router.add_get("/health", health)

# Graceful cleanup to release PWM
async def on_cleanup(app_):
    try:
        servo1.close()
    except Exception:
        pass
    try:
        servo2.close()
    except Exception:
        pass

app.on_cleanup.append(on_cleanup)

if __name__ == "__main__":
    # Binding to port 80 requires sudo/root
    web.run_app(app, host="0.0.0.0", port=80)
