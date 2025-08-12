#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import mraa
import time

# -------- Servo config --------
PWM_GPIO = 116          # you're on GPIO 116 (has PWM14_M0 per your table)
PERIOD_US = 20000       # 50 Hz servo signal
MIN_PW_US = 1000        # ~0 deg pulse width (try 500–700 if needed)
MAX_PW_US = 2000        # ~180 deg pulse width (try up to 2500 if needed)
STEP_DEG = 2            # sweep step in degrees
FRAME_DELAY = 0.02      # 20 ms between updates (matches 50 Hz)

def clamp(x, lo, hi):
    return max(lo, min(hi, x))

def angle_to_pulse_us(angle):
    angle = clamp(angle, 0, 180)
    span = MAX_PW_US - MIN_PW_US
    return int(MIN_PW_US + (span * (angle / 180.0)))

def main():
    pwm = mraa.Pwm(PWM_GPIO)

    # Set period BEFORE enable on many PWM drivers
    ret = pwm.period_us(PERIOD_US)
    if ret != mraa.SUCCESS:
        print("Failed to set PWM period")
        pwm.close()
        return

    if pwm.enable(True) != mraa.SUCCESS:
        print("Failed to enable PWM")
        pwm.close()
        return

    try:
        angle = 0
        direction = +1  # +1 going to 180, -1 going back to 0

        while True:
            pw = angle_to_pulse_us(angle)
            # You can use either pulsewidth_us(...) OR write(duty)
            pwm.pulsewidth_us(pw)  # direct pulse-width control

            time.sleep(FRAME_DELAY)

            angle += direction * STEP_DEG
            if angle >= 180:
                angle = 180
                direction = -1
            elif angle <= 0:
                angle = 0
                direction = +1

    except KeyboardInterrupt:
        pass
    finally:
        # Stop sending pulses; some servos prefer holding last pulse,
        # but writing 0 duty is safer for most setups.
        pwm.write(0)
        pwm.enable(False)
        pwm.close()

if __name__ == "__main__":
    main()
