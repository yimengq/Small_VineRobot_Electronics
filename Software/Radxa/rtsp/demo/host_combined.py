# #!/usr/bin/env python3
# import os, threading, time, glob
# import cv2, requests, serial
# import rospy
# from sensor_msgs.msg import Joy
# from tmotor_serial_control.servo_serial import TMotorManager

# # ------------------ Config ------------------
# # Stable serial paths (your mappings)
# PRESSURE_UART_PATH = "/dev/serial/by-id/usb-Silicon_Labs_CP2104_USB_to_UART_Bridge_Controller_02857388-if00-port0"  # pressure
# MOTOR_UART_PATH    = "/dev/serial/by-id/usb-1a86_USB_Serial-if00-port0"                                             # TMotor

# PRESSURE_BAUD = 115200
# MOTOR_BAUD    = 961200   # change to 921600 if your motor FW expects it

# # Motor velocity range (rad/s)
# v_max = 55.0
# v_min = -55.0

# # Motor params (for your AK80-64)
# Servo_Params_Serial = {
#     'AK80-64': {
#         'Type': 'AK80-64',
#         'P_min': -12.5,
#         'P_max': 12.5,
#         'V_min': v_min - 1,
#         'V_max': v_max + 1,
#         'Curr_min': -15.0,
#         'Curr_max': 15.0,
#         'Temp_max': 40.0,
#         'Kt': 0.115,
#         'GEAR_RATIO': 80,
#         'NUM_POLE_PAIRS': 21
#     }
# }

# # Radxa endpoints
# RADXA_IP       = "192.168.1.49"
# RTSP_PORT      = 8554
# RTSP_PATH      = "/stream"
# SERVO_HTTP_PT  = 80
# LED_HTTP_PT    = 8080

# RTSP_URL    = f"rtsp://{RADXA_IP}:{RTSP_PORT}{RTSP_PATH}"
# SERVO_URL   = f"http://{RADXA_IP}:{SERVO_HTTP_PT}/servo"
# LED_ON_URL  = f"http://{RADXA_IP}:{LED_HTTP_PT}/on"
# LED_OFF_URL = f"http://{RADXA_IP}:{LED_HTTP_PT}/off"

# HTTP_TIMEOUT = (0.2, 0.4)   # (connect, read)
# RECONNECT_DELAY_S = 1.5

# # Joystick mapping
# AXIS_MOTOR_VEL = 3     # right stick horizontal → motor velocity
# BTN_PRESSURE_UP = 3    # Y button    → pressure +0.05
# BTN_PRESSURE_DN = 1    # X button    → pressure -0.05
# AXIS_SERVO1 = 1        # left stick vertical   → servo1 (incremental)
# AXIS_SERVO2 = 0        # left stick horizontal → servo2 (incremental)

# # Servo incremental control (rate-based)
# SERVO_DEADZONE = 0.12
# SERVO_RATE_DEG_PER_SEC_1 = 120.0   # full deflection rate
# SERVO_RATE_DEG_PER_SEC_2 = 120.0
# HTTP_SERVO_MIN_INTERVAL  = 0.01    # send at most 10 Hz

# # Ranges
# PRESSURE_MIN = 0.0
# PRESSURE_MAX = 2.0
# SERVO_MIN = 0
# SERVO_MAX = 180

# # ------------------ Shared state ------------------
# def clamp(v, lo, hi): return lo if v < lo else hi if v > hi else v
# lock = threading.Lock()
# state = {
#     "cur_vel": 0.0,             # motor velocity (rad/s)
#     "pressure": 0.0,            # 0..2 bar
#     "servo1": 90,               # degrees
#     "servo2": 90,               # degrees
#     "ax_servo1": 0.0,           # raw axis values for integrator
#     "ax_servo2": 0.0,
#     "last_http_sent": (90, 90),
#     "last_servo_post_ts": 0.0,
#     "joy_alive": False
# }

# # ------------------ HTTP helpers ------------------
# _session = requests.Session()
# def _post_async(url, json=None, timeout=HTTP_TIMEOUT):
#     def _do():
#         try:
#             _session.post(url, json=json, timeout=timeout)
#         except Exception as e:
#             print(f"[http] POST {url} failed:", e)
#     threading.Thread(target=_do, daemon=True).start()

# # ------------------ Video helpers ------------------
# def _open_rtsp(url: str):
#     cap = cv2.VideoCapture(url)
#     if cap.isOpened(): return cap
#     cap = cv2.VideoCapture(url, cv2.CAP_FFMPEG)
#     if cap.isOpened(): return cap
#     gst = f"rtspsrc location={url} latency=0 ! rtph264depay ! avdec_h264 ! videoconvert ! appsink"
#     cap = cv2.VideoCapture(gst, cv2.CAP_GSTREAMER)
#     if cap.isOpened(): return cap
#     return None

