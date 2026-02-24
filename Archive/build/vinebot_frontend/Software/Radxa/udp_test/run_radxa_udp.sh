#!/bin/bash
# run_udp_stream.sh
# Usage: ./run_udp_stream.sh <MAC_IP>

if [ -z "$1" ]; then
  echo "Usage: $0 <MAC_IP>"
  exit 1
fi

MAC_IP=$1

gst-launch-1.0 -v \
  v4l2src device=/dev/video0 ! \
  video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 ! \
  videoscale ! video/x-raw,format=NV12,width=1920,height=1088 ! \
  mpph264enc rc-mode=cbr bps=12000000 gop=60 ! \
  h264parse config-interval=-1 ! rtph264pay pt=96 ! \
  udpsink host=$MAC_IP port=5000 sync=false async=false

