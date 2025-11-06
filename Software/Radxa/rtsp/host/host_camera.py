import cv2

RADXA_IP = "192.168.1.64" # ensure correct radxa ip 
RTSP_URL = f"rtsp://{RADXA_IP}:8554/stream"

cap = cv2.VideoCapture(RTSP_URL)

if not cap.isOpened():
    print(f"Cannot open stream: {RTSP_URL}")
    exit(1)

print("Connected to stream. Press q to quit.")

while True:
    ret, frame = cap.read()
    if not ret:
        break

    cv2.imshow("RTSP Stream", frame)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()


