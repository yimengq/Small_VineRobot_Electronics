import sys
import cv2
import serial 
import math
from PySide6.QtWidgets import QApplication, QLabel, QWidget, QGridLayout, QStackedLayout, QPushButton, QVBoxLayout
from PySide6.QtCore import QTimer, Qt, QPointF, Signal
from PySide6.QtGui import QImage, QPixmap, QPainter, QColor, QPen, QBrush
from PySide6.QtOpenGLWidgets import QOpenGLWidget
from OpenGL.GL import *
from OpenGL.GLU import *
from stl import mesh    
import numpy as np
#import rospy
#from sensor_msgs.msg import Joy

class FullScreenWindow(QWidget):
    def __init__(self, widget):
        super().__init__()
        self.setWindowTitle("Full Screen View")
        self.setWindowFlag(Qt.Window)
        self.setWindowState(Qt.WindowFullScreen)

        layout = QGridLayout()
        layout.addWidget(widget)
        self.setLayout(layout)

        # Esc key closes window
        self.keyPressEvent = lambda e: self.close() if e.key() == Qt.Key_Escape else None

class JoystickDisplay(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.axes = [0.0, 1.0, 0.0, -1.0, 0.0, 0.0]
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
            draw_arrow(cx, cy, self.axes[0], -self.axes[1], max_arrow_len)

            # Right stick arrow (axes[2], axes[3])
            cx, cy = box_w * 1.5, box_h * 0.5
            draw_arrow(cx, cy, self.axes[2], -self.axes[3], max_arrow_len)

        finally:
            painter.end()

class VideoLabel(QLabel):
    clicked = Signal()
    def __init__(self, parent=None):
        super().__init__(parent)
        self.overlay = JoystickDisplay(self)
        self.overlay.setGeometry(0, 0, self.width(), self.height())

    def resizeEvent(self, event):
        super().resizeEvent(event)
        self.overlay.setGeometry(0, 0, self.width(), self.height())

    def mousePressEvent(self, event):
        self.clicked.emit()

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

class WebcamViewer(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("In-Pipe Visualization")
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

        # Grid layout
        self.layout = QGridLayout()
        self.layout.addWidget(self.image_label, 0, 0)
        self.layout.addWidget(self.teensy_label, 0, 1)
        self.layout.addWidget(self.gl_display, 1, 1, 1, 2)

        self.default_layout_widget = QWidget()
        self.default_layout_widget.setLayout(self.layout)

        self.stack = QStackedLayout()
        self.stack.addWidget(self.default_layout_widget)

        container_layout = QVBoxLayout()
        container_layout.addLayout(self.stack)
        self.setLayout(container_layout)

        # OpenCV video capture
        self.cap = cv2.VideoCapture(0)  # 0 is usually the default webcam

        # QTimer to grab frames periodically
        self.timer = QTimer()
        self.timer.timeout.connect(self.update_frame)
        self.timer.start(10)  # 30 ms ~ 33 FPS

        # Teensy Serial Connection
        try:
            self.serial_port = serial.Serial('/dev/tty.usbmodem159405501', 115200, timeout=0.001)  
            self.serial_port.reset_input_buffer()
            self.serial_timer = QTimer()
            self.serial_timer.timeout.connect(self.read_serial_data)
            self.serial_timer.start(1)  # Check serial every 100 ms
        except serial.SerialException:
            self.teensy_label.setText("Failed to connect to Teensy")

        self.image_label.clicked.connect(lambda: self.focus_widget(self.image_label))
        self.gl_display.clicked.connect(lambda: self.focus_widget(self.gl_display))

    def update_frame(self):
        ret, frame = self.cap.read()
        if ret:
            # Convert BGR (OpenCV format) to RGB
            frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
            h, w, ch = frame.shape
            bytes_per_line = ch * w
            qt_image = QImage(frame.data, w, h, bytes_per_line, QImage.Format_RGB888)

            # Scale pixmap to fit QLabel size while keeping aspect ratio
            pixmap = QPixmap.fromImage(qt_image)
            scaled_pixmap = pixmap.scaled(self.image_label.size(), Qt.KeepAspectRatio)
            self.image_label.setPixmap(scaled_pixmap)

            self.image_label.overlay.update_axes(self.joystick_display.axes)
    
    def read_serial_data(self):
        if self.serial_port.in_waiting:
            line = self.serial_port.readline().decode('utf-8').strip()
            self.teensy_label.setText(f"Teensy: {line}")

            if "Rotation Vector" in line:
                parts = line.split()
                r = float(parts[4])
                i = float(parts[6])
                j = float(parts[8])
                k = float(parts[10])
                self.gl_display.set_rotation(r, i, j, k)

    def closeEvent(self, event):
        self.cap.release()
        super().closeEvent(event)

    def joy_callback(self, data):
        axes = data.axes
        self.joystick_display.update_axes(axes)

    def focus_widget(self, widget):
        self.focus_view = QWidget()
        layout = QVBoxLayout(self.focus_view)
        widget.setFixedSize(640, 480)
        layout.addWidget(widget)

        back_button = QPushButton("Back")
        back_button.clicked.connect(self.unfocus_widget)
        layout.addWidget(back_button)

        self.stack.addWidget(self.focus_view)
        self.stack.setCurrentWidget(self.focus_view)

    def unfocus_widget(self):
        widget = self.focus_view.layout().itemAt(0).widget()
        # Add back to original grid
        if widget == self.image_label:
            self.layout.addWidget(widget, 0, 0)
        elif widget == self.gl_display:
            self.layout.addWidget(widget, 1, 1, 1, 2)

        widget.setFixedSize(320, 240)
        self.stack.setCurrentWidget(self.default_layout_widget)
        self.stack.removeWidget(self.focus_view)
        self.focus_view.deleteLater()


if __name__ == "__main__":
    #rospy.init_node('gui_node', anonymous=True)
    app = QApplication(sys.argv)
    viewer = WebcamViewer()
    viewer.resize(700, 500)
    viewer.show()
    QTimer.singleShot(100, lambda: viewer.gl_display.repaint())
    sys.exit(app.exec())
