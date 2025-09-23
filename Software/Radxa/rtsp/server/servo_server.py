# #!/usr/bin/env python3
# import os
# import math
# import json
# from aiohttp import web
# import mraa

# # --------------------------
# # Your PWMOut (clean)
# # --------------------------
# class PWMOut:
#     def __init__(self, chip: int, channel: int = 0, freq_hz: float = 50.0):
#         self._chip = int(chip)
#         self._channel = int(channel)
#         # owner=True makes mraa unexport on GC
#         self._p = mraa.Pwm(self._channel, True, self._chip)
#         self._enabled = False
#         self._period_us = None
#         self._closed = False
#         self.set_frequency(freq_hz)
#         self.enable(True)

#     def set_frequency(self, freq_hz: float):
#         if self._closed:
#             raise RuntimeError("PWMOut is closed")
#         if freq_hz <= 0:
#             raise ValueError("freq_hz must be > 0")
#         period_us = int(round(1_000_000.0 / float(freq_hz)))
#         was_enabled = self._enabled
#         if was_enabled:
#             self.enable(False)
#         self._p.period_us(period_us)
#         self._period_us = period_us
#         if was_enabled:
#             self.enable(True)

#     def set_pulse_us(self, pulse_us: int):
#         if self._closed:
#             raise RuntimeError("PWMOut is closed")
#         if self._period_us is None:
#             raise RuntimeError("Frequency/period not initialized")
#         if not (0 <= pulse_us <= self._period_us):
#             raise ValueError(f"pulse_us must be within [0, {self._period_us}]")
#         # Keep polarity as your board expects
#         duty = 1.0 - (pulse_us / self._period_us)
#         print(f"[DEBUG] Set pulse: chip={self._chip}, channel={self._channel}, "
#               f"pulse={pulse_us} us, duty={duty:.3%}")
#         self._p.write(duty)

#     def enable(self, on: bool):
#         if self._closed:
#             return
#         self._p.enable(bool(on))
#         self._enabled = bool(on)

#     def close(self):
#         if self._closed:
#             return
#         try:
#             # Optionally: self.enable(False)
#             self._p = None
#         finally:
#             self._closed = True

#     def __enter__(self):
#         if self._closed:
#             raise RuntimeError("PWMOut is closed")
#         return self

#     def __exit__(self, exc_type, exc, tb):
#         self.close()

# # --------------------------
# # Helpers
# # --------------------------
# def clamp(v, lo, hi):
#     return lo if v < lo else hi if v > hi else v

# def deg_to_us(deg: int) -> int:
#     d = clamp(int(deg), ANGLE_MIN, ANGLE_MAX)
#     span = SERVO_MAX_US - SERVO_MIN_US
#     # Map 0..ANGLE_MAX linearly to SERVO_MIN_US..SERVO_MAX_US
#     return int(SERVO_MIN_US + (span * (d / float(ANGLE_MAX))))

# # --------------------------
# # Configuration
# # --------------------------
# SERVO1_PWM_CHIP = 0
# SERVO1_PWM_CH   = 0
# SERVO2_PWM_CHIP = 1
# SERVO2_PWM_CH   = 0
# SERVO_FREQ_HZ   = 50.0

# # If your servo expects 500–2500 µs, adjust these
# SERVO_MIN_US = 950
# SERVO_MAX_US = 2050


# SERVO1_ANGLE_MIN = -10
# SERVO1_ANGLE_MAX = 190

# SERVO2_ANGLE_MIN = 5
# SERVO2_ANGLE_MAX = 145

# # --------------------------
# # Hardware drivers (mraa-based)
# # --------------------------
# servo1 = PWMOut(chip=SERVO1_PWM_CHIP, channel=SERVO1_PWM_CH, freq_hz=SERVO_FREQ_HZ)
# servo2 = PWMOut(chip=SERVO2_PWM_CHIP, channel=SERVO2_PWM_CH, freq_hz=SERVO_FREQ_HZ)
# last_angles = {"servo1": None, "servo2": None}
# print(last_angles)
# # --------------------------
# # HTTP Handlers
# # --------------------------
# async def handle_servo(request: web.Request):
#     """
#     Expects JSON like:
#       { "servo1": 0..180, "servo2": 0..180 }
#     Either field may be omitted.
#     """
#     try:
#         data = await request.json()
#     except Exception:
#         return web.json_response({"error": "invalid json"}, status=400)

