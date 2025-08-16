from PySide6.QtWidgets import QWidget, QVBoxLayout
from PySide6.QtCore import Signal
import numpy as np
import os
os.environ["QT_API"] = "pyside6"
from matplotlib.figure import Figure
import matplotlib
matplotlib.use("QtAgg")
from matplotlib.backends.backend_qtagg import FigureCanvasQTAgg as FigureCanvas

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