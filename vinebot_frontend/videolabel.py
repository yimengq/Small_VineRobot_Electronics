from PySide6.QtWidgets import QLabel
from PySide6.QtCore import Signal
import os
os.environ["QT_API"] = "pyside6"

from joystickdisplay import JoystickDisplay

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