#     s1 = data.get("servo1", None)
#     s2 = data.get("servo2", None)

#     if s1 is None and s2 is None:
#         return web.json_response({"error": "need servo1 and/or servo2"}, status=400)

#     try:
#         if s1 is not None:
#             s1 = clamp(int(s1), SERVO1_ANGLE_MIN, SERVO1_ANGLE_MAX)
#         if s2 is not None:
#             s2 = clamp(int(s2), SERVO2_ANGLE_MIN, SERVO2_ANGLE_MAX)
#     except ValueError:
#         return web.json_response({"error": "servo values must be integers"}, status=400)

#     try:
#         if s1 is not None:
#             print(f"[DEBUG] Set servo1: {s1}°")
#             servo1.set_pulse_us(deg_to_us(s1))
#             last_angles["servo1"] = s1
#         if s2 is not None:
#             print(f"[DEBUG] Set servo2: {s2}°")
#             servo2.set_pulse_us(deg_to_us(s2))
#             last_angles["servo2"] = s2
#     except Exception as e:
#         return web.json_response({"error": f"hardware write failed: {e}"}, status=500)

#     print(f"[SERVO CMD] servo1={s1}°, servo2={s2}°")

#     return web.json_response({"ok": True, "servo1": s1, "servo2": s2})

# async def health(_request: web.Request):
#     return web.json_response({
#         "ok": True,
#         "freq_hz": SERVO_FREQ_HZ,
#         "pulse_range_us": [SERVO_MIN_US, SERVO_MAX_US],
#         "angle_range_deg": [ANGLE_MIN, ANGLE_MAX],
#         "last": last_angles,
#     })

# # --------------------------
# # App wiring
# # --------------------------
# app = web.Application()
# app.router.add_post("/servo", handle_servo)
# app.router.add_get("/health", health)

# async def on_cleanup(_app):
#     try:
#         servo1.close()
#     except Exception:
#         pass
#     try:
#         servo2.close()
#     except Exception:
#         pass

# app.on_cleanup.append(on_cleanup)

# # --------------------------
# # Main (port fallback)
# # --------------------------
# if __name__ == "__main__":
#     # Prefer non-privileged port unless explicitly overridden
#     port_env = os.getenv("PORT")
#     try:
#         port = int(port_env) if port_env else 80
#     except ValueError:
#         port = 80

#     try:
#         web.run_app(app, host="0.0.0.0", port=port)
#     except PermissionError as e:
#         # If user asked for a privileged port but lacks perms, auto-fallback to 80
#         if port < 1024:
#             print(f"[WARN] Permission denied on port {port}; retrying on 80...")
#             web.run_app(app, host="0.0.0.0", port=80)
#         else:
#             raise e





# # #!/usr/bin/env python3
# # import os
# # import math
# # import json
# # from aiohttp import web
# # import mraa

# # # --------------------------
# # # Your PWMOut (clean)
# # # --------------------------
# # class PWMOut:
# #     def __init__(self, chip: int, channel: int = 0, freq_hz: float = 50.0):
# #         self._chip = int(chip)
# #         self._channel = int(channel)
# #         # owner=True makes mraa unexport on GC
# #         self._p = mraa.Pwm(self._channel, True, self._chip)
# #         self._enabled = False
# #         self._period_us = None
# #         self._closed = False
# #         self.set_frequency(freq_hz)
# #         self.enable(True)

# #     def set_frequency(self, freq_hz: float):
# #         if self._closed:
# #             raise RuntimeError("PWMOut is closed")
# #         if freq_hz <= 0:
# #             raise ValueError("freq_hz must be > 0")
# #         period_us = int(round(1_000_000.0 / float(freq_hz)))
# #         was_enabled = self._enabled
# #         if was_enabled:
# #             self.enable(False)
# #         self._p.period_us(period_us)
# #         self._period_us = period_us
# #         if was_enabled:
# #             self.enable(True)

   
        

# #     def set_pulse_us(self, pulse_us: int):
# #         if self._closed:
# #             raise RuntimeError("PWMOut is closed")
# #         if self._period_us is None:
# #             raise RuntimeError("Frequency/period not initialized")
# #         if not (0 <= pulse_us <= self._period_us):
# #             raise ValueError(f"pulse_us must be within [0, {self._period_us}]")
# #         # Keep polarity as your board expects
# #         duty = (pulse_us / self._period_us)  # <-- assume active-high (normal)
# #         print(f"[DEBUG] Set pulse: chip={self._chip}, channel={self._channel}, "
# #               f"pulse={pulse_us} us, duty={duty:.3%}")
# #         self._p.write(duty)

