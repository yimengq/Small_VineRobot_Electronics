import sys
import cv2
import serial 
import math
from PySide6.QtWidgets import QApplication, QLabel, QWidget, QGridLayout, QStackedLayout, QPushButton, QVBoxLayout, QHBoxLayout, QMainWindow 
from PySide6.QtCore import QTimer, Qt, QPointF, Signal, QEasingCurve, QPropertyAnimation, QRect
from PySide6.QtGui import QImage, QPixmap, QPainter, QColor, QPen, QBrush, QSurfaceFormat
from PySide6.QtOpenGLWidgets import QOpenGLWidget
from OpenGL.GL import *
from OpenGL.GLU import *
from stl import mesh    
import numpy as np
import time
import os
os.environ["QT_API"] = "pyside6"

# replace these two lines:
# matplotlib.use("Qt5Agg")
# from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas

# with:
import matplotlib
matplotlib.use("QtAgg")
from matplotlib.backends.backend_qtagg import FigureCanvasQTAgg as FigureCanvas

# from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.figure import Figure

import rospy
from sensor_msgs.msg import Joy

import json
import requests
import threading
import queue
VIDEO_URL = "http://192.168.1.55:81/stream"
TELEMETRY_URL = "http://192.168.1.55:82/telemetry"
SERVO_URL = "http://192.168.1.55:80/servo"
axes = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
image_label_global = None  # Global reference to the image label for joystick updates

from threading import Lock

# Global servo angles (shared between ROS callback and servo thread)
servo1_angle = 90
servo2_angle = 90
servo_lock = Lock()

def map_axis_to_angle(v: float, invert=False) -> int:
    """Map joystick axis in [-1, 1] to servo angle in [0, 180]."""
    if invert:
        v = -v
    angle = int((v + 1.0) * 90.0)
    return 0 if angle < 0 else 180 if angle > 180 else angle

class CameraThread(threading.Thread):
    def __init__(self, url):
        super().__init__(daemon=True)
        self.cap = cv2.VideoCapture(url)
        self.latest_frame = None
        self.lock = threading.Lock()
        self.running = True
    def run(self):
        while self.running:
            ret, frame = self.cap.read()
            if ret:
                with self.lock:
                    self.latest_frame = frame
    def get_frame(self):
        with self.lock:
            return None if self.latest_frame is None else self.latest_frame.copy()
    def stop(self):
        self.running = False
        self.cap.release()

class Matplotlib3DPlot(QWidget):
    clicked = Signal()
    def __init__(self, parent=None):
        super().__init__(parent)
        self.canvas = FigureCanvas(Figure(figsize=(4, 3)))
        layout = QVBoxLayout()
        layout.addWidget(self.canvas)
        self.setLayout(layout)

        self.ax = self.canvas.figure.add_subplot(111, projection='3d')
        self.plot_dummy_path()

    def plot_dummy_path(self):
        t = np.linspace(0, 4 * np.pi, 100)
        x = np.sin(t)
        y = np.cos(t)
        z = t

        self.ax.plot(x, y, z, label='Ground Truth Path')
        self.ax.set_xlabel('X')
        self.ax.set_ylabel('Y')
        self.ax.set_zlabel('Z')
        self.ax.legend()
        self.canvas.draw()
    
    def mousePressEvent(self, event):
        self.clicked.emit()

