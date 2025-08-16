import sys
import cv2
import math
from PySide6.QtWidgets import QApplication, QLabel, QWidget, QGridLayout, QStackedLayout, QPushButton, QVBoxLayout, QHBoxLayout, QMainWindow 
from PySide6.QtCore import QTimer, Qt, Signal, QEasingCurve, QPropertyAnimation, QRect
from PySide6.QtGui import QImage, QPixmap,QSurfaceFormat
import time
import os
os.environ["QT_API"] = "pyside6"

import json
import requests
import threading
import time
import rospy
from sensor_msgs.msg import Joy

from matplotlib_3d_plot import Matplotlib3DPlot
from videolabel import VideoLabel
from glstldisplay import GLSTLDisplay
from globals import axes_lock, SERVO_URL, VIDEO_URL, TELEMETRY_URL, axes, image_label_global, servo1_angle, servo2_angle, servo_lock

def map_axis_to_angle(v: float, invert=False) -> int:
    """Map joystick axis in [-1, 1] to servo angle in [0, 180]."""
    if invert:
        v = -v
    angle = int((v) * 10.0)
    return angle

class WebcamViewer(QMainWindow):
    telemetry_updated = Signal(float, float, float, float)
    imu_label_updated = Signal(str)

    def __init__(self):
        super().__init__()
        self.setWindowTitle("In-Pipe Visualization")
        self.setStyleSheet("background-color: white;")
        self.menu_visible = False

        # QLabel to display the video frame
        global image_label_global
        image_label_global = VideoLabel()
        image_label_global.setAlignment(Qt.AlignCenter)
        image_label_global.setFixedSize(320, 240)

        self.image_label = image_label_global

        # Teensy data label (bottom-left)
        self.teensy_label = QLabel("Waiting for data...")
        self.teensy_label.setAlignment(Qt.AlignCenter)
        self.teensy_label.setFixedSize(320, 240)
        self.teensy_label.setStyleSheet("background-color: gray; border: 1px solid black; font-size: 10pt;")

        self.gl_display = GLSTLDisplay("CameraMountSmallBoard.stl")
        self.gl_display.setFixedSize(320, 240)
        self.gl_display.setStyleSheet("background: transparent;")

        self.localization_label = Matplotlib3DPlot()
        self.localization_label.setFixedSize(320, 240)

        self.menu_button = QPushButton("☰")
        self.menu_button.setStyleSheet("color: black; background-color: #c2c2c2;")
        self.menu_button.setFixedSize(40, 40)
        
        # Main layout
        self.layout = QGridLayout() 
        self.layout.addWidget(self.image_label, 0, 0)
        self.layout.addWidget(self.teensy_label, 0, 1)
        self.layout.addWidget(self.gl_display, 1, 1, 1, 2)
        self.layout.addWidget(self.localization_label, 1, 0)

        self.default_layout_widget = QWidget()
        self.default_layout_widget.setLayout(self.layout)

        self.stack = QStackedLayout()
        self.stack.addWidget(self.default_layout_widget)

        self.container = QWidget()
        self.main_layout = QHBoxLayout()

        right_panel = QWidget()
        right_layout = QVBoxLayout()
        right_layout.addWidget(self.menu_button, alignment=Qt.AlignLeft)
        right_layout.addLayout(self.stack)
        right_panel.setLayout(right_layout)

        self.main_layout.addWidget(right_panel)
        self.container.setLayout(self.main_layout)
        self.setCentralWidget(self.container)

        # OpenCV video capture
        self.cap = cv2.VideoCapture(VIDEO_URL)

        # QTimer to grab frames periodically
        self.timer = QTimer()
        self.timer.timeout.connect(self.update_frame)
        self.timer.start(10)

        # Setup for telemetry thread (currently just IMU)
        self.telemetry_thread_stop = threading.Event()
        self.telemetry_thread = threading.Thread(target=self.read_telemetry, daemon=True)
        self.telemetry_thread.start()

        self.telemetry_updated.connect(self.gl_display.set_rotation)
        self.imu_label_updated.connect(self.teensy_label.setText)

        self.image_label.clicked.connect(lambda: self.focus_widget(self.image_label))
        self.gl_display.clicked.connect(lambda: self.focus_widget(self.gl_display))
        self.localization_label.clicked.connect(lambda: self.focus_widget(self.localization_label))

        self.overlay_widget = QWidget(self)
        self.overlay_widget.setStyleSheet("background-color: rgba(0, 0, 0, 120);")
        self.overlay_widget.setVisible(False)
        self.overlay_widget.mousePressEvent = lambda event: self.toggle_menu()

        # Resolution menu logic 
        self.sliding_menu = QWidget(self)
        self.sliding_menu.setStyleSheet("background-color: #7c7c7c;")
        self.sliding_menu.setFixedWidth(200)
        menu_layout = QVBoxLayout(self.sliding_menu)
        menu_layout.addWidget(QLabel("Video Resolution"))
        menu_layout.addWidget(QPushButton("Low (QVGA)", clicked=lambda: self.set_camera_resolution(320, 240)))
        menu_layout.addWidget(QPushButton("Medium (VGA)", clicked=lambda: self.set_camera_resolution(640, 480)))
        menu_layout.addWidget(QPushButton("HD (720p)", clicked=lambda: self.set_camera_resolution(960, 720)))
        menu_layout.addWidget(QPushButton("Full HD (1080p)", clicked=lambda: self.set_camera_resolution(1440, 1080)))
        menu_layout.addStretch()

        self.menu_button.clicked.connect(self.toggle_menu)

        self.resize_timer = QTimer()
        self.resize_timer.setSingleShot(True)
        self.resize_timer.timeout.connect(self.update_overlay_geometry)

    def update_frame(self):
        ret, frame = self.cap.read()
        if ret:
            frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
            h, w, ch = frame.shape
            bytes_per_line = ch * w
            qt_image = QImage(frame.data, w, h, bytes_per_line, QImage.Format_RGB888)

            pixmap = QPixmap.fromImage(qt_image)
            zoom = self.image_label.zoom_factor
            w = int(self.image_label.width() * zoom)
            h = int(self.image_label.height() * zoom)
            scaled_pixmap = pixmap.scaled(w, h, Qt.KeepAspectRatio, Qt.SmoothTransformation)
            self.image_label.setPixmap(scaled_pixmap)

            self.image_label.overlay.update_axes(axes)

    @staticmethod
    def euler_to_quaternion(x, y, z):
        x = math.radians(x)
        y = math.radians(y)
        z = math.radians(z)

        cx = math.cos(x * 0.5)
        sx = math.sin(x * 0.5)
        cy = math.cos(y * 0.5)
        sy = math.sin(y * 0.5)
        cz = math.cos(z * 0.5)
        sz = math.sin(z * 0.5)

        r = cx * cy * cz + sx * sy * sz
        i = sx * cy * cz - cx * sy * sz
        j = cx * sy * cz + sx * cy * sz
        k = cx * cy * sz - sx * sy * cz

        return r, i, j, k

    def read_telemetry(self):
        url = TELEMETRY_URL
        headers = {"Accept": "text/event-stream"}
        while not self.telemetry_thread_stop.is_set():
            try:
                # (connect timeout, read timeout). For SSE, set read timeout to None.
                with requests.get(url, headers=headers, stream=True, timeout=(5, None)) as r:
                    r.raise_for_status()
                    # chunk_size=1 -> low latency; decode_unicode=True -> str lines
                    for line in r.iter_lines(decode_unicode=True, chunk_size=1):
                        if self.telemetry_thread_stop.is_set():
                            break
                        if not line:
                            # blank line = SSE message separator; skip
                            continue
                        if line.startswith(":"):
                            # heartbeat/comment
                            continue
                        if line.startswith("data: "):
                            line = line[6:]  # strip "data: "
                        # Now 'line' should be the pure JSON payload
                        try:
                            data = json.loads(line)
                        except json.JSONDecodeError:
                            # If your firmware sometimes sends non-JSON lines, just ignore them
                            # print(f"[SSE] Non-JSON line: {line!r}")
                            continue

                        # Adjust these keys to whatever imu_update() emits
                        orientation = data.get("orientation", {})
                        x = float(orientation.get("x", 0.0))
                        y = float(orientation.get("y", 0.0))
                        z = float(orientation.get("z", 0.0))

                        r_, i_, j_, k_ = WebcamViewer.euler_to_quaternion(x, y, z)
                        self.telemetry_updated.emit(r_, i_, j_, k_)
                        self.imu_label_updated.emit(f"IMU (xyz): x={x:.2f} y={y:.2f} z={z:.2f}")

            except requests.RequestException as e:
                print(f"[SSE] telemetry connection error: {e}", flush=True)
                # brief backoff, then reconnect
                time.sleep(1)
            except Exception as e:
                # catch-all so the thread doesn't die silently
                print(f"[SSE] telemetry unexpected error: {e}", flush=True)
                time.sleep(1)


    def closeEvent(self, event):
        # self.cam_thread.stop()
        self.cap.release()
        self.telemetry_thread_stop.set()  # terminate telem thread (that is reading IMU data)
        super().closeEvent(event)

    # Fullscreen logic 
    def focus_widget(self, widget):
        self.focus_view = QWidget()
        layout = QVBoxLayout(self.focus_view)
        widget.setFixedSize(640, 480)
        layout.addWidget(widget)

        if widget == self.image_label:
            self.menu_button.setVisible(True)
            zoom_buttons_layout = QHBoxLayout()
            zoom_buttons_layout.setSpacing(5)

            zoom_in = QPushButton("+")
            zoom_in.setFixedSize(30, 30)
            zoom_in.setStyleSheet("font-size: 16pt; color: black; background-color: #c2c2c2;")
            zoom_in.clicked.connect(lambda: self.adjust_zoom(1.1))
            zoom_out = QPushButton("-")
            zoom_out.setFixedSize(30, 30)
            zoom_out.setStyleSheet("font-size: 16pt; color: black; background-color: #c2c2c2;")
            zoom_out.clicked.connect(lambda: self.adjust_zoom(1/1.1))
            
            zoom_buttons_layout.addWidget(zoom_in)
            zoom_buttons_layout.addWidget(zoom_out)

            right_align_layout = QHBoxLayout()
            right_align_layout.addSpacing(540)
            right_align_layout.addLayout(zoom_buttons_layout)

            layout.addLayout(right_align_layout)

        elif widget == self.gl_display or widget == self.localization_label:
            self.menu_button.setVisible(False)

        back_button = QPushButton("←")
        back_button.setFixedSize(40, 40)
        back_button.setStyleSheet("""
            QPushButton {
                font-size: 18pt;
                color: black;
                background-color: white;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
        """)
        back_button.clicked.connect(self.unfocus_widget)
        layout.addWidget(back_button)

        self.stack.addWidget(self.focus_view)
        self.stack.setCurrentWidget(self.focus_view)

    def unfocus_widget(self):
        self.menu_button.setVisible(True)
        widget = self.focus_view.layout().itemAt(0).widget()
        if widget == self.image_label:
            self.layout.addWidget(widget, 0, 0)
        elif widget == self.gl_display:
            self.layout.addWidget(widget, 1, 1, 1, 2)

        widget.setFixedSize(320, 240)
        self.stack.setCurrentWidget(self.default_layout_widget)
        self.stack.removeWidget(self.focus_view)
        self.focus_view.deleteLater()

    def adjust_zoom(self, factor):
        self.image_label.zoom_factor *= factor
        self.image_label.zoom_factor = max(1.0, min(5.0, self.image_label.zoom_factor))

    def resize_to_fit_contents(self):
        hint = self.centralWidget().sizeHint()
        frame = self.frameGeometry()
        geo = self.geometry()
        dw = frame.width() - geo.width()
        dh = frame.height() - geo.height()
        self.setMinimumSize(0, 0)
        self.resize(hint.width() + dw, hint.height() + dh)

    def set_camera_resolution(self, width, height):
        self.cap.set(cv2.CAP_PROP_FRAME_WIDTH, width)
        self.cap.set(cv2.CAP_PROP_FRAME_HEIGHT, height)
        actual_width = self.cap.get(cv2.CAP_PROP_FRAME_WIDTH)
        actual_height = self.cap.get(cv2.CAP_PROP_FRAME_HEIGHT)
        self.toggle_menu()

    def resizeEvent(self, event):
        super().resizeEvent(event)
        self.resize_timer.start(10)

    def update_overlay_geometry(self):
        self.overlay_widget.setGeometry(self.rect())
        self.sliding_menu.setGeometry(-200, 0, 200, self.height())

    def toggle_menu(self):
        if self.menu_visible:
            anim = QPropertyAnimation(self.sliding_menu, b"geometry")
            anim.setDuration(300)
            anim.setStartValue(QRect(0, 0, 200, self.height()))
            anim.setEndValue(QRect(-200, 0, 200, self.height()))
            anim.setEasingCurve(QEasingCurve.OutCubic)
            anim.start()
            self.menu_animation = anim
            self.overlay_widget.setVisible(False)
            self.menu_visible = False
        else:
            self.overlay_widget.setVisible(True)
            anim = QPropertyAnimation(self.sliding_menu, b"geometry")
            anim.setDuration(300)
            anim.setStartValue(QRect(-200, 0, 200, self.height()))
            anim.setEndValue(QRect(0, 0, 200, self.height()))
            anim.setEasingCurve(QEasingCurve.OutCubic)
            anim.start()
            self.menu_animation = anim

