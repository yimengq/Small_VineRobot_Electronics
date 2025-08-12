### Radxa Zero 3W Instructions (Real Time Streaming)

**SSH into Radxa**  
Connect laptop to `NETGEAR42` in lab, or any other wifi access point being used for dev. If a WiFi AP is used (e.g. red olimex board), video may have poor quality and image artifacts if TX buffers have insufficient memory.    

If the Radxa is not already configured to connect to your desired WiFi, you will have to configure the network settings over [serial](https://docs.radxa.com/en/zero/zero3/radxa-os/uart). Once the Radxa is connected to the network, record its IP to ssh.  

From laptop on the same network, SSH via terminal: `ssh radxa@<ip_addr>` with password `radxa` (default password).  

**Launching video stream**  
Once ssh'd into Radxa, run the following commands. This launches launches the RTSP server.   
```
cd Small_VineRobot_Electronics/Software/Radxa/rtsp
./run_rtsp_server.sh
```  

From your laptop, modify `host.py` with the correct IP for the `RADXA_IP` variable. Then, run `python3 host.py` to view the real time video stream from the Radxa. The video stream can be accessed from other code using the RTSP url, `rtsp://<radxa_ip_addr>:8554/stream`.  

 
