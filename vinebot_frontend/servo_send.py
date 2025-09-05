import requests
import threading
import json
import time

SERVO_URL = "http://192.168.1.43/servo"

count = 1
while True:
    print("Iteration", count, flush=True)
    payload = {
        "servo1": 150, 
        "servo2": 90
    }
    response = requests.post(SERVO_URL, json=payload)
    if response.ok:
        print("Good HTTP post, check Arduino IDE output", flush=True)
    count += 1
    time.sleep(10) 