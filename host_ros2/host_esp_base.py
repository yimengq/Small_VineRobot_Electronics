#!/usr/bin/env python3
"""host_no_tmotor.py  (VELOCITY-ONLY + UART STREAM)

ROS 2 Humble base-station host.

What it does:
- Subscribes to /joy (sensor_msgs/msg/Joy) published by ROS2 joy_node
- Streams RTSP video from the Radxa (OpenCV)
- Sends *velocity* commands to the Radxa 2Dac2Motor HTTP server
- ALSO streams joystick motor commands over UART to an ESP32 (optional)

UART motor format (to ESP32):
  "m1,m2\n" where each is int in [-255..255]
  Example: "-120,45\n"
"""

import threading
import time

import cv2
import requests
import serial

import rclpy
from rclpy.node import Node
from rclpy.executors import MultiThreadedExecutor

from sensor_msgs.msg import Joy

# ------------------ Config ------------------
PRESSURE_UART_PATH = "/dev/serial/by-id/usb-Silicon_Labs_CP2104_USB_to_UART_Bridge_Controller_02857388-if00-port0"
PRESSURE_BAUD = 115200

# --- Motor UART (ESP32 joystick -> DRV control) ---
# Set this to your ESP32/CP210x device path (or leave "" to disable)
MOTOR_UART_PATH = ""  # e.g. "/dev/serial/by-id/usb-Silicon_Labs_CP210x_USB_to_UART_Bridge_Controller_XXXX-if00-port0"
MOTOR_UART_BAUD = 115200

RADXA_IP  = "192.168.1.59"
RTSP_PORT = 8554
RTSP_PATH = "/stream"

MOTOR_HTTP_PT = 8000
LED_HTTP_PT   = 8080

RTSP_URL        = f"rtsp://{RADXA_IP}:{RTSP_PORT}{RTSP_PATH}"
MOTOR_HEALTH    = f"http://{RADXA_IP}:{MOTOR_HTTP_PT}/health"
MOTOR_CMD_URL   = f"http://{RADXA_IP}:{MOTOR_HTTP_PT}/cmd"
MOTOR_JSON_URL  = f"http://{RADXA_IP}:{MOTOR_HTTP_PT}/motor"
MOTOR_BRAKE_URL = f"http://{RADXA_IP}:{MOTOR_HTTP_PT}/brake"

LED_ON_URL  = f"http://{RADXA_IP}:{LED_HTTP_PT}/on"
LED_OFF_URL = f"http://{RADXA_IP}:{LED_HTTP_PT}/off"

HTTP_TIMEOUT = (0.5, 5.0)   # (connect, read)
RECONNECT_DELAY_S = 1.5

# ------------------ Joystick mapping ------------------
BTN_PRESSURE_UP  = 3   # Y button → pressure +0.05
BTN_PRESSURE_DN  = 1   # X button → pressure -0.05

AXIS_M2 = 1

# Common ROS/Linux mappings for Xbox-like controllers:
AXIS_M1_FWD = 5   # "forward" trigger (e.g., RT)
AXIS_M1_REV = 2   # "reverse" trigger (e.g., LT)

# Fallback digital buttons (old mapping)
BTN_M1_FWD = 6
BTN_M1_REV = 7

BTN_LED_ON  = 4        # LB → LED ON
BTN_LED_OFF = 5        # RB → LED OFF

BTN_BRAKE_ALL = 0      # A → brake both motors (POST /brake {})

# ------------------ Velocity control ------------------
MOTOR_DEADZONE = 0.12

# How often to POST velocities to /motor
HTTP_VEL_INTERVAL = 0.05   # 20 Hz

# Don’t spam if unchanged (but still keepalive periodically)
VEL_EPS = 0.02             # minimum change to trigger a send
VEL_KEEPALIVE_S = 0.25     # send even if unchanged this long

# If /joy stops updating, send 0 velocity (deadman)
JOY_DEADMAN_S = 0.35

# ------------------ UART motor streaming ------------------
UART_VEL_INTERVAL = 0.05   # 20 Hz
UART_EPS = 3               # integer delta threshold in [-255..255]
UART_KEEPALIVE_S = 0.25

# ------------------ Pressure range ------------------
PRESSURE_MIN = 0.0
PRESSURE_MAX = 7.0

