import sys
import cv2
import serial 
import math
from PySide6.QtWidgets import QApplication, QLabel, QWidget, QGridLayout, QStackedLayout, QPushButton, QVBoxLayout, QHBoxLayout, QMainWindow 
from PySide6.QtCore import QTimer, Qt, QPointF, Signal
from PySide6.QtGui import QImage, QPixmap, QPainter, QColor, QPen, QBrush
from PySide6.QtOpenGLWidgets import QOpenGLWidget
from OpenGL.GL import *
from OpenGL.GLU import *
from stl import mesh    
import numpy as np
#import rospy
#from sensor_msgs.msg import Joy

import json
import requests
import threading

#VIDEO_URL = "http://192.168.2.3:81/stream"
#TELEMETRY_URL = "http://192.168.2.3/telemetry"

VIDEO_URL = "http://192.168.1.43:81/stream"
TELEMETRY_URL = "http://192.168.1.43/telemetry"

class JoystickDisplay(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.axes = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        self.setAttribute(Qt.WA_TransparentForMouseEvents)
        self.setStyleSheet("background: transparent")

    def update_axes(self, axes):
        self.axes = axes
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
            draw_arrow(cx, cy, -self.axes[0], -self.axes[1], max_arrow_len)

            # Right stick arrow (axes[2], axes[3])
            cx, cy = box_w * 1.5, box_h * 0.5
            draw_arrow(cx, cy, -self.axes[2], -self.axes[3], max_arrow_len)

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
    def wheelEvent(self, event):  # Zoom with scroll
        delta = event.angleDelta().y()
        if delta > 0:
            self.zoom_factor *= 1.1
        else:
            self.zoom_factor /= 1.1
        self.zoom_factor = max(1.0, min(5.0, self.zoom_factor))

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

    def set_rotation(self, r, i, j, k):
        self.quaternion = (r, i, j, k)
        self.update()

    def initializeGL(self):
        glEnable(GL_DEPTH_TEST)
        glEnable(GL_LIGHTING)
        glEnable(GL_LIGHT0)
        glEnable(GL_COLOR_MATERIAL)
        glClearColor(1, 1, 1, 1)

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
        self.menu_visible = False
        #rospy.Subscriber('/joy', Joy, self.joy_callback)

        # QLabel to display the video frame
        self.image_label = VideoLabel()
        self.image_label.setAlignment(Qt.AlignCenter)
        self.image_label.setFixedSize(320, 240)

        # Teensy data label (bottom-left)
        self.teensy_label = QLabel("Waiting for data...")
        self.teensy_label.setAlignment(Qt.AlignCenter)
        self.teensy_label.setFixedSize(320, 240)
        self.teensy_label.setStyleSheet("background-color: gray; border: 1px solid black; font-size: 10pt;")

        self.gl_display = GLSTLDisplay("CameraMountSmallBoard.stl")
        self.gl_display.setFixedSize(320, 240)

        self.joystick_display = JoystickDisplay()
        self.joystick_display.setFixedSize(320, 240)

        self.menu_button = QPushButton("☰")
        self.menu_button.setFixedSize(40, 40)
        self.menu_button.clicked.connect(self.toggle_menu)

        self.menu_panel = QWidget()
        self.menu_panel.setFixedWidth(200)
        self.menu_panel.setStyleSheet("background-color: #7c7c7c; border-right: 1px solid #ccc;")
        self.menu_panel.setVisible(False)

        res_low = QPushButton("Low (QVGA)")
        res_medium = QPushButton("Medium (VGA)")
        res_hd = QPushButton("HD (720p)")
        res_fullhd = QPushButton("Full HD (1080p)")

        res_low.clicked.connect(lambda: self.set_camera_resolution(320, 240))
        res_medium.clicked.connect(lambda: self.set_camera_resolution(640, 480))
        res_hd.clicked.connect(lambda: self.set_camera_resolution(960, 720))
        res_fullhd.clicked.connect(lambda: self.set_camera_resolution(1440, 1080))

        menu_layout = QVBoxLayout()
        menu_layout.addWidget(QLabel("Video Resolution"))
        menu_layout.addWidget(res_low)
        menu_layout.addWidget(res_medium)
        menu_layout.addWidget(res_hd)
        menu_layout.addWidget(res_fullhd)
        menu_layout.addStretch()
        self.menu_panel.setLayout(menu_layout)

        # Grid layout
        self.layout = QGridLayout()
        self.layout.addWidget(self.image_label, 0, 0)
        self.layout.addWidget(self.teensy_label, 0, 1)
        self.layout.addWidget(self.gl_display, 1, 1, 1, 2)

        self.default_layout_widget = QWidget()
        self.default_layout_widget.setLayout(self.layout)

        self.stack = QStackedLayout()
        self.stack.addWidget(self.default_layout_widget)

        self.container = QWidget()
        self.main_layout = QHBoxLayout()

        # Left: side panel
        self.main_layout.addWidget(self.menu_panel)

        # Right: top menu + stacked layout
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

            self.image_label.overlay.update_axes(self.joystick_display.axes)                        

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
        try:
            with requests.get(TELEMETRY_URL, stream=True, timeout=1) as r:
                for line in r.iter_lines():
                    if self.telemetry_thread_stop.is_set():
                        break
                    if line:
                        print(line)
                        data = json.loads(line.decode('utf-8'))
                        orientation = data.get("orientation", {})
                        x = orientation.get("x", 0.0)
                        y = orientation.get("y", 0.0)
                        z = orientation.get("z", 0.0)
                        r, i, j, k = WebcamViewer.euler_to_quaternion(x, y, z)

                        self.telemetry_updated.emit(r, i, j, k)
                        self.imu_label_updated.emit(f"IMU (xyz): x={x:.2f} y={y:.2f} z={z:.2f}")

        except Exception as e:
            pass


    def closeEvent(self, event):
        self.cap.release()
        self.telemetry_thread_stop.set()  # terminate telem thread (that is reading IMU data)
        super().closeEvent(event)

    def joy_callback(self, data):
        axes = data.axes
        self.joystick_display.update_axes(axes)

    def focus_widget(self, widget):
        self.focus_view = QWidget()
        layout = QVBoxLayout(self.focus_view)
        widget.setFixedSize(640, 480)
        layout.addWidget(widget)

        if widget == self.image_label:
            zoom_in = QPushButton("Zoom In")
            zoom_out = QPushButton("Zoom Out")
            zoom_in.clicked.connect(lambda: self.adjust_zoom(1.1))
            zoom_out.clicked.connect(lambda: self.adjust_zoom(1/1.1))
            layout.addWidget(zoom_in)
            layout.addWidget(zoom_out)

        back_button = QPushButton("Back")
        back_button.clicked.connect(self.unfocus_widget)
        layout.addWidget(back_button)

        self.stack.addWidget(self.focus_view)
        self.stack.setCurrentWidget(self.focus_view)

    def unfocus_widget(self):
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

    def toggle_menu(self):
        if self.menu_visible:
            self.menu_visible = False  
            self.menu_panel.setVisible(False)
            self.main_layout.removeWidget(self.menu_panel)
            self.menu_panel.setParent(None)
        else:
            self.menu_visible = True
            self.main_layout.insertWidget(0, self.menu_panel)
            self.menu_panel.setVisible(True)

        self.resize_to_fit_contents()

    def set_camera_resolution(self, width, height):
        self.cap.set(cv2.CAP_PROP_FRAME_WIDTH, width)
        self.cap.set(cv2.CAP_PROP_FRAME_HEIGHT, height)
        actual_width = self.cap.get(cv2.CAP_PROP_FRAME_WIDTH)
        actual_height = self.cap.get(cv2.CAP_PROP_FRAME_HEIGHT)
        print(f"Set to: {actual_width} x {actual_height}")  

if __name__ == "__main__":
    #rospy.init_node('gui_node', anonymous=True)
    app = QApplication(sys.argv)
    viewer = WebcamViewer()
    viewer.resize(700, 500)
    viewer.show()
    viewer.focus_widget(viewer.gl_display)
    viewer.unfocus_widget()
    sys.exit(app.exec())
