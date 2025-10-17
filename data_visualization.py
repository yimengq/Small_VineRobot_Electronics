from vpython import box, vector, color, radians, rate
import math
import socket
import matplotlib.pyplot as plt


# to generate real time graphics, I'm sending info from radxa to computer
HOST = "0.0.0.0"  
PORT = 6000     
TEST = True;  
x_plot = 20


def set_orientation(obj, roll, pitch, yaw):
    # Convert to radians
    roll = radians(roll)
    pitch = radians(pitch)
    yaw = radians(yaw)

    x_axis = vector(
        math.cos(yaw)*math.cos(pitch),
        math.sin(yaw)*math.cos(pitch),
        -math.sin(pitch)
    )
    y_axis = vector(
        math.cos(yaw)*math.sin(pitch)*math.sin(roll) - math.sin(yaw)*math.cos(roll),
        math.sin(yaw)*math.sin(pitch)*math.sin(roll) + math.cos(yaw)*math.cos(roll),
        math.cos(pitch)*math.sin(roll)
    )
    
    obj.axis = x_axis     
    obj.up = y_axis        


#declaring socket 
if not TEST:
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind((HOST, PORT))
    s.listen(1)
    print(f"Listening on {HOST}:{PORT} ...")
    conn, addr = s.accept()
    print(f"Connected by {addr}")

#declaring 3d visual
imu = box(pos=vector(0, 0, 1), length=1, height=0.5, width=1.5, color=color.cyan)

#matplot declaration 
plt.ion()
fig, axs = plt.subplots(3)
titles = ['Roll (°)', 'Pitch (°)', 'Yaw (°)']

for ax, title in zip(axs, titles):
    line, = ax.plot([], [], lw=2)
    ax.set_xlim(0, 10)
    ax.set_ylim(-180, 180)
    ax.set_ylabel(title)
axs[-1].set_xlabel('Time (s)')

plt.pause(1)
time=[]
roll_list=[]
pitch_list=[]
yaw_list=[]

roll_graph = axs[0].plot(time,roll_list,color = 'g')[0]
pitch_graph = axs[1].plot(time,pitch_list,color = 'g')[0]
yaw_graph = axs[2].plot(time,yaw_list,color = 'g')[0]

test= 0
while True:
    rate(30)
    if not TEST:
        data = conn.recv(1024)
        if not data:
            break
        euler = data.decode()
        euler_list= euler.split()
        print(euler)
        
        #edit these so it actually makes sense 
        roll = float(euler_list[0])
        pitch = -float(euler_list[2])
        yaw = float(euler_list[1])
        # time = float(euler_list[3]) #add into the other code
    else:
        roll = 0
        pitch = math.sin(test) * 170
        yaw = 0
        test = test+1
        
        pitch_list.append(pitch)
        yaw_list.append(yaw)
        roll_list.append(roll)
        time.append(test)
        
        roll_graph.set_data(time, roll_list)
        pitch_graph.set_data(time, pitch_list)
        yaw_graph.set_data(time, yaw_list)
        
        for ax in axs:
            if (len(time) > x_plot):
                ax.set_xlim(time[len(time)-x_plot-1], time[len(time)-1])
            else:
                ax.set_xlim(time[0], time[-1])
        plt.pause(0.001)
        
    
    set_orientation(imu, pitch, yaw, roll)

conn.close()