# #     def enable(self, on: bool):
# #         if self._closed:
# #             return
# #         self._p.enable(bool(on))
# #         self._enabled = bool(on)

# #     def close(self):
# #         if self._closed:
# #             return
# #         try:
# #             # Optionally: self.enable(False)
# #             self._p = None
# #         finally:
# #             self._closed = True

# #     def __enter__(self):
# #         if self._closed:
# #             raise RuntimeError("PWMOut is closed")
# #         return self

# #     def __exit__(self, exc_type, exc, tb):
# #         self.close()

# # # --------------------------
# # # Helpers
# # # --------------------------
# # def clamp(v, lo, hi):
# #     return lo if v < lo else hi if v > hi else v

# # def deg_to_us(deg: int) -> int:
# #     d = clamp(int(deg), ANGLE_MIN, ANGLE_MAX)
# #     span = SERVO_MAX_US - SERVO_MIN_US
# #     # Map 0..ANGLE_MAX linearly to SERVO_MIN_US..SERVO_MAX_US
# #     return int(SERVO_MIN_US + (span * (d / float(ANGLE_MAX))))

# # def ensure_pwm_export(chip: int, channel: int):
# #         base = f"/sys/class/pwm/pwmchip{chip}"
# #         path = f"{base}/pwm{channel}"
# #         if not os.path.exists(path):
# #             try:
# #                 with open(f"{base}/export", "w") as f:
# #                     f.write(str(channel))
# #             except PermissionError:
# #                 raise RuntimeError(f"Need root privileges to export pwmchip{chip}/pwm{channel}")

# # # --------------------------
# # # Configuration
# # # --------------------------
# # SERVO1_PWM_CHIP = 1
# # SERVO1_PWM_CH   = 0
# # SERVO2_PWM_CHIP = 0
# # SERVO2_PWM_CH   = 0
# # SERVO_FREQ_HZ   = 50.0

# # # If your servo expects 500–2500 µs, adjust these
# # SERVO_MIN_US = 950
# # SERVO_MAX_US = 2050

# # ANGLE_MIN = -10
# # ANGLE_MAX = 190

# # # --------------------------
# # # Hardware drivers (mraa-based)
# # # --------------------------
# # ensure_pwm_export(SERVO1_PWM_CHIP, SERVO1_PWM_CH)
# # ensure_pwm_export(SERVO2_PWM_CHIP, SERVO2_PWM_CH)

# # servo1 = PWMOut(chip=SERVO1_PWM_CHIP, channel=SERVO1_PWM_CH, freq_hz=SERVO_FREQ_HZ)
# # servo2 = PWMOut(chip=SERVO2_PWM_CHIP, channel=SERVO2_PWM_CH, freq_hz=SERVO_FREQ_HZ)

# # last_angles = {"servo1": None, "servo2": None}

# # # --------------------------
# # # HTTP Handlers
# # # --------------------------
# # async def handle_servo(request: web.Request):
# #     """
# #     Expects JSON like:
# #       { "servo1": 0..180, "servo2": 0..180 }
# #     Either field may be omitted.
# #     """
# #     try:
# #         data = await request.json()
# #     except Exception:
# #         return web.json_response({"error": "invalid json"}, status=400)

# #     s1 = data.get("servo1", None)
# #     s2 = data.get("servo2", None)

# #     if s1 is None and s2 is None:
# #         return web.json_response({"error": "need servo1 and/or servo2"}, status=400)

# #     try:
# #         if s1 is not None:
# #             s1 = clamp(int(s1), ANGLE_MIN, ANGLE_MAX)
# #         if s2 is not None:
# #             s2 = clamp(int(s2), ANGLE_MIN, ANGLE_MAX)
# #     except ValueError:
# #         return web.json_response({"error": "servo values must be integers"}, status=400)

# #     try:
# #         if s1 is not None:
# #             servo1.set_pulse_us(deg_to_us(s1))
# #             last_angles["servo1"] = s1
# #         if s2 is not None:
# #             servo2.set_pulse_us(deg_to_us(s2))
# #             last_angles["servo2"] = s2
# #     except Exception as e:
# #         return web.json_response({"error": f"hardware write failed: {e}"}, status=500)

