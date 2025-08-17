# ./rtsp_server.py --device /dev/video0 --width 1920 --height 1080 --fps 60 --bitrate 20000000



#!/bin/bash
# Start all services: RTSP, servo server, LED server

RADXA_DEV="/dev/video0"
WIDTH=1920
HEIGHT=1080
FPS=60
BITRATE=20000000

# Start RTSP server
echo "[RTSP] Starting..."
./rtsp_server.py \
  --device "$RADXA_DEV" \
  --width $WIDTH \
  --height $HEIGHT \
  --fps $FPS \
  --bitrate $BITRATE \
  > rtsp.log 2>&1 &

# Start Servo server (port 80) – needs sudo if not using setcap
echo "[Servo] Starting..."
sudo -E python3 servo_server.py > servo.log 2>&1 &

# Start LED server (port 8080)
echo "[LED] Starting..."
python3 led_server.py > led.log 2>&1 &

echo "All servers launched. Logs: rtsp.log, servo.log, led.log"