# def _put_text(img, text, org, scale=0.6, color=(255,255,255), thickness=1):
#     cv2.putText(img, text, org, cv2.FONT_HERSHEY_SIMPLEX, scale, color, thickness, cv2.LINE_AA)

# # ------------------ ROS joystick callback ------------------
# def joy_cb(msg: Joy):
#     with lock:
#         state["joy_alive"] = True

#         # Velocity from axis (scaled to [-55, 55])
#         raw = msg.axes[AXIS_MOTOR_VEL] if 0 <= AXIS_MOTOR_VEL < len(msg.axes) else 0.0
#         state["cur_vel"] = v_min + v_max * (raw + 1.0)

#         # Pressure bumps
#         if 0 <= BTN_PRESSURE_UP < len(msg.buttons) and msg.buttons[BTN_PRESSURE_UP]:
#             state["pressure"] = clamp(state["pressure"] + 0.05, PRESSURE_MIN, PRESSURE_MAX)
#         if 0 <= BTN_PRESSURE_DN < len(msg.buttons) and msg.buttons[BTN_PRESSURE_DN]:
#             state["pressure"] = clamp(state["pressure"] - 0.05, PRESSURE_MIN, PRESSURE_MAX)

#         # Store axes for incremental servo control (deadzone)
#         a1 = msg.axes[AXIS_SERVO1] if 0 <= AXIS_SERVO1 < len(msg.axes) else 0.0
#         a2 = msg.axes[AXIS_SERVO2] if 0 <= AXIS_SERVO2 < len(msg.axes) else 0.0
#         state["ax_servo1"] = 0.0 if abs(a1) < SERVO_DEADZONE else a1
#         state["ax_servo2"] = 0.0 if abs(a2) < SERVO_DEADZONE else a2

# # ------------------ Threads ------------------
# def motor_loop(motor):
#     rate = rospy.Rate(100)  # 100 Hz
#     while not rospy.is_shutdown():
#         with lock:
#             vel = state["cur_vel"]
#         try:
#             motor.set_output_velocity_radians_per_second(vel)
#             motor.update()
#         except Exception as e:
#             print("[motor] update failed:", e)
#             time.sleep(0.05)
#         rate.sleep()

# def pressure_loop(uart):
#     rate_hz = 20.0
#     dt = 1.0 / rate_hz
#     last_sent = None
#     while not rospy.is_shutdown():
#         with lock:
#             p = state["pressure"]
#         if last_sent is None or abs(p - last_sent) >= 0.01:
#             try:
#                 uart.write(f"{p:.2f}\n".encode())
#                 last_sent = p
#             except Exception as e:
#                 print("[pressure] write failed:", e)
#         time.sleep(dt)

# def servo_integrator_loop():
#     # Increment servos by axis * rate * dt (deg/s)
#     last = time.time()
#     while not rospy.is_shutdown():
#         now = time.time()
#         dt = now - last
#         last = now
#         with lock:
#             s1, s2 = state["servo1"], state["servo2"]
#             a1, a2 = state["ax_servo1"], state["ax_servo2"]
#             # Invert a1 if you want opposite direction (currently up stick decreases angle)
#             s1 = clamp(s1 + (-a1) * SERVO_RATE_DEG_PER_SEC_1 * dt, SERVO_MIN, SERVO_MAX)
#             s2 = clamp(s2 + ( a2) * SERVO_RATE_DEG_PER_SEC_2 * dt, SERVO_MIN, SERVO_MAX)
#             state["servo1"], state["servo2"] = int(round(s1)), int(round(s2))
#         time.sleep(0.01)  # ~100 Hz

# def servo_http_loop():
#     # Push servo angles at most 10 Hz
#     while not rospy.is_shutdown():
#         now = time.time()
#         send = False
#         with lock:
#             s1, s2 = state["servo1"], state["servo2"]
#             last = state["last_http_sent"]
#             last_ts = state["last_servo_post_ts"]
#             if (s1, s2) != last and (now - last_ts) >= HTTP_SERVO_MIN_INTERVAL:
#                 state["last_http_sent"] = (s1, s2)
#                 state["last_servo_post_ts"] = now
#                 send = True
#         if send:
#             _post_async(SERVO_URL, json={"servo1": s1, "servo2": s2})
#         time.sleep(0.02)

# def video_loop():
#     print("[video] Opening:", RTSP_URL)
#     cap = _open_rtsp(RTSP_URL)
#     if cap is None or not cap.isOpened():
#         print(f"[video] cannot open {RTSP_URL}")
#         return
#     last_ts = time.time(); frames = 0; fps = 0.0
#     while not rospy.is_shutdown():
#         ok, frame = cap.read()
#         if not ok or frame is None:
#             print("[video] read failed, reconnecting...")
#             cap.release()
#             time.sleep(RECONNECT_DELAY_S)
#             cap = _open_rtsp(RTSP_URL)
#             if cap is None or not cap.isOpened():
#                 print("[video] reconnect failed, retrying...")
#                 continue
#             else:
#                 print("[video] reconnected")
#                 continue

