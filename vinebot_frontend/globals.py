from threading import Lock

axes_lock = Lock() 
SERVO_URL = "http://192.168.1.55:80/servo"
VIDEO_URL = "http://192.168.1.55:81/stream"
TELEMETRY_URL = "http://192.168.1.55:82/telemetry"
axes = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
image_label_global = None  # Global reference to the image label for joystick updates
servo1_angle = 90
servo2_angle = 90
servo_lock = Lock()