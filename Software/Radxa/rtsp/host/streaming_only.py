#!/usr/bin/env python3
import time
import cv2

# ------------------ Video config ------------------
RADXA_IP  = "192.168.1.66"
RTSP_PORT = 8554
RTSP_PATH = "/stream"

RTSP_URL = f"rtsp://{RADXA_IP}:{RTSP_PORT}{RTSP_PATH}"
RECONNECT_DELAY_S = 1.5

# ------------------ Video helpers ------------------
def _open_rtsp(url: str):
    # 1) Default backend
    cap = cv2.VideoCapture(url)
    if cap.isOpened():
        return cap

    # 2) Try FFMPEG explicitly
    cap = cv2.VideoCapture(url, cv2.CAP_FFMPEG)
    if cap.isOpened():
        return cap

    # 3) Try GStreamer pipeline
    gst = f"rtspsrc location={url} latency=0 ! rtph264depay ! avdec_h264 ! videoconvert ! appsink"
    cap = cv2.VideoCapture(gst, cv2.CAP_GSTREAMER)
    if cap.isOpened():
        return cap

    return None

def _put_text(img, text, org, scale=0.6, color=(255, 255, 255), thickness=1):
    cv2.putText(img, text, org, cv2.FONT_HERSHEY_SIMPLEX, scale, color, thickness, cv2.LINE_AA)

# ------------------ Video loop ------------------
def video_loop():
    print("[video] Opening:", RTSP_URL)
    cap = _open_rtsp(RTSP_URL)
    if cap is None or not cap.isOpened():
        print(f"[video] cannot open {RTSP_URL}")
        return

    last_ts = time.time()
    frames = 0
    fps = 0.0

    while True:
        ok, frame = cap.read()
        if not ok or frame is None:
            print("[video] read failed, reconnecting...")
            cap.release()
            time.sleep(RECONNECT_DELAY_S)
            cap = _open_rtsp(RTSP_URL)
            if cap is None or not cap.isOpened():
                print("[video] reconnect failed, retrying...")
                continue
            print("[video] reconnected")
            continue

        frames += 1
        now = time.time()
        if now - last_ts >= 1.0:
            fps = frames / (now - last_ts)
            last_ts = now
            frames = 0

        _put_text(frame, f"FPS: {fps:4.1f}", (10, 24))
        _put_text(frame, "(Q to quit)", (10, 48))

        cv2.imshow("RTSP Stream", frame)
        if (cv2.waitKey(1) & 0xFF) == ord('q'):
            break

    cap.release()
    cv2.destroyAllWindows()

if __name__ == "__main__":
    video_loop()