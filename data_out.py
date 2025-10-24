#!/usr/bin/env python3

import subprocess
from vpython import box, vector, rate, radians
import math
import socket
import time

HOST = "192.168.1.17"  # ← Replace with your Mac’s IP
PORT = 6000
port_command = "ls /dev/ttyACM*"
path_command ="/home/radxa/Small_VineRobot_Electronics/inertial-sense-sdk/ExampleProjects/ISComm/build/"

# def set_orientation(roll, pitch, yaw):
#     # Convert to radians
#     roll = radians(roll)
#     pitch = radians(pitch)
#     yaw = radians(yaw)

#     # Direction vectors based on yaw-pitch-roll rotation order (Z-Y-X)
#     # Rotation matrices combined manually:
#     x_axis = vector(
#         math.cos(yaw)*math.cos(pitch),
#         math.sin(yaw)*math.cos(pitch),
#         -math.sin(pitch)
#     )
#     y_axis = vector(
#         math.cos(yaw)*math.sin(pitch)*math.sin(roll) - math.sin(yaw)*math.cos(roll),
#         math.sin(yaw)*math.sin(pitch)*math.sin(roll) + math.cos(yaw)*math.cos(roll),
#         math.cos(pitch)*math.sin(roll)
#     )
    
#     cube.axis = x_axis      # "axis" defines the cube's forward direction
#     cube.up = y_axis        # "up" defines the cube's upward direction


# finding correct port (becuase it seems to change for some reason)
ports = subprocess.getoutput(port_command)
print(ports) #should only print out one port

# ports = subprocess.run("cd " + path_command)
# ports = subprocess.run("make")

process = subprocess.Popen(
    [path_command+"ISCommExample", ports],  # Path to your compiled C++ executable
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
    text=True,  # Decode stdout/stderr as text
    bufsize=1,  # Line-buffered output
    universal_newlines=True # Ensure consistent newline handling
)

#socket time 
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((HOST, PORT))
print("Connected to server")

# cube = box(color=vector(0,0,1))
while True:
    line = process.stdout.readline()
    # print(line)
    # print time as well probably
    
    #for future use 
    euler_list= line.split()
    roll = euler_list[0]
    pitch =euler_list[1]
    yaw = euler_list[2]
    
    s.sendall(line.encode())

# if KeyboardInterrupt:
#     print("done")

# subprocess.run()


# visualize the angle 
