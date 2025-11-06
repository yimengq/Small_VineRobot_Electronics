#!/usr/bin/env python3

import subprocess
import socket
import time

HOST = "0.0.0.0"  # fake IP
PORT = 6020
port_command = "ls /dev/ttyACM*"
path_command ="/home/radxa/Small_VineRobot_Electronics/inertial-sense-sdk/ExampleProjects/ISComm/build/"

# subprocess to handle imu c++ code
ports = subprocess.getoutput(port_command)
print(ports) #should only print out one port

process = subprocess.Popen(
    [path_command+"ISCommExample", ports],  # Path to your compiled C++ executable
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
    text=True,  # Decode stdout/stderr as text
    bufsize=1,  # Line-buffered output
    universal_newlines=True # Ensure consistent newline handling
)

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server_socket.bind((HOST, PORT))
server_socket.listen(1)

print(f"Server listening on {socket.gethostbyname(socket.gethostname())}:{PORT} ...")

conn, addr = server_socket.accept()
print(f"Connected by {addr}")


while True:
    data = process.stdout.readline()
    # print(repr(data))
    conn.sendall(data.encode())

# if KeyboardInterrupt:
#     print("done")

# subprocess.run()

