#!/usr/bin/env python3
import threading, time
import cv2, requests, serial
import rospy
from sensor_msgs.msg import Joy
from tmotor_serial_control.servo_serial import TMotorManager

# ------------------ Config ------------------
# Stable serial paths (your mappings)
PRESSURE_UART_PATH = "/dev/serial/by-id/usb-Silicon_Labs_CP2104_USB_to_UART_Bridge_Controller_02857388-if00-port0"  # pressure
# MOTOR_UART_PATH    = "/dev/serial/by-id/usb-1a86_USB_Serial-if00-port0"                                             # TMotor
MOTOR_UART_PATH    = "/dev/ttyUSB0"                                             # TMotor


PRESSURE_BAUD = 115200
MOTOR_BAUD    = 961200   # change to 921600 if your motor FW expects it

# Motor velocity range (rad/s)
v_max = 55.0
v_min = -55.0

# Motor params (for your AK80-64)
Servo_Params_Serial = {
    'AK80-64': {
        'Type': 'AK80-64',
        'P_min': -12.5,
        'P_max': 12.5,
        'V_min': v_min - 1,
        'V_max': v_max + 1,
        'Curr_min': -15.0,
        'Curr_max': 15.0,
        'Temp_max': 40.0,
        'Kt': 0.115,
        'GEAR_RATIO': 80,
        'NUM_POLE_PAIRS': 21
    }
}

# Radxa endpoints (video + HTTP control)
RADXA_IP       = "192.168.1.49"
RTSP_PORT      = 8554
RTSP_PATH      = "/stream"
MOTOR_API_PT  = 8000  # 2Dac2Motor HTTP API
LED_HTTP_PT    = 8080

RTSP_URL    = f"rtsp://{RADXA_IP}:{RTSP_PORT}{RTSP_PATH}"
CMD_URL    = f"http://{RADXA_IP}:{MOTOR_API_PT}/cmd"
MOTOR_URL  = f"http://{RADXA_IP}:{MOTOR_API_PT}/motor"
BRAKE_URL  = f"http://{RADXA_IP}:{MOTOR_API_PT}/brake"
HEALTH_URL = f"http://{RADXA_IP}:{MOTOR_API_PT}/health"
LED_ON_URL  = f"http://{RADXA_IP}:{LED_HTTP_PT}/on"
LED_OFF_URL = f"http://{RADXA_IP}:{LED_HTTP_PT}/off"

HTTP_TIMEOUT = (0.2, 0.4)   # (connect, read)
RECONNECT_DELAY_S = 1.5

# Joystick mapping
AXIS_MOTOR_VEL   = 3     # right stick horizontal → motor velocity
BTN_PRESSURE_UP  = 3     # Y button    → pressure +0.05
BTN_PRESSURE_DN  = 1     # X button    → pressure -0.05
AXIS_M1        = 1     # left stick vertical   → motor1 incremental counts
AXIS_M2        = 0     # left stick horizontal → motor2 incremental counts
BTN_LED_ON       = 4     # LB → LED ON
BTN_LED_OFF      = 5     # RB → LED OFF

# 2Dac2Motor incremental control (rate-based, counts)
MOTOR_DEADZONE = 0.12
# Full deflection command rate (counts/second). Tune to taste.
M1_COUNTS_PER_SEC = 4000.0
M2_COUNTS_PER_SEC = 4000.0
# Network rate-limit for POST /motor
HTTP_MOTOR_MIN_INTERVAL = 0.05   # seconds (20 Hz)

# Ranges
PRESSURE_MIN = 0.0
PRESSURE_MAX = 7.0
SERVO_MIN = 0
SERVO_MAX = 180

# ------------------ Shared state ------------------
def clamp(v, lo, hi): return lo if v < lo else hi if v > hi else v
lock = threading.Lock()
state = {
    "cur_vel": 0.0,             # motor velocity (rad/s)
    "pressure": 0.0,            # 0..2 bar
    "m1_pending": 0,         # pending delta counts to send (motor1)
    "m2_pending": 0,         # pending delta counts to send (motor2)
    "ax_m1": 0.0,              # raw axis values for integrator
    "ax_m2": 0.0,
    "last_http_sent": (0, 0),
    "last_motor_post_ts": 0.0,
    "joy_alive": False,
    "led_on": False,            # overlay state
    "prev_buttons": []          # for edge detection (debounce)
}

# ------------------ HTTP helpers ------------------
_session = requests.Session()
def _post_async(url, json=None, timeout=HTTP_TIMEOUT):
    def _do():
        try:
            _session.post(url, json=json, timeout=timeout)
        except Exception as e:
            print(f"[http] POST {url} failed:", e)
    threading.Thread(target=_do, daemon=True).start()

