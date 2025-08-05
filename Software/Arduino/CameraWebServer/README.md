#Instructions  

###Required Hardware 
- Xiao ESP32-S3 
- BNO055 IMU (I2C wiring to ESP32) 
- OV5640 Camera Module
- Olimex board to use as WiFi access point
- Servo. To actuate the servo, wire to ESP32-S3 and define servo pins in  
`app_httpd.cpp`. Modify `command_servo()` function.   

###Software Setup 
First, setup the Olimex board as a Wifi AP for the ESP32 to connect to,  
following instructions in `Software/SoftwareSetup.txt`. Update the wifi  
credentials in `CameraWebserver.ino`. 

Upload `CameraWebServer.ino` to ESP-32 using Arduino IDE. Open the Serial  
monitor, the ESP-32 IP address should print out.  

Reference `Software/testing.py` to see how to view the videostream using  
cv2. The video is accessed at `http://<IP_addr>:81/stream`. IMU telemetry  
is accessible at `http://<IP_addr>/telemetry` and servo commands can be  
sent via HTTP post to `http://<IP_addr>/servo`. Again, see  
`Software/testing.py` for example cases of each.    
