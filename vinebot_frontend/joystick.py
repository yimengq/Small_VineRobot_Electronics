import numpy as np
import time
import rospy
from sensor_msgs.msg import Joy

def joy_callback(data):

    print(data)

def main():
    rospy.init_node('joy_listener', anonymous=True)
    rospy.Subscriber("joy", Joy, joy_callback)
    rospy.spin()  # Keeps the node running and listening    


if __name__ == '__main__':
    main()
