# # #!/usr/bin/env python3
# # import mraa
# # import time

# # class PWMOut:
# #     def __init__(self, chip: int, channel: int = 0, freq_hz: float = 1000.0, duty: float = 0.0):
# #         self._p = mraa.Pwm(channel, True, chip)   # owner=True -> unexports on close
# #         self._enabled = False
# #         self._period_us = None                    # store current period in µs
# #         self.set_frequency(freq_hz)               # also sets _period_us
# #         self.enable(True)
# #         if duty:
# #             self.set_duty(duty)

# #     def set_frequency(self, freq_hz: float):
# #         if freq_hz <= 0:
# #             raise ValueError("freq_hz must be > 0")
# #         period_us = int(round(1_000_000.0 / freq_hz))
# #         print(f"Setting frequency to {freq_hz} Hz (period {period_us} µs)")
# #         # Many drivers require disable before changing period
# #         was_enabled = self._enabled
# #         if was_enabled:
# #             self.enable(False)
# #         self._p.period_us(period_us)              # setter only
# #         self._period_us = period_us               # store for later use
# #         if was_enabled:
# #             self.enable(True)

# #     def set_duty(self, duty: float):
# #         duty = max(0.0, min(1.0, float(duty)))
# #         self._p.write(duty)

# #     def set_pulse_us(self, pulse_us: int):
# #         """For servos/ESCs: set pulse width in microseconds at current period."""
# #         if self._period_us is None:
# #             raise RuntimeError("Frequency/period not initialized")
# #         if not (0 <= pulse_us <= self._period_us):
# #             raise ValueError(f"pulse_us must be within [0, {self._period_us}]")
# #         self._p.write(pulse_us / self._period_us)

# #     def enable(self, on: bool):
# #         self._p.enable(bool(on))
# #         self._enabled = bool(on)

# #     def close(self):
# #         try:
# #             self.enable(False)
# #         finally:
# #             del self._p

# # def angle_to_us(angle: float) -> int:
# #     """Convert desired angle (0–180°) to pulse width in microseconds."""
# #     if not (0 <= angle <= 180):
# #         raise ValueError("Angle must be within [0, 180]")
# #     min_us = 500  # pulse width at 0°
# #     max_us = 2500  # pulse width at 180°
# #     print(f"Setting pulse width to int(round({min_us + (angle / 180.0) * (max_us - min_us)}) µs")
# #     return int(round(min_us + (angle / 180.0) * (max_us - min_us)))

# # if __name__ == "__main__":
# #     # Create PWM output on pwmchip8 (or 9, depending on your wiring)
# #     servo = PWMOut(chip=9, freq_hz=50.0, duty = 1.0)  # 50 Hz = 20 ms period

 

# #     # Move instantly to 150°
# #     servo.set_pulse_us(angle_to_us(30))
# #     time.sleep(1)

# #     # # Move instantly to 30°
# #     # servo.set_pulse_us(angle_to_us(30))
# #     # time.sleep(1)

# #     servo.close()


# #!/usr/bin/env python3
# import mraa
# import time

# class PWMOut:
#     def __init__(self, chip: int, channel: int = 0, freq_hz: float = 50.0):
#         self._p = mraa.Pwm(channel, True, chip)   # owner=True -> unexports on close
#         self._enabled = False
#         self._period_us = None
#         self.set_frequency(freq_hz)
#         self.enable(True)

#     def set_frequency(self, freq_hz: float):
#         if freq_hz <= 0:
#             raise ValueError("freq_hz must be > 0")
#         period_us = int(round(1_000_000.0 / freq_hz))
#         was_enabled = self._enabled
#         if was_enabled:
#             self.enable(False)
#         self._p.period_us(period_us)              # setter only
#         self._period_us = period_us
#         if was_enabled:
#             self.enable(True)

#     def set_pulse_us(self, pulse_us: int):
#         if self._period_us is None:
#             raise RuntimeError("Frequency/period not initialized")
#         if not (0 <= pulse_us <= self._period_us):
#             raise ValueError(f"pulse_us must be within [0, {self._period_us}]")
#         duty = pulse_us / self._period_us
#         self._p.write(duty)

#     def set_pulse_ms(self, pulse_ms: float):
#         self.set_pulse_us(int(round(pulse_ms * 1000.0)))

