
import numpy as np
import time
import rospy
from sensor_msgs.msg import Joy
from tmotor_serial_control.servo_serial import *
import serial  # <-- Add this to handle UART

cur_vel = 0
pressure = 0.0
v_max = 55
v_min = -55

PRESSURE_UART_PATH = "/dev/serial/by-id/usb-Silicon_Labs_CP2104_USB_to_UART_Bridge_Controller_02857388-if00-port0"
MOTOR_UART_PATH    = "/dev/serial/by-id/usb-1a86_USB_Serial-if00-port0"
# Initialize the serial port for pressure data
uart = serial.Serial(PRESSURE_UART_PATH, 115200, timeout=1)  # Change port/baud if needed

def joy_callback(data, motor):
    global cur_vel, pressure

    print(data)

    raw_vel = data.axes[3]
    vel = v_min + v_max * (raw_vel + 1)
    cur_vel = vel

    # # --- Pressure control ---
    if data.buttons[3]:
        pressure += 0.05
    elif data.buttons[1]:  
        pressure -= 0.05

    # Cap pressure between 0 and 2
    pressure = max(0.0, min(2.0, pressure))


    # --- Send pressure data ---
    uart.write(f"{pressure:.2f}\n".encode())  # Limit to 2 decimal places
    print(f"Pressure: {pressure:.2f}")

Servo_Params_Serial = {
    'AK80-64': {
        'Type' : 'AK80-64',
        'P_min' : -12.5,
        'P_max' : 12.5,
        'V_min' : v_min - 1,
        'V_max' : v_max + 1,
        'Curr_min' : -15.0,
        'Curr_max' : 15.0,
        'Temp_max' : 40.0,
        'Kt': 0.115,
        'GEAR_RATIO': 80,
        'NUM_POLE_PAIRS' : 21
    }
}

def main():
    global cur_vel
    rospy.init_node('joy_listener', anonymous=True)
    motor = TMotorManager(port=MOTOR_UART_PATH, baud=961200, motor_params=Servo_Params_Serial['AK80-64'], max_mosfett_temp=80)
    motor.__enter__()
    motor.enter_velocity_control()
    motor.set_zero_position()
    motor.update()

    rospy.Subscriber("joy", Joy, joy_callback, motor)

    while not rospy.is_shutdown():
        motor.set_output_velocity_radians_per_second(cur_vel)
        motor.update()

if __name__ == '__main__':
    main()
