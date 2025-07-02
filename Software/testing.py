"""
Test script for two-way http communication with ESP32-S3. 

To view live video stream from S3:
python3 testing.py v 

To send test servo command to S3:
python3 testing.py s 
"""
import cv2
import numpy as np
import time
import requests
import sys 

URL = "http://192.168.3.2"  # replace with addr printed by CameraWebServer.ino
NUM_FRAMES = 500  # duration of livestream, can change for test purposes 


def play_livestream():
    cap = cv2.VideoCapture(URL + "/stream")
    frames = []

    # receive frames, display to window
    while len(frames) < NUM_FRAMES:
        ret, frame = cap.read()
        if not ret:
            break
        
        frames.append(frame.copy())

        cv2.imshow("ESP32 Camera", frame) 
        if cv2.waitKey(1) == ord('q'):
            break
          
            
    cap.release()
    cv2.destroyAllWindows()

    # TO DO: implement video save (write to np array, then save)
    # frames_np = np.stack(frames, axis=0)
    # frames_np.shape
    return


def test_servo_command(): 
    res = requests.post(URL + "/servo", data="90")  # example 90 deg servo command
    print(res.text)
    return
    

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 script.py [v|s]")
        return

    opt = sys.argv[1]
    if opt == "v":
        play_livestream(); 
    elif opt == "s":
        test_servo_command(); 
    return

if __name__ == "__main__": 
    main()
