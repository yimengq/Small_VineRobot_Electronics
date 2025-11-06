import cv2

RADXA_IP       = "192.168.1.49"     # <-- change me if needed
CAM2_PORT      = 8080
CAM_URL = f"http://{RADXA_IP}:{CAM2_PORT}/"

# Open the stream
cap = cv2.VideoCapture(CAM_URL)

if not cap.isOpened():
    print("Error: Could not open stream.")
    exit()

while True:
    ret, frame = cap.read()
    if not ret:
        print("Failed to grab frame.")
        break

    cv2.imshow("Radxa Stream", frame)

    # Press 'q' to quit
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
