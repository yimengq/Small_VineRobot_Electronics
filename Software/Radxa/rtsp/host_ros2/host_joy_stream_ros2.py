#!/usr/bin/env python3
"""Joystick + RTSP streaming (ROS 2 Humble).

- Subscribes to /joy (sensor_msgs/msg/Joy) from ROS 2 joy_node
- Opens RTSP stream from the Radxa and shows it in an OpenCV window
- Overlays joystick axes/buttons and how recently the last /joy msg arrived

No motor control. No serial. No HTTP.
"""

import threading
import time
from typing import List

import cv2

import rclpy
from rclpy.executors import MultiThreadedExecutor
from rclpy.node import Node
from sensor_msgs.msg import Joy

# ------------------ Config ------------------
RADXA_IP = "192.168.1.56"
RTSP_PORT = 8554
RTSP_PATH = "/stream"
RTSP_URL = f"rtsp://{RADXA_IP}:{RTSP_PORT}{RTSP_PATH}"

RECONNECT_DELAY_S = 1.5

# ------------------ Shared state ------------------
_lock = threading.Lock()
_state = {
    "axes": [],        # type: List[float]
    "buttons": [],     # type: List[int]
    "last_joy_ts": 0.0,
    "joy_count": 0,
}


def _open_rtsp(url: str):
    """Try a few common OpenCV backends."""
    cap = cv2.VideoCapture(url)
    if cap.isOpened():
        return cap

    cap = cv2.VideoCapture(url, cv2.CAP_FFMPEG)
    if cap.isOpened():
        return cap

    # Low-latency GStreamer fallback (requires OpenCV built with GStreamer)
    gst = (
        f"rtspsrc location={url} latency=0 ! "
        "rtph264depay ! avdec_h264 ! videoconvert ! appsink"
    )
    cap = cv2.VideoCapture(gst, cv2.CAP_GSTREAMER)
    if cap.isOpened():
        return cap

    return None


def _put_text(img, text, org, scale=0.55, color=(255, 255, 255), thickness=1):
    cv2.putText(img, text, org, cv2.FONT_HERSHEY_SIMPLEX, scale, color, thickness, cv2.LINE_AA)


def joy_cb(msg: Joy):
    with _lock:
        _state["axes"] = list(msg.axes)
        _state["buttons"] = list(msg.buttons)
        _state["last_joy_ts"] = time.time()
        _state["joy_count"] += 1


def video_loop():
    print("[video] Opening:", RTSP_URL)
    cap = _open_rtsp(RTSP_URL)
    if cap is None or not cap.isOpened():
        print(f"[video] cannot open {RTSP_URL}")
        return

    last_ts = time.time()
    frames = 0
    fps = 0.0

    while rclpy.ok():
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

        with _lock:
            axes = _state["axes"]
            buttons = _state["buttons"]
            last_joy_ts = _state["last_joy_ts"]
            joy_count = _state["joy_count"]

        age = (now - last_joy_ts) if last_joy_ts > 0 else None

        y = 24
        _put_text(frame, f"FPS: {fps:4.1f}   RTSP: {RTSP_URL}", (10, y)); y += 24
        if age is None:
            _put_text(frame, "JOY: waiting for /joy...", (10, y)); y += 24
        else:
            _put_text(frame, f"JOY: msgs={joy_count}  last={age*1000.0:5.0f} ms ago", (10, y)); y += 24

        ax_show = 8
        btn_show = 12
        ax_str = " ".join([f"{a:+.2f}" for a in axes[:ax_show]])
        btn_str = " ".join([str(b) for b in buttons[:btn_show]])

        _put_text(frame, f"axes[0:{min(len(axes), ax_show)}]: {ax_str}", (10, y)); y += 24
        _put_text(frame, f"buttons[0:{min(len(buttons), btn_show)}]: {btn_str}", (10, y)); y += 24

        _put_text(frame, "Press Q in the video window to quit", (10, y))

        cv2.imshow("RTSP + Joystick (ROS2)", frame)
        if (cv2.waitKey(1) & 0xFF) in (ord('q'), ord('Q')):
            break

    cap.release()
    cv2.destroyAllWindows()


def main():
    rclpy.init()

    node = Node("joy_stream")
    node.create_subscription(Joy, "/joy", joy_cb, 10)

    executor = MultiThreadedExecutor()
    executor.add_node(node)

    spin_thread = threading.Thread(target=executor.spin, daemon=True)
    spin_thread.start()

    try:
        video_loop()
    finally:
        try:
            executor.shutdown()
        except Exception:
            pass
        try:
            node.destroy_node()
        except Exception:
            pass
        try:
            rclpy.shutdown()
        except Exception:
            pass


if __name__ == "__main__":
    main()
