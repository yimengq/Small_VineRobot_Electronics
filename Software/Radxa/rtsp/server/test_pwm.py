#!/usr/bin/env python3
import time
import mraa

# pick the right chip/channel for your board
chip = 0
channel = 0

# create PWM at 50 Hz (20 ms period)
pwm = mraa.Pwm(channel, True, chip)
pwm.period_us(20000)   # 20 ms
pwm.enable(True)

print("Sweeping PWM duty between 0% and 50%... Ctrl+C to stop")

try:
    while True:
        for duty in [i / 100.0 for i in range(0, 51, 5)]:  # 0%→50% step 5%
            print(f"Duty = {duty:.2f}")
            pwm.write(duty)
            time.sleep(0.5)

        for duty in [i / 100.0 for i in range(50, -1, -5)]: # 50%→0%
            print(f"Duty = {duty:.2f}")
            pwm.write(duty)
            time.sleep(0.5)
except KeyboardInterrupt:
    print("Exiting...")
    pwm.enable(False)