# #     return web.json_response({"ok": True, "servo1": s1, "servo2": s2})

# # async def health(_request: web.Request):
# #     return web.json_response({
# #         "ok": True,
# #         "freq_hz": SERVO_FREQ_HZ,
# #         "pulse_range_us": [SERVO_MIN_US, SERVO_MAX_US],
# #         "angle_range_deg": [ANGLE_MIN, ANGLE_MAX],
# #         "last": last_angles,
# #     })

# # # --------------------------
# # # App wiring
# # # --------------------------
# # app = web.Application()
# # app.router.add_post("/servo", handle_servo)
# # app.router.add_get("/health", health)

# # async def on_cleanup(_app):
# #     try:
# #         servo1.close()
# #     except Exception:
# #         pass
# #     try:
# #         servo2.close()
# #     except Exception:
# #         pass

# # app.on_cleanup.append(on_cleanup)

# # # --------------------------
# # # Main (port fallback)
# # # --------------------------
# # if __name__ == "__main__":
# #     # Prefer non-privileged port unless explicitly overridden
# #     port_env = os.getenv("PORT")
# #     try:
# #         port = int(port_env) if port_env else 80
# #     except ValueError:
# #         port = 80

# #     try:
# #         web.run_app(app, host="0.0.0.0", port=port)
# #     except PermissionError as e:
# #         # If user asked for a privileged port but lacks perms, auto-fallback to 80
# #         if port < 1024:
# #             print(f"[WARN] Permission denied on port {port}; retrying on 80...")
# #             web.run_app(app, host="0.0.0.0", port=80)
# #         else:
# #             raise e













#!/usr/bin/env python3
import os
import json
from aiohttp import web
import mraa

# --------------------------
# PWM driver
# --------------------------
class PWMOut:
    def __init__(self, chip: int, channel: int = 0, freq_hz: float = 50.0):
        self._chip = int(chip)
        self._channel = int(channel)
        # owner=True lets mraa unexport on GC
        self._p = mraa.Pwm(self._channel, True, self._chip)
        self._enabled = False
        self._period_us = None
        self._closed = False
        self.set_frequency(freq_hz)
        self.enable(True)
        print(f"[PWM] init chip={self._chip} ch={self._channel} freq={freq_hz}Hz")

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
        print(f"[PWM] chip={self._chip} ch={self._channel} period={self._period_us}us")

    def set_pulse_us(self, pulse_us: int):
        if self._closed:
            raise RuntimeError("PWMOut is closed")
        if self._period_us is None:
            raise RuntimeError("Frequency/period not initialized")
        if not (0 <= pulse_us <= self._period_us):
            raise ValueError(f"pulse_us must be within [0, {self._period_us}]")

        # ACTIVE-HIGH (matches sysfs echo test)
        duty = 1- (pulse_us / self._period_us)

        self._p.write(duty)
        # many boards require enable to be true while writing
        if not self._enabled:
            self.enable(True)

        print(f"[PWM] chip={self._chip} ch={self._channel} pulse={pulse_us}us "
              f"period={self._period_us}us duty={duty:.3%}")

    def enable(self, on: bool):
        if self._closed:
            return
        self._p.enable(bool(on))
        self._enabled = bool(on)
        print(f"[PWM] chip={self._chip} ch={self._channel} enable={self._enabled}")

    def close(self):
        if self._closed:
            return
        try:
            self._p = None
        finally:
            self._closed = True
            print(f"[PWM] chip={self._chip} ch={self._channel} closed")

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

def deg_to_us(deg: int, angle_min: int, angle_max: int, us_min: int, us_max: int) -> int:
    d = clamp(int(deg), angle_min, angle_max)
    span = us_max - us_min
    # Map angle_min..angle_max -> us_min..us_max (angle_min may be negative)
    rng = float(angle_max - angle_min)
    frac = (d - angle_min) / rng if rng > 0 else 0.0
    return int(round(us_min + span * frac))

# --------------------------
# Configuration (adjust to match your sysfs test)
# --------------------------
# Use the SAME chip/channel that worked with: echo 0 > /sys/class/pwm/pwmchipX/export
SERVO1_PWM_CHIP = 0
SERVO1_PWM_CH   = 0
SERVO2_PWM_CHIP = 1
SERVO2_PWM_CH   = 0