def servo_command_thread():
    last_s1 = None
    last_s2 = None

    while True:
        # read latest desired angles
        with servo_lock:
            s1 = servo1_angle
            s2 = servo2_angle
        
        if last_s1 is None or last_s1 != s1 or last_s2 is None or last_s2 != s2:
            print("Servo1", s1)
            print("Servo2", s2)
            payload = {"servo1": int(s1), "servo2": int(s2)}
            try:
                resp = requests.post(SERVO_URL, json=payload, timeout=0.5)
                if resp.ok:
                    last_s1, last_s2 = s1, s2
                else:
                    print(f"[servo] HTTP {resp.status_code}: {resp.text[:80]}")
            except requests.RequestException as e:
                print(f"[servo] error: {e}")

        time.sleep(0.05)

def joy_callback(data):
    global servo1_angle, servo2_angle
    # Update axes in place (do not rebind)
    with axes_lock:
        axes = list(data.axes)

    # Map joystick to servo angles
    s1 = map_axis_to_angle(axes[4], invert=False)  # left stick X
    s2 = map_axis_to_angle(axes[5], invert=True)   # left stick Y (invert if your Y is reversed)

    # Update shared globals safely
    with servo_lock:
        servo1_angle += s1
        servo2_angle += s2

    # Keep your on-screen arrows in sync
    global image_label_global
    if image_label_global is not None:
        image_label_global.overlay.update_axes(axes)

def ros_spin_thread():
    rospy.spin()

if __name__ == "__main__":
    rospy.init_node('gui_node', anonymous=True)
    rospy.Subscriber('/joy', Joy, joy_callback)
    threading.Thread(target=servo_command_thread, daemon=True).start()

    fmt = QSurfaceFormat()
    fmt.setAlphaBufferSize(8)
    fmt.setRenderableType(QSurfaceFormat.OpenGL)
    fmt.setProfile(QSurfaceFormat.CoreProfile)
    QSurfaceFormat.setDefaultFormat(fmt)  

    app = QApplication(sys.argv)
    viewer = WebcamViewer()
    viewer.resize(700, 500)
    viewer.show()
    viewer.focus_widget(viewer.gl_display)
    viewer.unfocus_widget()
    threading.Thread(target=ros_spin_thread, daemon=True).start()
    sys.exit(app.exec())



