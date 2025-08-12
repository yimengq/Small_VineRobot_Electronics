# receive udp video stream locally (on PC/Mac) 

gst-launch-1.0 -v \
  udpsrc address=0.0.0.0 port=5000 \
  caps="application/x-rtp,media=video,encoding-name=H264,clock-rate=90000,payload=96" ! \
  rtpjitterbuffer latency=50 ! rtph264depay ! h264parse ! avdec_h264 ! \
  autovideosink sync=false