# ------------------ Shared state ------------------
def clamp(v, lo, hi):
    return lo if v < lo else hi if v > hi else v

def trigger_to_01(x: float, seen_negative: bool) -> float:
    """
    Normalize trigger value to [0..1].

    Two common conventions:
      A) [0..1]  rest=0, pressed=1
      B) [-1..1] rest=1, pressed=-1  (so pressed decreases)

    We auto-detect convention B if we ever see a negative value.
    """
    if seen_negative:
        # map 1 -> 0, -1 -> 1
        return clamp((1.0 - x) * 0.5, 0.0, 1.0)
    else:
        # assume already [0..1]
        return clamp(x, 0.0, 1.0)

def vel_to_int255(v: float) -> int:
    v = clamp(float(v), -1.0, 1.0)
    return int(round(v * 255.0))

lock = threading.Lock()
state = {
    "pressure": 0.0,

    # joystick axes (after deadzone)
    "ax_m1": 0.0,
    "ax_m2": 0.0,

    # For trigger normalization auto-detect
    "m1_fwd_seen_negative": False,
    "m1_rev_seen_negative": False,

    # timing / last values
    "last_joy_ts": 0.0,
    "last_vel_post_ts": 0.0,
    "last_vel_sent": (0.0, 0.0),
    "last_keepalive_ts": 0.0,

    # UART motor bookkeeping
    "last_uart_ts": 0.0,
    "last_uart_sent": (0, 0),
    "last_uart_keepalive": 0.0,

    "joy_alive": False,
    "led_on": False,
    "prev_buttons": [],

    # health polling
    "health_ok": None,
    "health_summary": "",
}

# ------------------ HTTP helpers ------------------
_session = requests.Session()

def _post_async(url, json=None, timeout=HTTP_TIMEOUT):
    def _do():
        try:
            _session.post(url, json=json, timeout=timeout)
        except Exception as e:
            print(f"[http] POST {url} failed: {e}")
    threading.Thread(target=_do, daemon=True).start()

def _get_json(url, timeout=HTTP_TIMEOUT):
    r = _session.get(url, timeout=timeout)
    r.raise_for_status()
    return r.json()

# ------------------ Video helpers ------------------
def _open_rtsp(url: str):
    cap = cv2.VideoCapture(url)
    if cap.isOpened():
        return cap
    cap = cv2.VideoCapture(url, cv2.CAP_FFMPEG)
    if cap.isOpened():
        return cap
    gst = f"rtspsrc location={url} latency=0 ! rtph264depay ! avdec_h264 ! videoconvert ! appsink"
    cap = cv2.VideoCapture(gst, cv2.CAP_GSTREAMER)
    if cap.isOpened():
        return cap
    return None

def _put_text(img, text, org, scale=0.6, color=(255, 255, 255), thickness=1):
    cv2.putText(img, text, org, cv2.FONT_HERSHEY_SIMPLEX, scale, color, thickness, cv2.LINE_AA)

# ------------------ Joy callback ------------------
def _edge(prev, cur):
    return prev == 0 and cur == 1