#         frames += 1
#         now = time.time()
#         if now - last_ts >= 1.0:
#             fps = frames / (now - last_ts)
#             last_ts = now
#             frames = 0

#         with lock:
#             s1, s2 = state["servo1"], state["servo2"]
#             p = state["pressure"]
#             v = state["cur_vel"]
#             joy_ok = state["joy_alive"]

#         _put_text(frame, f"FPS: {fps:4.1f}", (10, 24))
#         _put_text(frame, f"Servo1: {s1:3d}°  Servo2: {s2:3d}°", (10, 48))
#         _put_text(frame, f"Pressure: {p:.2f} bar  Vel: {v:6.2f} rad/s", (10, 72))
#         _put_text(frame, f"JOY: {'OK' if joy_ok else 'WAITING'}  (Y:+P / X:-P)", (10, 96))

#         cv2.imshow("RTSP + Joystick Base Station", frame)
#         if (cv2.waitKey(1) & 0xFF) == ord('q'):
#             break

#     cap.release()
#     cv2.destroyAllWindows()

# # ------------------ Main ------------------
# def main():
#     rospy.init_node("base_station_joy", anonymous=True)

#     # Open pressure UART
#     uart = None
#     try:
#         uart = serial.Serial(PRESSURE_UART_PATH, PRESSURE_BAUD, timeout=1)
#         print("[pressure] opened", uart.port)
#     except Exception as e:
#         print("[pressure] open failed:", e)

#     # Motor
#     motor = TMotorManager(
#         port=MOTOR_UART_PATH,
#         baud=MOTOR_BAUD,
#         motor_params=Servo_Params_Serial['AK80-64'],
#         max_mosfett_temp=80
#     )
#     motor.__enter__()
#     motor.enter_velocity_control()
#     motor.set_zero_position()
#     motor.update()

#     # ROS joystick subscriber (start joy_node separately)
#     rospy.Subscriber("/joy", Joy, joy_cb)

#     # Threads
#     threads = []
#     t = threading.Thread(target=motor_loop, args=(motor,), daemon=True); threads.append(t); t.start()
#     if uart:
#         t = threading.Thread(target=pressure_loop, args=(uart,), daemon=True); threads.append(t); t.start()
#     t = threading.Thread(target=servo_integrator_loop, daemon=True); threads.append(t); t.start()
#     t = threading.Thread(target=servo_http_loop, daemon=True); threads.append(t); t.start()

#     # Video loop blocks until quit (Q)
#     try:
#         video_loop()
#     finally:
#         try:
#             motor.set_output_velocity_radians_per_second(0.0)
#             motor.update()
#             motor.__exit__(None, None, None)
#         except Exception:
#             pass
#         if uart:
#             try: uart.close()
#             except Exception: pass

# if __name__ == "__main__":
#     main()


#!/usr/bin/env python3
import threading, time
import cv2, requests, serial
import rospy
from sensor_msgs.msg import Joy
from tmotor_serial_control.servo_serial import TMotorManager

# ------------------ Config ------------------
# Stable serial paths (your mappings)
PRESSURE_UART_PATH = "/dev/serial/by-id/usb-Silicon_Labs_CP2104_USB_to_UART_Bridge_Controller_02857388-if00-port0"  # pressure
MOTOR_UART_PATH    = "/dev/serial/by-id/usb-1a86_USB_Serial-if00-port0"                                             # TMotor

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
SERVO_HTTP_PT  = 80
LED_HTTP_PT    = 8080

RTSP_URL    = f"rtsp://{RADXA_IP}:{RTSP_PORT}{RTSP_PATH}"
SERVO_URL   = f"http://{RADXA_IP}:{SERVO_HTTP_PT}/servo"
LED_ON_URL  = f"http://{RADXA_IP}:{LED_HTTP_PT}/on"
LED_OFF_URL = f"http://{RADXA_IP}:{LED_HTTP_PT}/off"

HTTP_TIMEOUT = (0.2, 0.4)   # (connect, read)
RECONNECT_DELAY_S = 1.5

# Joystick mapping
AXIS_MOTOR_VEL   = 3     # right stick horizontal → motor velocity
BTN_PRESSURE_UP  = 3     # Y button    → pressure +0.05
BTN_PRESSURE_DN  = 1     # X button    → pressure -0.05
AXIS_SERVO1      = 1     # left stick vertical   → servo1 (incremental)
AXIS_SERVO2      = 0     # left stick horizontal → servo2 (incremental)
BTN_LED_ON       = 4     # LB → LED ON
BTN_LED_OFF      = 5     # RB → LED OFF