# ------------------ Video helpers ------------------
def _open_rtsp(url: str):
    cap = cv2.VideoCapture(url)
    if cap.isOpened(): return cap
    cap = cv2.VideoCapture(url, cv2.CAP_FFMPEG)
    if cap.isOpened(): return cap
    gst = f"rtspsrc location={url} latency=0 ! rtph264depay ! avdec_h264 ! videoconvert ! appsink"
    cap = cv2.VideoCapture(gst, cv2.CAP_GSTREAMER)
    if cap.isOpened(): return cap
    return None

def _put_text(img, text, org, scale=0.6, color=(255,255,255), thickness=1):
    cv2.putText(img, text, org, cv2.FONT_HERSHEY_SIMPLEX, scale, color, thickness, cv2.LINE_AA)

# ------------------ ROS joystick callback ------------------
def _edge(prev, cur):
    return (prev == 0 and cur == 1)

def joy_cb(msg: Joy):
    with lock:
        state["joy_alive"] = True

        # Init prev button list first time
        if not state["prev_buttons"]:
            state["prev_buttons"] = [0] * len(msg.buttons)

        # Velocity from axis (scaled to [-55, 55])
        raw = msg.axes[AXIS_MOTOR_VEL] if 0 <= AXIS_MOTOR_VEL < len(msg.axes) else 0.0
        state["cur_vel"] = v_min + v_max * (raw + 1.0)

        # Pressure bumps (edge-triggered)
        if 0 <= BTN_PRESSURE_UP < len(msg.buttons) and _edge(state["prev_buttons"][BTN_PRESSURE_UP], msg.buttons[BTN_PRESSURE_UP]):
            state["pressure"] = clamp(state["pressure"] + 0.05, PRESSURE_MIN, PRESSURE_MAX)
        if 0 <= BTN_PRESSURE_DN < len(msg.buttons) and _edge(state["prev_buttons"][BTN_PRESSURE_DN], msg.buttons[BTN_PRESSURE_DN]):
            state["pressure"] = clamp(state["pressure"] - 0.05, PRESSURE_MIN, PRESSURE_MAX)

        # LED control (edge-triggered)
        if 0 <= BTN_LED_ON < len(msg.buttons) and _edge(state["prev_buttons"][BTN_LED_ON], msg.buttons[BTN_LED_ON]):
            _post_async(LED_ON_URL);  state["led_on"] = True;  print("[LED] ON")
        if 0 <= BTN_LED_OFF < len(msg.buttons) and _edge(state["prev_buttons"][BTN_LED_OFF], msg.buttons[BTN_LED_OFF]):
            _post_async(LED_OFF_URL); state["led_on"] = False; print("[LED] OFF")        # Store axes for incremental motor control (deadzone)
        a1 = msg.axes[AXIS_M1] if 0 <= AXIS_M1 < len(msg.axes) else 0.0
        a2 = msg.axes[AXIS_M2] if 0 <= AXIS_M2 < len(msg.axes) else 0.0
        state["ax_m1"] = 0.0 if abs(a1) < MOTOR_DEADZONE else a1
        state["ax_m2"] = 0.0 if abs(a2) < MOTOR_DEADZONE else a2

        # Save current buttons for next edge detection
        state["prev_buttons"] = list(msg.buttons)

# ------------------ Threads ------------------
def motor_loop(motor):
    rate = rospy.Rate(100)  # 100 Hz
    while not rospy.is_shutdown():
        with lock:
            vel = state["cur_vel"]
        try:
            motor.set_output_velocity_radians_per_second(-vel)
            motor.update()
            # print("motor position",motor.position)
            # print("motor velocity",motor.velocity)
        except Exception as e:
            print("[motor] update failed:", e)
            time.sleep(0.05)
        rate.sleep()

def pressure_loop(uart):
    rate_hz = 20.0
    dt = 1.0 / rate_hz
    last_sent = None
    while not rospy.is_shutdown():
        with lock:
            p = state["pressure"]
        if last_sent is None or abs(p - last_sent) >= 0.01:
            try:
                uart.write(f"{p:.3f}\n".encode())
                print(f"[pressure] sent: {p:.3f}")
                last_sent = p
            except Exception as e:
                print("[pressure] write failed:", e)
        time.sleep(dt)

