import cv2
import numpy as np
import time

stream_url = "http://192.168.2.3/stream"  # replace with addr printed by CameraWebServer.ino
cap = cv2.VideoCapture(stream_url)

frames = []
frame_limit = 6000  # limit for test purposes


# receive frames, display to window, and record to np array 
while len(frames) < frame_limit:
    ret, frame = cap.read()
    if not ret:
        break
    
    frames.append(frame.copy())
    # print(f"Captured frame {len(frames)} shape: {frame.shape}")

    cv2.imshow("ESP32 Camera", frame) 
    if cv2.waitKey(1) == ord('q'):
        break
      
        
cap.release()
cv2.destroyAllWindows()

# frames_np = np.stack(frames, axis=0)
# frames_np.shape