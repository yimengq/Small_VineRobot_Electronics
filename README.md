# Board Design for Vine Robot:

## Overview:
### Gen 1 Board:
- Initially split into 4 total boards, 2 on outside for Sensing board + Power Module, and 2 on inside for POE communication board
- The external tip sensing board is designed based on ESP32 XIAO

### Gen 2 Board:


### Instructions  
To view video stream from ESP32-S3. 
- Follow instructions in ```Software/SoftwareSetup.txt``` to set up the ESP32-S3 and ESP32-EVB as a Wifi access point (Eth2Ap). 
- Upload ```Software/Arduino/CameraWebServer/CameraWebServer.ino``` onto ESP32-S3. 
- Run ```Software/videostream.py``` to view live video. 

### To Do (in progress)
- Achieve 1080p @ 30fps 
- Telemetry for IMU data 
- Two way http (send commands to ESP32-S3)