# Arrows overlayed on video feed as joystick axes are moved 
class JoystickDisplay(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setAttribute(Qt.WA_TransparentForMouseEvents)
        self.setStyleSheet("background: transparent")

    def update_axes(self, ax):
        global axes
        axes = ax
        self.update()

    def paintEvent(self, event):
        painter = QPainter(self)
        try:
            painter.setRenderHint(QPainter.Antialiasing)

            w = self.width()
            h = self.height()

            box_w = w / 2
            box_h = h

            arrow_color = QColor(Qt.black)
            pen = QPen(arrow_color, 5, Qt.SolidLine, Qt.RoundCap, Qt.RoundJoin)
            painter.setPen(pen)
            painter.setBrush(QBrush(arrow_color))

            def draw_arrow(cx, cy, dx, dy, max_len):
                length = (dx * dx + dy * dy) ** 0.5
                if length < 0.05:
                    return

                scale = min(length, 1.0) * max_len
                norm_dx = dx / length
                norm_dy = dy / length

                end_x = cx + norm_dx * scale
                end_y = cy + norm_dy * scale

                painter.drawLine(QPointF(cx, cy), QPointF(end_x, end_y))

                angle = math.atan2(norm_dy, norm_dx)
                arrow_size = 10
                p1 = QPointF(end_x, end_y)
                p2 = QPointF(
                    end_x - arrow_size * math.cos(angle - math.pi / 6),
                    end_y - arrow_size * math.sin(angle - math.pi / 6)
                )
                p3 = QPointF(
                    end_x - arrow_size * math.cos(angle + math.pi / 6),
                    end_y - arrow_size * math.sin(angle + math.pi / 6)
                )

                painter.drawPolygon([p1, p2, p3])  

            max_arrow_len = min(box_w, box_h) / 2 - 20

            # Left stick arrow (axes[0], axes[1])
            cx, cy = box_w * 0.5, box_h * 0.5
            draw_arrow(cx, cy, -axes[0], -axes[1], max_arrow_len)

            # Right stick arrow (axes[2], axes[3])
            cx, cy = box_w * 1.5, box_h * 0.5
            draw_arrow(cx, cy, -axes[3], -axes[4], max_arrow_len)

        finally:
            painter.end()

class VideoLabel(QLabel):
    clicked = Signal()
    def __init__(self, parent=None):
        super().__init__(parent)
        self.overlay = JoystickDisplay(self)
        self.overlay.setGeometry(0, 0, self.width(), self.height())
        self.zoom_factor = 1.0

    def resizeEvent(self, event):
        super().resizeEvent(event)
        self.overlay.setGeometry(0, 0, self.width(), self.height())

    def mousePressEvent(self, event):
        self.clicked.emit()
    # def wheelEvent(self, event):  # Zoom with scroll
    #     delta = event.angleDelta().y()
    #     if delta > 0:
    #         self.zoom_factor *= 1.1
    #     else:
    #         self.zoom_factor /= 1.1
    #     self.zoom_factor = max(1.0, min(5.0, self.zoom_factor))

# 3D visualization of tip using IMU rotation data
class GLSTLDisplay(QOpenGLWidget):
    clicked = Signal()
    def __init__(self, stl_path, parent=None):
        super().__init__(parent)
        self.quaternion = (1, 0, 0, 0)
         # Load the STL model
        self.model = mesh.Mesh.from_file(stl_path)
        # Center and scale to fit view
        self.model.vectors -= self.model.get_mass_properties()[1]
        scale = 1.0 / np.max(np.linalg.norm(self.model.vectors, axis=2))
        self.model.vectors *= scale
        self.model_list = None
        self.setAttribute(Qt.WA_AlwaysStackOnTop)
        self.setAttribute(Qt.WA_TranslucentBackground)
        self.setAutoFillBackground(False)

    def set_rotation(self, r, i, j, k):
        self.quaternion = (r, i, j, k)
        self.update()

    def initializeGL(self):
        glEnable(GL_DEPTH_TEST)
        glEnable(GL_LIGHTING)
        glEnable(GL_LIGHT0)
        glEnable(GL_COLOR_MATERIAL)
        glEnable(GL_BLEND)
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
        glClearColor(0.0, 0.0, 0.0, 0.0)

        self.model_list = glGenLists(1)
        glNewList(self.model_list, GL_COMPILE)

        glBegin(GL_TRIANGLES)
        glColor3f(0.169, 0.486, 1)
        for tri in self.model.vectors:
            norm = np.cross(tri[1] - tri[0], tri[2] - tri[0])
            norm /= np.linalg.norm(norm)
            glNormal3fv(norm)
            for v in tri:
                glVertex3fv(v)
        glEnd()

        glEndList()

    def resizeGL(self, w, h):
        glViewport(0, 0, w, h)
        glMatrixMode(GL_PROJECTION)
        glLoadIdentity()
        gluPerspective(45.0, w / h if h != 0 else 1.0, 1.0, 100.0)
        glMatrixMode(GL_MODELVIEW)

    def paintGL(self):
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        glLoadIdentity()
        glTranslatef(0, 0, -3)

        r, x, y, z = self.quaternion
        angle = 2 * math.degrees(math.acos(r))
        s = math.sqrt(1 - r*r) or 1
        glRotatef(angle, x/s, y/s, z/s)

        glCallList(self.model_list)

    def mousePressEvent(self, event):
        self.clicked.emit()

    def showEvent(self, event):
        super().showEvent(event)
        self.update() 


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

        # self.joystick_display = JoystickDisplay()
        # self.joystick_display.setFixedSize(320, 240)

        # threading.Thread(target=self.servo_command_thread, daemon=True).start()

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
        self.cam_thread = CameraThread(VIDEO_URL)
        self.cam_thread.start()
        # self.cap = cv2.VideoCapture(VIDEO_URL)
        #self.cap.set(cv2.CAP_PROP_FRAME_WIDTH, 1920)
        #self.cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 1080)

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

    # def update_frame(self):
    #     ret, frame = self.cap.read()
    #     if ret:
    #         frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
    #         h, w, ch = frame.shape
    #         bytes_per_line = ch * w
    #         qt_image = QImage(frame.data, w, h, bytes_per_line, QImage.Format_RGB888)

    #         pixmap = QPixmap.fromImage(qt_image)
    #         zoom = self.image_label.zoom_factor
    #         w = int(self.image_label.width() * zoom)
    #         h = int(self.image_label.height() * zoom)
    #         scaled_pixmap = pixmap.scaled(w, h, Qt.KeepAspectRatio, Qt.SmoothTransformation)
    #         self.image_label.setPixmap(scaled_pixmap)

    #         self.image_label.overlay.update_axes(axes)

    def update_frame(self):
        # ret, frame = self.cap.read()
        frame = self.cam_thread.get_frame()
        if frame is None:
            return
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

    # def read_telemetry(self):
    #     try:
    #         with requests.get(TELEMETRY_URL, stream=True, timeout=5) as r:
    #             for line in r.iter_lines():
    #                 if self.telemetry_thread_stop.is_set():
    #                     break
    #                 if line:
    #                     # print(line)
    #                     data = json.loads(line.decode('utf-8'))
    #                     orientation = data.get("orientation", {})
    #                     x = orientation.get("x", 0.0)
    #                     y = orientation.get("y", 0.0)
    #                     z = orientation.get("z", 0.0)
    #                     r, i, j, k = WebcamViewer.euler_to_quaternion(x, y, z)

    #                     self.telemetry_updated.emit(r, i, j, k)
    #                     self.imu_label_updated.emit(f"IMU (xyz): x={x:.2f} y={y:.2f} z={z:.2f}")

    #     except Exception as e:
    #         pass

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
        self.cam_thread.stop()
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
#             self.menu_visible = True

def servo_command_thread():
    last_s1 = None
    last_s2 = None
    change_thresh = 1      # degrees; only POST if changed >= 1
    period = 0.01          # 100 Hz
    # Optional exponential smoothing (tames noisy sticks)
    use_smoothing = True
    alpha = 0.4            # 0..1 (higher = more responsive)
    filt_s1 = 90
    filt_s2 = 90

    while True:
        # read latest desired angles
        with servo_lock:
            s1 = servo1_angle
            s2 = servo2_angle
            print("servo1",s1)
        # if use_smoothing:
        #     filt_s1 = int(alpha * s1 + (1 - alpha) * filt_s1)
        #     filt_s2 = int(alpha * s2 + (1 - alpha) * filt_s2)
        #     s1, s2 = filt_s1, filt_s2

        # send only if changed
        if last_s1 is None or abs(s1 - last_s1) >= change_thresh or \
           last_s2 is None or abs(s2 - last_s2) >= change_thresh:
            payload = {"servo1": int(s1), "servo2": int(s2)}
            try:
                resp = requests.post(SERVO_URL, json=payload, timeout=0.5)
                if resp.ok:
                    last_s1, last_s2 = s1, s2
                else:
                    print(f"[servo] HTTP {resp.status_code}: {resp.text[:80]}")
            except requests.RequestException as e:
                print(f"[servo] error: {e}")

        time.sleep(period)



# def servo_command_thread():
#     servo1 = 90
#     servo2 = 90
#     step = 10
#     direction = 1  # 1 = increasing, -1 = decreasing

#     while True:
#         payload = {"servo1": servo1, "servo2": servo2}
#         try:
#             print(f"Posting servo command: {servo1}, {servo2}", flush=True)
#             response = requests.post(SERVO_URL, json=payload, timeout=3)
#             if response.ok:
#                 print("Servo command successful")
#             else:
#                 print(f"Servo command failed: {response.status_code}")
#         except requests.RequestException as e:
#             print(f"Servo command failed: {e}", flush=True)

#         servo1 += step * direction
#         servo2 += step * direction

#         if servo1 >= 180 or servo1 <= 0:
#             direction *= -1

#         time.sleep(1)  # every 10 seconds


# def servo_command_thread():
#     last = None
#     rate = rospy.Rate(0.05)
#     xdir = 90
#     ydir = 150

#     while not rospy.is_shutdown():
#         print("Tick", flush=True)
#         # xdir = int(axes[3] * 180)
#         # ydir = int(axes[4] * 180)
#         payload = {
#             "servo1": xdir, 
#             "servo2": ydir
#         }
#         try:
#             print("posting servo command", [xdir, ydir], flush=True)
#             response = requests.post(SERVO_URL, json=payload, timeout = 3)
#             if response.ok:
#                 print("Servo command successful")
#             else:
#                 print("Servo command failed")
#         except requests.RequestException as e:
#             print(f"Servo command failed: {e}", flush=True)

#         xdir += 10

#         rate.sleep()

def joy_callback(data):
    global axes, servo1_angle, servo2_angle
    axes = data.axes

    # Map joystick to servo angles
    s1 = map_axis_to_angle(axes[0], invert=False)  # left stick X
    s2 = map_axis_to_angle(axes[1], invert=True)   # left stick Y (invert if your Y is reversed)

    # Update shared globals safely
    with servo_lock:
        servo1_angle = s1
        servo2_angle = s2

    # Keep your on-screen arrows in sync
    global image_label_global
    if image_label_global is not None:
        image_label_global.overlay.update_axes(axes)


# def joy_callback(data):
#     global axes
#     axes = data.axes
#     print(axes)
#     global image_label_global
#     if image_label_global is not None:
#         image_label_global.overlay.update_axes(axes)

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
    #rospy.spin()
    sys.exit(app.exec())
