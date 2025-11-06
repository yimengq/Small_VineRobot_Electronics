#!/usr/bin/env python3

import subprocess
import socket
import time

HOST = "192.168.1.17"  # Replace with local computer’s IP
PORT = 6000
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

#socket time 
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

while True:
    try:
        s.connect((HOST, PORT))
        print("Connected successfully!")
        break 
    except (ConnectionRefusedError, OSError) as e:
        print(f"Connection failed: {e}. Retrying in 1 second...")
        time.sleep(2)

while True:
    # temp = subprocess.run(['cat', '/sys/class/thermal/thermal_zone1/temp'], capture_output=True).stdout.decode() # GPU TEMP, soc doesn't work for some reason
    line = process.stdout.readline()
    print(line)
    # s.sendall(temp.encode())

# if KeyboardInterrupt:
#     print("done")

# subprocess.run()