def motor_increment_loop():
    # Convert joystick axes into incremental motor commands (delta counts).
    # We integrate axis * (counts/sec) over dt, accumulate fractional counts,
    # then hand off integers to the HTTP sender loop.
    import math
    last = time.time()
    acc1 = 0.0
    acc2 = 0.0
    while not rospy.is_shutdown():
        now = time.time()
        dt = now - last
        last = now
        with lock:
            a1, a2 = state["ax_m1"], state["ax_m2"]
        acc1 += (-a1) * M1_COUNTS_PER_SEC * dt
        acc2 += ( a2) * M2_COUNTS_PER_SEC * dt

        d1 = int(math.trunc(acc1))
        d2 = int(math.trunc(acc2))
        if d1 != 0:
            acc1 -= d1
        if d2 != 0:
            acc2 -= d2

        if d1 != 0 or d2 != 0:
            with lock:
                state["m1_pending"] += d1
                state["m2_pending"] += d2

        time.sleep(0.01)  # ~100 Hz integrator

def motor_http_loop():
    # Push deltas via POST /motor, rate-limited
    while not rospy.is_shutdown():
        now = time.time()
        payload = None
        with lock:
            d1 = state["m1_pending"]
            d2 = state["m2_pending"]
            last_ts = state["last_motor_post_ts"]
            if (d1 != 0 or d2 != 0) and (now - last_ts) >= HTTP_MOTOR_MIN_INTERVAL:
                state["m1_pending"] = 0
                state["m2_pending"] = 0
                state["last_motor_post_ts"] = now
                payload = {}
                if d1 != 0: payload["m1"] = int(d1)
                if d2 != 0: payload["m2"] = int(d2)
        if payload:
            _post_async(MOTOR_URL, json=payload)
        time.sleep(0.01)

def video_loop():
    print("[video] Opening:", RTSP_URL)
    cap = _open_rtsp(RTSP_URL)
    if cap is None or not cap.isOpened():
        print(f"[video] cannot open {RTSP_URL}")
        return

    last_ts = time.time()
    frames = 0
    fps = 0.0

    while not rospy.is_shutdown():
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
            m1 = state["m1_pending"]
            m2 = state["m2_pending"]
            p = state["pressure"]
            v = state["cur_vel"]
            joy_ok = state["joy_alive"]
            led_on = state["led_on"]

        _put_text(frame, f"FPS: {fps:4.1f}", (10, 24))
        _put_text(frame, f"m1Δ: {m1:6d}  m2Δ: {m2:6d}", (10, 48))
        _put_text(frame, f"Pressure: {p:.2f} bar  Vel: {v:6.2f} rad/s", (10, 72))
        _put_text(frame, f"JOY: {'OK' if joy_ok else 'WAITING'}  LED: {'ON' if led_on else 'OFF'}", (10, 96))
        _put_text(frame, "LB: LED ON  RB: LED OFF  (Q to quit video)", (10, 120))

        cv2.imshow("RTSP + Joystick Base Station", frame)
        if (cv2.waitKey(1) & 0xFF) == ord('q'):
            break

    cap.release()
    cv2.destroyAllWindows()


# ------------------ Main ------------------
def main():
    rospy.init_node("base_station_joy", anonymous=True)

    # Open pressure UART
    uart = None
    try:
        uart = serial.Serial(PRESSURE_UART_PATH, PRESSURE_BAUD, timeout=1)
        print("[pressure] opened", uart.port)
    except Exception as e:
        print("[pressure] open failed:", e)

    # Motor
    motor = TMotorManager(
        port=MOTOR_UART_PATH,
        baud=MOTOR_BAUD,
        motor_params=Servo_Params_Serial['AK80-64'],
        max_mosfett_temp=80
    )
    motor.__enter__()
    motor.enter_velocity_control()
    motor.set_zero_position()
    motor.update()

    # ROS joystick subscriber (start joy_node separately)
    rospy.Subscriber("/joy", Joy, joy_cb)

    # 2Dac2Motor network command threads
    threading.Thread(target=motor_increment_loop, daemon=True).start()
    threading.Thread(target=motor_http_loop, daemon=True).start()

    # Threads
    t = threading.Thread(target=motor_loop, args=(motor,), daemon=True); t.start()
    if uart:
        threading.Thread(target=pressure_loop, args=(uart,), daemon=True).start()

    try:
        rospy.loginfo("base_station_joy running. Ctrl+C to exit.")
        rospy.spin()  # <— this keeps the process alive
    finally:
        # graceful stop: send zero for a short burst, then close
        try:
            t_end = time.time() + 1.0  # 1 second of zero-vel updates
            while time.time() < t_end:
                motor.set_output_velocity_radians_per_second(0.0)
                motor.update()
                print("motor position",motor.position)
                print("motor velocity",motor.velocity)
                time.sleep(0.02)  # 50 Hz
            motor.__exit__(None, None, None)
        except Exception:
            pass
        # close UART
        if uart:
            try: uart.close()
            except Exception: pass

if __name__ == "__main__":
    main()