def joy_cb(msg: Joy):
    now = time.time()

    with lock:
        state["joy_alive"] = True
        state["last_joy_ts"] = now

        if not state["prev_buttons"]:
            state["prev_buttons"] = [0] * len(msg.buttons)

        # Pressure bumps (edge-triggered)
        if 0 <= BTN_PRESSURE_UP < len(msg.buttons) and _edge(state["prev_buttons"][BTN_PRESSURE_UP], msg.buttons[BTN_PRESSURE_UP]):
            state["pressure"] = clamp(state["pressure"] + 0.05, PRESSURE_MIN, PRESSURE_MAX)
        if 0 <= BTN_PRESSURE_DN < len(msg.buttons) and _edge(state["prev_buttons"][BTN_PRESSURE_DN], msg.buttons[BTN_PRESSURE_DN]):
            state["pressure"] = clamp(state["pressure"] - 0.05, PRESSURE_MIN, PRESSURE_MAX)

        # LED control (edge-triggered)
        if 0 <= BTN_LED_ON < len(msg.buttons) and _edge(state["prev_buttons"][BTN_LED_ON], msg.buttons[BTN_LED_ON]):
            _post_async(LED_ON_URL)
            state["led_on"] = True
            print("[LED] ON")
        if 0 <= BTN_LED_OFF < len(msg.buttons) and _edge(state["prev_buttons"][BTN_LED_OFF], msg.buttons[BTN_LED_OFF]):
            _post_async(LED_OFF_URL)
            state["led_on"] = False
            print("[LED] OFF")

        # Brake both Radxa motors
        if 0 <= BTN_BRAKE_ALL < len(msg.buttons) and _edge(state["prev_buttons"][BTN_BRAKE_ALL], msg.buttons[BTN_BRAKE_ALL]):
            _post_async(MOTOR_BRAKE_URL, json={})
            state["last_vel_sent"] = (0.0, 0.0)
            state["last_uart_sent"] = (0, 0)
            print("[motor] BRAKE")

        # ---------------- Motor 1 (variable) ----------------
        have_m1_axes = (0 <= AXIS_M1_FWD < len(msg.axes)) and (0 <= AXIS_M1_REV < len(msg.axes))

        if have_m1_axes:
            raw_fwd = float(msg.axes[AXIS_M1_FWD])
            raw_rev = float(msg.axes[AXIS_M1_REV])

            # auto-detect [-1..1] style triggers if we ever see negative
            if raw_fwd < -0.05:
                state["m1_fwd_seen_negative"] = True
            if raw_rev < -0.05:
                state["m1_rev_seen_negative"] = True

            fwd = trigger_to_01(raw_fwd, state["m1_fwd_seen_negative"])
            rev = trigger_to_01(raw_rev, state["m1_rev_seen_negative"])

            # signed command in [-1..1]
            a1 = fwd - rev
        else:
            # Fallback: digital buttons
            b_fwd = msg.buttons[BTN_M1_FWD] if len(msg.buttons) > BTN_M1_FWD else 0
            b_rev = msg.buttons[BTN_M1_REV] if len(msg.buttons) > BTN_M1_REV else 0
            a1 = (1.0 if b_fwd else 0.0) - (1.0 if b_rev else 0.0)

        # Motor 2: axis
        a2 = msg.axes[AXIS_M2] if 0 <= AXIS_M2 < len(msg.axes) else 0.0

        # deadzone
        state["ax_m1"] = 0.0 if abs(a1) < MOTOR_DEADZONE else a1
        state["ax_m2"] = 0.0 if abs(a2) < MOTOR_DEADZONE else a2

        state["prev_buttons"] = list(msg.buttons)

# ------------------ Worker threads ------------------
def pressure_loop(uart: serial.Serial):
    rate_hz = 20.0
    dt = 1.0 / rate_hz
    last_sent = None
    while rclpy.ok():
        with lock:
            p = state["pressure"]
        if last_sent is None or abs(p - last_sent) >= 0.01:
            try:
                uart.write(f"{p:.3f}\n".encode())
                last_sent = p
            except Exception as e:
                print("[pressure] write failed:", e)
        time.sleep(dt)

def _send_motor_velocity(v1: float, v2: float):
    _post_async(MOTOR_JSON_URL, json={"m1": float(v1), "m2": float(v2)})

def motor_http_loop():
    """POST current joystick velocities to the Radxa at a limited rate."""
    while rclpy.ok():
        now = time.time()

        with lock:
            a1 = float(state["ax_m1"])
            a2 = float(state["ax_m2"])
            last_joy = float(state["last_joy_ts"])
            last_sent_v1, last_sent_v2 = state["last_vel_sent"]
            last_post = float(state["last_vel_post_ts"])
            last_keepalive = float(state["last_keepalive_ts"])

        # Match your previous sign convention:
        v1 = clamp(-a1, -1.0, 1.0)
        v2 = clamp( a2, -1.0, 1.0)

        # deadman if /joy stops
        if last_joy == 0.0 or (now - last_joy) > JOY_DEADMAN_S:
            v1, v2 = 0.0, 0.0

        # rate limit
        if (now - last_post) < HTTP_VEL_INTERVAL:
            time.sleep(0.01)
            continue

        # only send if changed enough OR keepalive timer elapsed
        changed = (abs(v1 - last_sent_v1) >= VEL_EPS) or (abs(v2 - last_sent_v2) >= VEL_EPS)
        keepalive = (now - last_keepalive) >= VEL_KEEPALIVE_S

        if changed or keepalive:
            _send_motor_velocity(v1, v2)
            with lock:
                state["last_vel_sent"] = (v1, v2)
                state["last_vel_post_ts"] = now
                if keepalive:
                    state["last_keepalive_ts"] = now
        else:
            with lock:
                state["last_vel_post_ts"] = now

        time.sleep(0.01)

