import sys
import cv2
import serial 
import math
from PySide6.QtWidgets import QApplication, QLabel, QWidget, QGridLayout
from PySide6.QtCore import QTimer, Qt, QPointF
from PySide6.QtGui import QImage, QPixmap, QPainter, QColor, QPen, QBrush
from PySide6.QtOpenGLWidgets import QOpenGLWidget
from OpenGL.GL import *
from OpenGL.GLU import *
from stl import mesh    
import numpy as np
import rospy
from sensor_msgs.msg import Joy

class JoystickDisplay(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.axes = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

    def update_axes(self, axes):
        self.axes = axes
        self.update()

    def paintEvent(self, event):
        painter = QPainter(self)
        painter.setRenderHint(QPainter.Antialiasing)

        w = self.width()
        h = self.height()

        box_w = w/2
        box+h = h/2

        painter.setPen(QPen(Q.black, 1))
        for row in range(2):
            for col in range(2):
                painter.drawRect(col*box_w, row*box_h, box.w, box.h)

        arrow_color = QColor(50, 150, 100)
        pen = QPen(arrow_color, 4, Qt.SolidLine, Qt.RoundCap, Qt.RoundJoin)
        painter.setPen(pen)
        painter.setBrush(QBrush(arrow_color))
 
class GLSTLDisplay(QOpenGLWidget):
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

class WebcamViewer(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("In-Pipe Visualization")
        rospy.Subscriber('/joy', Joy, self.joy_callback)

        # QLabel to display the video frame
        self.image_label = QLabel()
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
        layout = QGridLayout()
        layout.addWidget(self.image_label, 0, 0)
        layout.addWidget(self.teensy_label, 0, 1)
        layout.addWidget(self.gl_display, 1, 1, 1, 2)
        layout.addWidget(self.joystick_display, 1, 0)
        self.setLayout(layout)

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


if __name__ == "__main__":
    rospy.init_node('gui_node', anonymous=True)
    app = QApplication(sys.argv)
    viewer = WebcamViewer()
    viewer.resize(700, 500)
    viewer.show()
    sys.exit(app.exec())