#     def enable(self, on: bool):
#         self._p.enable(bool(on))
#         self._enabled = bool(on)

#     def close(self):
#         try:
#             self.enable(False)
#         finally:
#             del self._p

# def angle_to_us(angle: float, min_us: int = 1000, max_us: int = 2000) -> int:
#     if not (0 <= angle <= 180):
#         raise ValueError("Angle must be within [0, 180]")
#     pulse = min_us + (angle / 180.0) * (max_us - min_us)
#     print(f"Target angle {angle:.1f}° -> pulse {pulse:.0f} µs")
#     return int(round(pulse))

# if __name__ == "__main__":
#     # Use the pwmchip that WORKS for your board wiring (you said pwmchip8)
#     servo = PWMOut(chip=9, freq_hz=50.0)  # 50 Hz = 20 ms period

#     # Go to 90°, hold briefly, then relax (optional)
#     servo.set_pulse_us(2000)
#     time.sleep(0.5)
#     # Uncomment next line to release holding torque after the move:
#     # servo.enable(False)

#     # Try full right (safe range 1000–2000 µs)
#     servo.set_pulse_us(angle_to_us(180))
#     time.sleep(1.0)

#     # Back to center
#     servo.set_pulse_us(angle_to_us(90))
#     time.sleep(1.0)

#     servo.close()

import mraa, time

class PWMOut:
    def __init__(self, chip: int, channel: int = 0, freq_hz: float = 50.0):
        # stash for debug since some mraa builds lack getters
        self._chip = int(chip)
        self._channel = int(channel)

        # owner=True -> unexport on delete
        self._p = mraa.Pwm(self._channel, True, self._chip)

        self._enabled = False
        self._period_us = None
        self._closed = False

        # print(f"[DEBUG] Init PWM: chip={self._chip}, channel={self._channel}, "
        #       f"target_freq={freq_hz} Hz")

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

        # print(f"[DEBUG] Set frequency: chip={self._chip}, channel={self._channel}, "
        #       f"freq={freq_hz:.3f} Hz, period={self._period_us} us")

        if was_enabled:
            self.enable(True)

    def set_pulse_us(self, pulse_us: int):
        if self._closed:
            raise RuntimeError("PWMOut is closed")
        if self._period_us is None:
            raise RuntimeError("Frequency/period not initialized")
        if not (0 <= pulse_us <= self._period_us):
            raise ValueError(f"pulse_us must be within [0, {self._period_us}]")

        duty = 1.0 - pulse_us / self._period_us
        print(f"[DEBUG] Set pulse: chip={self._chip}, channel={self._channel}, "
              f"pulse={pulse_us} us, duty={duty:.3%}")
        self._p.write(duty)

    def enable(self, on: bool):
        if self._closed:
            return
        self._p.enable(bool(on))
        self._enabled = bool(on)
        #print(f"[DEBUG] PWM {'ENABLED' if on else 'disabled'}: "
        #      f"chip={self._chip}, channel={self._channel}")

    def close(self):
        if self._closed:
            return
        try:
            # # best effort: turn it off
            # try:
            #     self.enable(False)
            # except Exception as e:
            #     #print(f"[DEBUG] Ignored error disabling PWM during close: {e!r}")

            # drop the handle; owner=True lets mraa unexport on GC
            try:
                self._p  # ensure exists
            except AttributeError:
                pass
            else:
                self._p = None
        finally:
            self._closed = True
            #print(f"[DEBUG] Closed PWM: chip={self._chip}, channel={self._channel}")

    # context manager sugar
    def __enter__(self):
        if self._closed:
            raise RuntimeError("PWMOut is closed")
        return self

    def __exit__(self, exc_type, exc, tb):
        self.close()


# ---- Minimal usage example ----
if __name__ == "__main__":
    # Adjust chip/channel to match your /sys/class/pwm/pwmchipN and pwmN mapping
    with PWMOut(chip=9, channel=0, freq_hz=50.0) as servo1, \
        PWMOut(chip=8, channel=0, freq_hz=50.0) as servo2:

        while True:
            servo1.set_pulse_us(1000)  # Servo 1 min
            servo2.set_pulse_us(1000)  # Servo 2 max
            time.sleep(2.0)

            servo1.set_pulse_us(2000)  # Servo 1 max
            servo2.set_pulse_us(2000)  # Servo 2 min
            time.sleep(2.0)