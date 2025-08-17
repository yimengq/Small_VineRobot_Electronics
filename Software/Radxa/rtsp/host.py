# import cv2

# RADXA_IP = "192.168.1.49" # ensure correct radxa ip 
# RTSP_URL = f"rtsp://{RADXA_IP}:8554/stream"

# cap = cv2.VideoCapture(RTSP_URL)

# if not cap.isOpened():
#     print(f"Cannot open stream: {RTSP_URL}")
#     exit(1)

# print("Connected to stream. Press q to quit.")

# while True:
#     ret, frame = cap.read()
#     if not ret:
#         break

#     cv2.imshow("RTSP Stream", frame)
#     if cv2.waitKey(1) & 0xFF == ord('q'):
#         break

# cap.release()
# cv2.destroyAllWindows()

#!/usr/bin/env python3
import cv2
import requests
import threading

# ---------- Config (set your Radxa IP once) ----------
RADXA_IP       = "192.168.1.49"     # <-- change me if needed
RTSP_PORT      = 8554
RTSP_PATH      = "/stream"
SERVO_HTTP_PT  = 80
LED_HTTP_PT    = 8080

RTSP_URL    = f"rtsp://{RADXA_IP}:{RTSP_PORT}{RTSP_PATH}"
SERVO_URL   = f"http://{RADXA_IP}:{SERVO_HTTP_PT}/servo"
LED_ON_URL  = f"http://{RADXA_IP}:{LED_HTTP_PT}/on"
LED_OFF_URL = f"http://{RADXA_IP}:{LED_HTTP_PT}/off"

# Reuse one HTTP session (faster)
_session = requests.Session()

def _post_async(url, json=None, timeout=(0.2, 0.4)):
    """Fire-and-forget POST so video loop never blocks."""
    def _do():
        try:
            _session.post(url, json=json, timeout=timeout)
        except Exception as e:
            print(f"[http] POST {url} failed:", e)
    threading.Thread(target=_do, daemon=True).start()

def clamp(v, lo, hi): return lo if v < lo else hi if v > hi else v

def send_servo_async(s1, s2):
    s1 = clamp(int(s1), 0, 180)
    s2 = clamp(int(s2), 0, 180)
    _post_async(SERVO_URL, json={"servo1": s1, "servo2": s2})

def led_on_async():  _post_async(LED_ON_URL)
def led_off_async(): _post_async(LED_OFF_URL)

def main():
    servo1, servo2 = 90, 90  # initial angles

    cap = cv2.VideoCapture(RTSP_URL)
    if not cap.isOpened():
        print(f"Cannot open stream: {RTSP_URL}")
        return

    print("Keys: W/S=A1 +/- , A/D=A2 +/- , O=LED on , P=LED off , Q=quit")
    send_servo_async(servo1, servo2)  # send initial position (non-blocking)

    while True:
        ret, frame = cap.read()
        if not ret:
            print("[video] read failed")
            break

        cv2.imshow("RTSP Stream", frame)
        k = cv2.waitKey(1) & 0xFF

        if k == ord('q'):
            break
        elif k == ord('w'):
            servo1 = clamp(servo1 + 5, 0, 180); send_servo_async(servo1, servo2)
        elif k == ord('s'):
            servo1 = clamp(servo1 - 5, 0, 180); send_servo_async(servo1, servo2)
        elif k == ord('a'):
            servo2 = clamp(servo2 - 5, 0, 180); send_servo_async(servo1, servo2)
        elif k == ord('d'):
            servo2 = clamp(servo2 + 5, 0, 180); send_servo_async(servo1, servo2)
        elif k == ord('o'):
            led_on_async()
        elif k == ord('p'):
            led_off_async()

    cap.release()
    cv2.destroyAllWindows()

if __name__ == "__main__":
    main()
