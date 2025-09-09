import mraa, time

class PWMOut:
    def __init__(self, chip: int, channel: int = 0, freq_hz: float = 50.0):
        self._chip = int(chip)
        self._channel = int(channel)

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
    with PWMOut(chip=0, channel=0, freq_hz=50.0) as servo1, \
        PWMOut(chip=1, channel=0, freq_hz=50.0) as servo2:

        while True:
            servo1.set_pulse_us(1000)  # Servo 1 min
            servo2.set_pulse_us(1000)  # Servo 2 max
            time.sleep(2.0)

            servo1.set_pulse_us(2000)  # Servo 1 max
            servo2.set_pulse_us(2000)  # Servo 2 min
            time.sleep(2.0)