#!/usr/bin/env python3

import subprocess
import math
import socket
import time

HOST = "192.168.1.17"  # ← Replace with your Mac’s IP
PORT = 6000
port_command = "ls /dev/ttyACM*"
path_command ="/home/radxa/Small_VineRobot_Electronics/"

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
# s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# s.connect((HOST, PORT))
# print("Connected to server")

# cube = box(color=vector(0,0,1))
while True:
    line = process.stdout.readline()
    print(line)
    # print time as well probably
    
    #for future use 
    # euler_list= line.split()
    # roll = euler_list[0]
    # pitch =euler_list[1]
    # yaw = euler_list[2]
    
    # s.sendall(line.encode())

# if KeyboardInterrupt:
#     print("done")

# subprocess.run()


# visualize the angle 
