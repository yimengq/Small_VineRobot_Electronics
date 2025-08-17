#!/usr/bin/env python3
import cv2
import requests
import threading
import time

# ---------- Config ----------
RADXA_IP       = "192.168.1.49"     # <-- change me if needed
RTSP_PORT      = 8554
RTSP_PATH      = "/stream"
SERVO_HTTP_PT  = 80
LED_HTTP_PT    = 8080

RTSP_URL    = f"rtsp://{RADXA_IP}:{RTSP_PORT}{RTSP_PATH}"
SERVO_URL   = f"http://{RADXA_IP}:{SERVO_HTTP_PT}/servo"
LED_ON_URL  = f"http://{RADXA_IP}:{LED_HTTP_PT}/on"
LED_OFF_URL = f"http://{RADXA_IP}:{LED_HTTP_PT}/off"

HTTP_TIMEOUT = (0.2, 0.4)   # (connect, read) seconds
RECONNECT_DELAY_S = 1.5

# Reuse one HTTP session (faster)
_session = requests.Session()

def _post_async(url, json=None, timeout=HTTP_TIMEOUT):
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

# ---------- Video helpers ----------
def _open_rtsp(url: str):
    """Try FFMPEG backend first, then GStreamer, then default."""
    # Try default first (usually FFMPEG if built that way)
    cap = cv2.VideoCapture(url)
    if cap.isOpened():
        return cap

    # Try forcing FFMPEG (works on many OpenCV builds)
    cap = cv2.VideoCapture(url, cv2.CAP_FFMPEG)
    if cap.isOpened():
        return cap

    # Try GStreamer pipeline (requires OpenCV built with GStreamer)
    gst_url = f"rtspsrc location={url} latency=0 ! rtph264depay ! avdec_h264 ! videoconvert ! appsink"
    cap = cv2.VideoCapture(gst_url, cv2.CAP_GSTREAMER)
    if cap.isOpened():
        return cap

    return None

def _put_text(img, text, org, scale=0.6, color=(255,255,255), thickness=1):
    cv2.putText(img, text, org, cv2.FONT_HERSHEY_SIMPLEX, scale, color, thickness, cv2.LINE_AA)

def main():
    servo1, servo2 = 90, 90  # initial angles
    step = 5

    print("Opening RTSP:", RTSP_URL)
    cap = _open_rtsp(RTSP_URL)
    if cap is None or not cap.isOpened():
        print(f"Cannot open stream: {RTSP_URL}")
        print("Tip: ensure your RTSP server is running and OpenCV has FFMPEG/GStreamer enabled.")
        return

    print("Keys: W/S=A1 +/- , A/D=A2 +/- , O=LED on , P=LED off , Q=quit")
    send_servo_async(servo1, servo2)  # initial position (non-blocking)

    last_post_status = "Ready"
    last_ts = time.time()
    frames = 0
    fps = 0.0

    while True:
        ok, frame = cap.read()
        if not ok or frame is None:
            print("[video] read failed — reconnecting...")
            cap.release()
            time.sleep(RECONNECT_DELAY_S)
            cap = _open_rtsp(RTSP_URL)
            if cap is None or not cap.isOpened():
                print("[video] reconnect failed, will retry...")
                continue
            else:
                print("[video] reconnected")
                continue

        # FPS calc
        frames += 1
        now = time.time()
        if now - last_ts >= 1.0:
            fps = frames / (now - last_ts)
            last_ts = now
            frames = 0

        # Overlay text
        _put_text(frame, f"FPS: {fps:4.1f}", (10, 24))
        _put_text(frame, f"A1: {servo1:3d}°  A2: {servo2:3d}°  step:{step}", (10, 48))
        _put_text(frame, "W/S=A1 +/- , A/D=A2 +/- , O=LED on , P=LED off , Q=quit", (10, 72))
        _put_text(frame, f"Status: {last_post_status[:60]}", (10, 96))

        cv2.imshow("RTSP Stream + Control", frame)
        k = cv2.waitKey(1) & 0xFF

        if k == ord('q'):
            break
        elif k == ord('w'):
            servo1 = clamp(servo1 + step, 0, 180); send_servo_async(servo1, servo2); last_post_status = f"Sent {servo1},{servo2}"
        elif k == ord('s'):
            servo1 = clamp(servo1 - step, 0, 180); send_servo_async(servo1, servo2); last_post_status = f"Sent {servo1},{servo2}"
        elif k == ord('a'):
            servo2 = clamp(servo2 - step, 0, 180); send_servo_async(servo1, servo2); last_post_status = f"Sent {servo1},{servo2}"
        elif k == ord('d'):
            servo2 = clamp(servo2 + step, 0, 180); send_servo_async(servo1, servo2); last_post_status = f"Sent {servo1},{servo2}"
        elif k == ord('o'):
            led_on_async();  last_post_status = "LED ON sent"
        elif k == ord('p'):
            led_off_async(); last_post_status = "LED OFF sent"

    cap.release()
    cv2.destroyAllWindows()

if __name__ == "__main__":
    main()
