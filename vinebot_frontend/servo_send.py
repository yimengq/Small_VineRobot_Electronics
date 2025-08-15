# import requests
# import threading
# import json
# import time

# SERVO_URL = "http://192.168.1.55/servo"

# count = 1
# while True:
#     print("Iteration:", count, flush=True)
#     payload = {
#         "servo1": 150,
#         "servo2": 90
#     }

#     response = requests.post(SERVO_URL, json=payload)
#     if response.ok:
#         print("Servo command successful")

#     count += 1
    
#     time.sleep(10)

import requests
import time

SERVO_URL = "http://192.168.1.55:80/servo"

def send_servo(s1, s2):
    try:
        response = requests.post(SERVO_URL, json={"servo1": s1, "servo2": s2}, timeout=3)
        if response.ok:
            print(f"Sent servo1={s1}, servo2={s2} -> OK")
        else:
            print(f"Error {response.status_code}: {response.text}")
    except requests.RequestException as e:
        print(f"Request failed: {e}")

if __name__ == "__main__":
    servo1 = 90
    servo2 = 90
    step = 10

    while True:
        send_servo(servo1, servo2)

        # increment and wrap around
        servo1 = (servo1 + step) % 181
        servo2 = (servo2 + step) % 181

        time.sleep(0.01)
