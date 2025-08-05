'''
Simple test script to record test video and log imu data. 
ESP32-S3 with OV5640 and BNO055
'''

import cv2
import requests
import threading
import json
import time

# modify with address given by CameraWebServer.ino
VIDEO_URL = "http://192.168.2.3:81/stream"
TELEMETRY_URL = "http://192.168.2.3/telemetry"
SERVO_URL = "http://192.168.2.3/servo"


imu_log = []
stop = threading.Event()

# Read IMU data
def imu_data():
    try:
        with requests.get(TELEMETRY_URL, stream=True, timeout=1) as r:
            for line in r.iter_lines():
                if stop.is_set():
                    break
                if line:
                    imu_data = json.loads(line.decode('utf-8'))
                    timestamp = time.time()
                    imu_log.append((timestamp, imu_data))
    except Exception as e:
        print("IMU listener error:", e)
        
# IMU logging thread 
imu_thread = threading.Thread(target=imu_data, daemon=True)
imu_thread.start()

cap = cv2.VideoCapture(VIDEO_URL)

nframes = 0
frame_limit = 300  # limit for test purposes, ~10s video
while nframes < frame_limit:
    ret, frame = cap.read()
    if not ret:
        break
        
    nframes += 1
    cv2.imshow("ESP32 Camera", frame) 
    if cv2.waitKey(1) == ord('q'):
        break
        
cap.release()
cv2.destroyAllWindows()

stop.set()
imu_thread.join(timeout=2)

# test servo command  
response = requests.post(SERVO_URL, data="90")
if response.ok:
    print("Good HTTP post, check Arduino IDE output")


with open("imu_log.txt", "w") as f:
    for timestamp, data in imu_log:
        f.write(f"{timestamp}: {json.dumps(data)}\n")