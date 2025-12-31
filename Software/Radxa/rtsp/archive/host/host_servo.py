#!/usr/bin/env python3
import curses
import time
import requests

RADXA_IP       = "192.168.1.64"     # <-- change me if needed
RTSP_PORT      = 8554
RTSP_PATH      = "/stream"
SERVO_HTTP_PT  = 80
LED_HTTP_PT    = 8080

RTSP_URL    = f"rtsp://{RADXA_IP}:{RTSP_PORT}{RTSP_PATH}"
SERVO_URL   = f"http://{RADXA_IP}:{SERVO_HTTP_PT}/servo"
LED_ON_URL  = f"http://{RADXA_IP}:{LED_HTTP_PT}/on"
LED_OFF_URL = f"http://{RADXA_IP}:{LED_HTTP_PT}/off"

TIMEOUT = (0.2, 0.5)   # (connect, read) seconds

def send_servo(s1=None, s2=None):
    payload = {}
    if s1 is not None: payload["servo1"] = int(s1)
    if s2 is not None: payload["servo2"] = int(s2)
    try:
        r = requests.post(SERVO_URL, json=payload, timeout=TIMEOUT)
        return r.ok, r.text
    except Exception as e:
        return False, str(e)

def clamp(v, lo=0, hi=180):
    return lo if v < lo else hi if v > hi else v

def main(stdscr):
    curses.curs_set(0)
    stdscr.nodelay(True)     # non-blocking getch
    stdscr.timeout(50)       # refresh every 50 ms

    servo1, servo2 = 90, 90
    step = 5

    # Center at start
    send_servo(servo1, servo2)

    last_status = "Ready"
    while True:
        stdscr.erase()
        stdscr.addstr(0, 0, "Radxa Servo Keyboard Control (port 80)")
        stdscr.addstr(3, 0, f"Angles:  servo1={servo1:3d}°, servo2={servo2:3d}°   step={step}°")
        stdscr.addstr(5, 0, "Controls: W/S -> servo1 +/-,  A/D -> servo2 -/+,  C -> center")
        stdscr.addstr(6, 0, "          [ / ] -> step -, +   |   Q -> quit")
        stdscr.addstr(8, 0, f"Status: {last_status[:80]}")
        stdscr.refresh()

        ch = stdscr.getch()
        if ch == -1:
            time.sleep(0.05)
            continue

        key = chr(ch).lower() if 0 <= ch < 256 else ''
        changed = False

        if key == 'q':
            break
        elif key == 'w':
            servo1 = clamp(servo1 + step); changed = True
        elif key == 's':
            servo1 = clamp(servo1 - step); changed = True
        elif key == 'a':
            servo2 = clamp(servo2 - step); changed = True
        elif key == 'd':
            servo2 = clamp(servo2 + step); changed = True
        elif key == 'c':
            servo1, servo2 = 90, 90; changed = True
        elif key == '[':
            step = max(1, step - 1)
        elif key == ']':
            step = min(30, step + 1)

        if changed:
            ok2, msg2 = send_servo(servo1, servo2)
            last_status = msg2 if ok2 else f"POST error: {msg2}"

if __name__ == "__main__":
    curses.wrapper(main)