SERVO_FREQ_HZ = 50.0       # 20ms period
SERVO_MIN_US  = 950        # ~1.0ms
SERVO_MAX_US  = 2050       # ~2.0ms

SERVO1_ANGLE_MIN = -10
SERVO1_ANGLE_MAX = 190

SERVO2_ANGLE_MIN = 5
SERVO2_ANGLE_MAX = 145

# --------------------------
# Hardware drivers (mraa-based)
# --------------------------
servo1 = PWMOut(chip=SERVO1_PWM_CHIP, channel=SERVO1_PWM_CH, freq_hz=SERVO_FREQ_HZ)
servo2 = PWMOut(chip=SERVO2_PWM_CHIP, channel=SERVO2_PWM_CH, freq_hz=SERVO_FREQ_HZ)
last_angles = {"servo1": None, "servo2": None}

# --------------------------
# HTTP Handlers
# --------------------------
async def handle_servo(request: web.Request):
    """
    POST /servo
    JSON:
      { "servo1": int (deg), "servo2": int (deg) }
      either field may be omitted
    """
    try:
        data = await request.json()
    except Exception:
        return web.json_response({"error": "invalid json"}, status=400)

    s1 = data.get("servo1", None)
    s2 = data.get("servo2", None)

    if s1 is None and s2 is None:
        return web.json_response({"error": "need servo1 and/or servo2"}, status=400)

    try:
        if s1 is not None:
            s1 = clamp(int(s1), SERVO1_ANGLE_MIN, SERVO1_ANGLE_MAX)
        if s2 is not None:
            s2 = clamp(int(s2), SERVO2_ANGLE_MIN, SERVO2_ANGLE_MAX)
    except ValueError:
        return web.json_response({"error": "servo values must be integers"}, status=400)

    try:
        if s1 is not None:
            pulse1 = deg_to_us(s1, SERVO1_ANGLE_MIN, SERVO1_ANGLE_MAX, SERVO_MIN_US, SERVO_MAX_US)
            print(f"[SERVO CMD] servo1={s1}° -> {pulse1}us")
            servo1.set_pulse_us(pulse1)
            last_angles["servo1"] = s1

        if s2 is not None:
            pulse2 = deg_to_us(s2, SERVO2_ANGLE_MIN, SERVO2_ANGLE_MAX, SERVO_MIN_US, SERVO_MAX_US)
            print(f"[SERVO CMD] servo2={s2}° -> {pulse2}us")
            servo2.set_pulse_us(pulse2)
            last_angles["servo2"] = s2
    except Exception as e:
        return web.json_response({"error": f"hardware write failed: {e}"}, status=500)

    return web.json_response({"ok": True, "servo1": s1, "servo2": s2})

async def health(_request: web.Request):
    return web.json_response({
        "ok": True,
        "freq_hz": SERVO_FREQ_HZ,
        "pulse_range_us": [SERVO_MIN_US, SERVO_MAX_US],
        "servo1_angle_deg_range": [SERVO1_ANGLE_MIN, SERVO1_ANGLE_MAX],
        "servo2_angle_deg_range": [SERVO2_ANGLE_MIN, SERVO2_ANGLE_MAX],
        "last": last_angles,
        "chips": {
            "servo1": {"chip": SERVO1_PWM_CHIP, "channel": SERVO1_PWM_CH},
            "servo2": {"chip": SERVO2_PWM_CHIP, "channel": SERVO2_PWM_CH},
        }
    })

# --------------------------
# App wiring
# --------------------------
app = web.Application()
app.router.add_post("/servo", handle_servo)
app.router.add_get("/health", health)

async def on_cleanup(_app):
    try:
        servo1.close()
    except Exception:
        pass
    try:
        servo2.close()
    except Exception:
        pass

app.on_cleanup.append(on_cleanup)

# --------------------------
# Main (port fallback)
# --------------------------
if __name__ == "__main__":
    port_env = os.getenv("PORT")
    try:
        port = int(port_env) if port_env else 80
    except ValueError:
        port = 80

    try:
        web.run_app(app, host="0.0.0.0", port=port)
    except PermissionError:
        # If a privileged port was requested without perms, retry on 80
        if port < 1024:
            print(f"[WARN] Permission denied on port {port}; retrying on 80...")
            web.run_app(app, host="0.0.0.0", port=80)
        else:
            raise
