
import pyvista as pv
from scipy.spatial.transform import Rotation as R
import math
import socket
import numpy as np
import time
from vtkmodules.vtkCommonTransforms import vtkTransform


# to generate real time graphics, I'm sending info from radxa to computer
HOST = "192.168.1.49" 
PORT = 6020     
TEST = False;  
x_plot = 20

#declaring socket 
while True:
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    try:
        s.connect((HOST, PORT))
        print("Connected successfully!")
        break 
    except (ConnectionRefusedError, OSError) as e:
        print(f"Connection failed: {e}. Retrying in 1 second...")
        time.sleep(2)

#declaring 3d visual
plotter = pv.Plotter()
imu = pv.Cube(x_length=1, y_length=0.5, z_length=0.2)
actor = plotter.add_mesh(imu, color="cyan", show_edges=True)
plotter.show(auto_close=False, interactive=False)

test_time= 0
frames = 0 
while True:
    if not TEST:
        data = s.recv(1024)
        if not data:
            break
        euler = data.decode()
        euler_list= euler.split()
        # print(repr(euler))
        
        #edit these so it actually makes sense 
        roll = -float(euler_list[0])
        pitch = float(euler_list[1])
        yaw = -float(euler_list[2])
        # time = float(euler_list[3]) #add into the other code
    else:
        roll = 0
        pitch = math.sin(test_time) * 170
        yaw = 0
        test_time = test_time+1
    
    plotter.render()
    rot = R.from_euler('xyz', [roll, pitch, yaw], degrees=True).as_matrix()
    transform = vtkTransform()
    transform.Identity()
    transform.PostMultiply()
    transform.Concatenate([
        rot[0,0], rot[0,1], rot[0,2], 0,
        rot[1,0], rot[1,1], rot[1,2], 0,
        rot[2,0], rot[2,1], rot[2,2], 0,
        0,        0,        0,        1
    ])

    actor.SetUserTransform(transform)
    plotter.render()
    time.sleep(0.03)

        
    # if frames == 5:
    #     scene.capture(f"imu_frame.png")
    #     frames = 0;

s.close()