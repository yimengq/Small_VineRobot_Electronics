import math
from PySide6.QtWidgets import QWidget
from PySide6.QtCore import QTimer, Qt, QPointF
from PySide6.QtGui import QPainter, QColor, QPen, QBrush, QSurfaceFormat
from PySide6.QtOpenGLWidgets import QOpenGLWidget
from OpenGL.GL import *
from OpenGL.GLU import *
import time
import os
os.environ["QT_API"] = "pyside6"

from globals import axes, axes_lock

class JoystickDisplay(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setAttribute(Qt.WA_TransparentForMouseEvents)
        self.setStyleSheet("background: transparent")

        self._axes = [0.0]*6
        self._fps_frames = 0
        self._fps_t0 = time.time()

        # repaint at ~60 Hz regardless of video FPS
        self._timer = QTimer(self)
        self._timer.setTimerType(Qt.PreciseTimer)
        self._timer.setInterval(16)  # ~60 Hz
        self._timer.timeout.connect(self._tick)
        self._timer.start()

    def _tick(self):
        # pull latest axes from global, thread-safe
        with axes_lock:
            self._axes = list(axes)
        self.update()  # request a repaint on GUI thread

    # (OPTIONAL) keep for API compatibility, but no longer does painting directly
    def update_axes(self, ax):
        # just update the global copy; painting is timer-driven
        with axes_lock:
            for i in range(min(6, len(ax))):
                axes[i] = ax[i]

    def paintEvent(self, event):
        # (optional) overlay FPS instrumentation
        self._fps_frames += 1
        now = time.time()
        if now - self._fps_t0 >= 1.0:
            # print(f"Overlay FPS: {self._fps_frames}")
            self._fps_frames = 0
            self._fps_t0 = now

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
                p2 = QPointF(end_x - arrow_size * math.cos(angle - math.pi / 6),
                             end_y - arrow_size * math.sin(angle - math.pi / 6))
                p3 = QPointF(end_x - arrow_size * math.cos(angle + math.pi / 6),
                             end_y - arrow_size * math.sin(angle + math.pi / 6))
                painter.drawPolygon([p1, p2, p3])

            max_arrow_len = min(box_w, box_h) / 2 - 20

            # use the local, thread-safe cached axes
            a = self._axes

            # Left stick arrow (a[0], a[1])
            cx, cy = box_w * 0.5, box_h * 0.5
            draw_arrow(cx, cy, -a[4], -a[5], max_arrow_len)

        finally:
            painter.end()