def motor_uart_loop(uart: serial.Serial):
    """Stream joystick velocities as int commands over UART to ESP32."""
    while rclpy.ok():
        now = time.time()

        with lock:
            a1 = float(state["ax_m1"])
            a2 = float(state["ax_m2"])
            last_joy = float(state["last_joy_ts"])
            last_sent_m1, last_sent_m2 = state["last_uart_sent"]
            last_uart_ts = float(state["last_uart_ts"])
            last_keepalive = float(state["last_uart_keepalive"])

        # Same sign convention as HTTP loop:
        v1 = clamp(-a1, -1.0, 1.0)
        v2 = clamp( a2, -1.0, 1.0)

        # deadman if /joy stops
        if last_joy == 0.0 or (now - last_joy) > JOY_DEADMAN_S:
            v1, v2 = 0.0, 0.0

        m1_i = vel_to_int255(v1)
        m2_i = vel_to_int255(v2)

        # rate limit
        if (now - last_uart_ts) < UART_VEL_INTERVAL:
            time.sleep(0.01)
            continue

        changed = (abs(m1_i - last_sent_m1) >= UART_EPS) or (abs(m2_i - last_sent_m2) >= UART_EPS)
        keepalive = (now - last_keepalive) >= UART_KEEPALIVE_S

        if changed or keepalive:
            try:
                uart.write(f"{m1_i},{m2_i}\n".encode())
                with lock:
                    state["last_uart_sent"] = (m1_i, m2_i)
                    state["last_uart_ts"] = now
                    if keepalive:
                        state["last_uart_keepalive"] = now
            except Exception as e:
                print("[motor-uart] write failed:", e)
                print("[motor-uart] stopping motor_uart_loop.")
                return
        else:
            with lock:
                state["last_uart_ts"] = now

        time.sleep(0.01)

# ------------------ Terminal command loop ------------------
def terminal_cmd_loop():
    print("\n[terminal] Ready. Examples:")
    print("  ilimit1 0.35   | ilimit2 0.25")
    print("  istall1 0.80   | istall2 0.60")
    print("  brakeall       | health")
    print("  quit / exit\n")

    while rclpy.ok():
        try:
            line = input("[motor-cmd] > ").strip()
        except (EOFError, KeyboardInterrupt):
            try:
                rclpy.shutdown()
            except Exception:
                pass
            return

        if not line:
            continue

        cmd = line.strip().lower()
        if cmd in ("q", "quit", "exit"):
            try:
                rclpy.shutdown()
            except Exception:
                pass
            return

        if cmd in ("health", "status"):
            try:
                r = _session.get(MOTOR_HEALTH, timeout=HTTP_TIMEOUT)
                print(f"[health] {r.status_code}: {r.text}")
            except Exception as e:
                print("[health] failed:", e)
            continue

        if cmd in ("brakeall", "brake"):
            try:
                r = _session.post(MOTOR_BRAKE_URL, json={}, timeout=HTTP_TIMEOUT)
                print(f"[brake] {r.status_code}: {r.text}")
            except Exception as e:
                print("[brake] failed:", e)
            continue

        # Forward everything else to POST /cmd
        try:
            r = _session.post(MOTOR_CMD_URL, json={"cmd": line}, timeout=HTTP_TIMEOUT)
            print(f"[cmd] {r.status_code}: {r.text}")
        except Exception as e:
            print("[cmd] failed:", e)