# Servo incremental control (rate-based)
SERVO_DEADZONE = 0.12
SERVO_RATE_DEG_PER_SEC_1 = 180.0   # full deflection rate
SERVO_RATE_DEG_PER_SEC_2 = 180.0
HTTP_SERVO_MIN_INTERVAL  = 0.01    # send at most 10 Hz

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
    "servo1": 90,               # degrees
    "servo2": 90,               # degrees
    "ax_servo1": 0.0,           # raw axis values for integrator
    "ax_servo2": 0.0,
    "last_http_sent": (90, 90),
    "last_servo_post_ts": 0.0,
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
            _post_async(LED_OFF_URL); state["led_on"] = False; print("[LED] OFF")

        # Store axes for incremental servo control (deadzone)
        a1 = msg.axes[AXIS_SERVO1] if 0 <= AXIS_SERVO1 < len(msg.axes) else 0.0
        a2 = msg.axes[AXIS_SERVO2] if 0 <= AXIS_SERVO2 < len(msg.axes) else 0.0
        state["ax_servo1"] = 0.0 if abs(a1) < SERVO_DEADZONE else a1
        state["ax_servo2"] = 0.0 if abs(a2) < SERVO_DEADZONE else a2

        # Save current buttons for next edge detection
        state["prev_buttons"] = list(msg.buttons)

# ------------------ Threads ------------------
def motor_loop(motor):
    rate = rospy.Rate(100)  # 100 Hz
    while not rospy.is_shutdown():
        with lock:
            vel = state["cur_vel"]
        try:
            motor.set_output_velocity_radians_per_second(vel)
            motor.update()
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
                last_sent = p
            except Exception as e:
                print("[pressure] write failed:", e)
        time.sleep(dt)

def servo_integrator_loop():
    # Increment servos by axis * rate * dt (deg/s)
    last = time.time()
    while not rospy.is_shutdown():
        now = time.time()
        dt = now - last
        last = now
        with lock:
            s1, s2 = state["servo1"], state["servo2"]
            a1, a2 = state["ax_servo1"], state["ax_servo2"]
            s1 = clamp(s1 + (-a1) * SERVO_RATE_DEG_PER_SEC_1 * dt, SERVO_MIN, SERVO_MAX)
            s2 = clamp(s2 + ( a2) * SERVO_RATE_DEG_PER_SEC_2 * dt, SERVO_MIN, SERVO_MAX)
            state["servo1"], state["servo2"] = int(round(s1)), int(round(s2))
        time.sleep(0.01)  # ~100 Hz

def servo_http_loop():
    # Push servo angles at most 10 Hz
    while not rospy.is_shutdown():
        now = time.time()
        send = False
        with lock:
            s1, s2 = state["servo1"], state["servo2"]
            last = state["last_http_sent"]
            last_ts = state["last_servo_post_ts"]
            if (s1, s2) != last and (now - last_ts) >= HTTP_SERVO_MIN_INTERVAL:
                state["last_http_sent"] = (s1, s2)
                state["last_servo_post_ts"] = now
                send = True
        if send:
            _post_async(SERVO_URL, json={"servo1": s1, "servo2": s2})
        time.sleep(0.02)

def video_loop():
    print("[video] Opening:", RTSP_URL)
    cap = _open_rtsp(RTSP_URL)
    if cap is None or not cap.isOpened():
        print(f"[video] cannot open {RTSP_URL}")
        return
    last_ts = time.time(); frames = 0; fps = 0.0
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
            else:
                print("[video] reconnected")
                continue

        frames += 1
        now = time.time()
        if now - last_ts >= 1.0:
            fps = frames / (now - last_ts)
            last_ts = now
            frames = 0

        with lock:
            s1, s2 = state["servo1"], state["servo2"]
            p = state["pressure"]
            v = state["cur_vel"]
            joy_ok = state["joy_alive"]
            led_on = state["led_on"]

        _put_text(frame, f"FPS: {fps:4.1f}", (10, 24))
        _put_text(frame, f"Servo1: {s1:3d}°  Servo2: {s2:3d}°", (10, 48))
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

    # Threads
    t = threading.Thread(target=motor_loop, args=(motor,), daemon=True); t.start()
    if uart:
        threading.Thread(target=pressure_loop, args=(uart,), daemon=True).start()
    threading.Thread(target=servo_integrator_loop, daemon=True).start()
    threading.Thread(target=servo_http_loop, daemon=True).start()

    # Video loop blocks until quit (Q)
    try:
        video_loop()
    finally:
        try:
            motor.set_output_velocity_radians_per_second(0.0)
            motor.update()
            motor.__exit__(None, None, None)
        except Exception:
            pass
        if uart:
            try: uart.close()
            except Exception: pass

if __name__ == "__main__":
    main()
