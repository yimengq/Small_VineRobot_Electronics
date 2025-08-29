Pinout:
1.+3.3 V
2. +5V:
3.
4. +5V:
5.
6. GND:
7.
8.
9. GND:
10.
11.
12.
13.
14.
15.
16.
17. +3.3V
18.
19. SPI MOSI
20. GND:
21. SPI MISO
22. Data ready from IMU
23. SPI CLK
24. SPI CS
25. GND:
26.
27.
28.
29.
30. GND:
31
32.
33.
34. GND:
35.
36.
37.
38.
39. GND:
40.


InertialSense Rugged3 IMU Setup:
    1. Download the InertialSense EvalTool and install it on a Windows Computer
    2. Plug in the Rugged3 and connect in the "Settings" tab under "Device Ports"
    3. Still in the "Settings" tab,  under "General", find the "platformConfig" section and select the configuration you want.

    UART:
    4. For UART communication, check the rest of the settings in "ioConfig" and make sure the desired pins are free (S0-TTL should be enabled by default)
    5. In the "Data Sets" Tab, find the "DID_FLASH_CONFIG" settings on the left side and set the desired serial channel baud rate.
    6. To verify that UART is working, plug in the IMU using a USB TTY and it should show up in the device ports page.


    SPI:
    4. To enable SPI, ensure that the "SPI Enable" box under "G5-G8" is checked.
    5. Check the "SPI Data Ready" box under "G9". 
    6. Make sure G9 is pulled low at boot to enable SPI