def health_poll_loop():
    """Poll /health periodically for on-screen diagnostics."""
    while rclpy.ok():
        ok = None
        summary = ""
        try:
            js = _get_json(MOTOR_HEALTH)
            ok = True

            if isinstance(js, dict) and "motors" in js:
                m = js.get("motors", {})
                m1 = m.get("m1", {})
                m2 = m.get("m2", {})
                summary = (
                    f"m1_fault={m1.get('fault')} m2_fault={m2.get('fault')} "
                    f"m1_vel={m1.get('vel_cmd')} m2_vel={m2.get('vel_cmd')}"
                )
            else:
                summary = str(js)
        except Exception as e:
            ok = False
            summary = str(e)

        with lock:
            state["health_ok"] = ok
            state["health_summary"] = summary

        time.sleep(0.5)

def video_loop():
    print("[video] Opening:", RTSP_URL)
    cap = _open_rtsp(RTSP_URL)
    if cap is None or not cap.isOpened():
        print(f"[video] cannot open {RTSP_URL}")
        return

    last_ts = time.time(); frames = 0; fps = 0.0
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

        with lock:
            p = state["pressure"]
            joy_ok = state["joy_alive"]
            led_on = state["led_on"]
            v1s, v2s = state["last_vel_sent"]
            h_ok = state["health_ok"]
            h_sum = state["health_summary"]
            joy_age = (now - state["last_joy_ts"]) if state["last_joy_ts"] else 999.0

        _put_text(frame, f"FPS: {fps:4.1f}", (10, 24))
        _put_text(frame, f"Pressure: {p:.2f} bar", (10, 48))
        _put_text(frame, f"Last sent vel:  m1 {v1s:+.2f}  m2 {v2s:+.2f}", (10, 72))
        _put_text(frame, f"LED: {'ON' if led_on else 'OFF'}   Joy age: {joy_age:.2f}s", (10, 96))

        if h_ok is None:
            _put_text(frame, "Radxa /health: (no data yet)", (10, 120))
        elif h_ok:
            _put_text(frame, f"Radxa /health: OK {h_sum}", (10, 120))
        else:
            _put_text(frame, f"Radxa /health: ERR {h_sum}", (10, 120))

        _put_text(frame, "LB: LED ON  RB: LED OFF  A: BRAKE  (Q to quit video)", (10, 144))
        _put_text(frame, f"JOY: {'OK' if joy_ok else 'WAITING'}", (10, 168))

        cv2.imshow("RTSP + Joystick Base Station (ROS2)", frame)
        if (cv2.waitKey(1) & 0xFF) == ord('q'):
            break

    cap.release()
    cv2.destroyAllWindows()

# ------------------ Main ------------------
def main():
    rclpy.init()

    node = Node("base_station_joy")
    node.create_subscription(Joy, "/joy", joy_cb, 10)

    executor = MultiThreadedExecutor()
    executor.add_node(node)
    spin_thread = threading.Thread(target=executor.spin, daemon=True)
    spin_thread.start()

    # Open pressure UART (optional)
    uart = None
    # try:
    #     uart = serial.Serial(PRESSURE_UART_PATH, PRESSURE_BAUD, timeout=1)
    #     print("[pressure] opened", uart.port)
    # except Exception as e:
    #     print("[pressure] open failed:", e)

    if uart:
        threading.Thread(target=pressure_loop, args=(uart,), daemon=True).start()

    # Open motor UART (optional)
    motor_uart = None
    if MOTOR_UART_PATH:
        try:
            motor_uart = serial.Serial(MOTOR_UART_PATH, MOTOR_UART_BAUD, timeout=1)
            print("[motor-uart] opened", motor_uart.port)
        except Exception as e:
            print("[motor-uart] open failed:", e)

    # Start loops
    threading.Thread(target=motor_http_loop, daemon=True).start()
    if motor_uart:
        threading.Thread(target=motor_uart_loop, args=(motor_uart,), daemon=True).start()
    threading.Thread(target=health_poll_loop, daemon=True).start()
    threading.Thread(target=terminal_cmd_loop, daemon=True).start()

    try:
        video_loop()
    finally:
        # Brake Radxa motors on exit
        try:
            _session.post(MOTOR_BRAKE_URL, json={}, timeout=HTTP_TIMEOUT)
        except Exception:
            pass

        if motor_uart:
            try:
                # send a final stop to ESP32
                motor_uart.write(b"0,0\n")
            except Exception:
                pass
            try:
                motor_uart.close()
            except Exception:
                pass

        if uart:
            try:
                uart.close()
            except Exception:
                pass

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