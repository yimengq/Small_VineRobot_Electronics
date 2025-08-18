Readme file created by: Alondra Conchas-Sanchez , Summer 2025 Rotator

Please note, this setup file is meant to be used for an ESP32 WRROVER-E / ESP32 WROVER-IE mcu and a LAN8720 (maybe Lan8710 as long as it is using RMII) ethernet chip. 
The shared wifi is coming from a Windows computer running Windows 11

To start, make sure you have the following pin connections between the ESP32 and the LAN8720. The labels used here are the same as those found on the dev boards

	Pin Connection Diagram: RMII Configuration
		ESP32	 <------------->	LAN8720 Black Dev Board
		
		GPIO25 <-------------> RX0	
		GPIO26 <-------------> RX1
		GPIO19 <-------------> TX0
		GPIO22 <-------------> TX1
		GPIO21 <-------------> TX_EN
		GPIO27 <-------------> CRS		
		GPIO18 <-------------> MDIO
		GPIO23 <-------------> MDC
		GPIO0  <-------------> nINT/RETCLK

	Connect the LAN8720 to a 3.3V (not 5V) power supply via one of the VCC pins. During testing I have used an external power supply to supply 3.3V to the LAN8720 dev board.
	
	Connect the ESP32 to your computer using a microUSB cable. Make sure the microUSB cable is capable of data transfer. Most phone-charging MicroUSB cables do not have this capability. 
	If the microUSB cable is not capable of file transfer, the ESP32 will not show up as a port on your laptop
	
	Connect both boards to the same ground. You can use a breadboard or connect the two GND pins of each board together. You can use another GND pin on the ESP32 to connect to the GND on the
	power supply.
	
	Connect an ethernet cable from the RJ45 connector on the LAN8720 board to your laptop. 
	
	Turn on and check the power supply, if the current reads around 0.100 Amps and the lights on the ethernet cable are on/flashing. Then everything is powered correctly and the ethernet
	link is active. 
	
		If the current is around 0.004 amps, then the Lan8720 board is not powering on correctly and the ethernet link is not established. The LAN8720 dev board does not have a reset button or pin.
		
		
		One of the only ways I've gotten the board to power on it by disconnecting the cables from the LAN8720 board and reconnecting them. I do this in groups of two (take two cables off and then plug
		them back in). I don't know why this works, but it does. You should only have to do this once, I haven't had to do this more than once. 
	
Wifi Sharing
	
	To share wifi, windows uses a service called "internet connection sharing" (ICS). This is the service that assigns an IP address to whatever device is trying to share wifi-connection. In this 
	case, this is the service that assigns an IP adress to the ethernet cable that is sharing the wifi connection.  It will be assigned IP address 192.168.137.1 and a subnet mask of 255.255.255.0.
	You should not have to manually set the IP of the ethernet port, the ICS service will do this. (everytime I have manually set the static IP on either my laptop or phone(the connecting device) I have not been able to access
	the internet). 
	
	STEP 1:
	
	To start, when the ethernet link is active, Go to Control Panel->Network and Internet-> View Network Status and Tasks -> (top left)-> change adapter settings
	double click on the ethernet port (should be labeled "Ethernet") -> properties -> double-click the label, IPv4 (located in the check-list) -> Make sure the option
	"Obtain IP address automatically" is set. Click "Okay", "Okay", and then "Close". 
	
	STEP 2:
	In adapter settings, double click on the wifi connection you are trying to share -> properties -> click on the sharing tab at the top-> If its already shared (from previous testing or work) unshare it and click okay. Then 
	go back to the sharing and re-enable it. This just restarts the sharing so the ICS service can assign the IP properly. Click "Okay", "Okay", and the "Close". 
	
	To check that the correct IP was set, go to command prompt and type "ipconfig". This brings up a lists of active IP's. The ethernet cable should be named "Ethernet Adapter Ethernet" or something
	similar. The IP should be set to "192.168.137.1". If it is, great. If not, its possible the ICS service didn't work properly so you may need to reset it. 
	
		Type "window-key + r" and type in "services.msc" . Scroll down to "internet connection sharing" and make sure it is running and is doing so automatically. Then restart the service (button is toward the left)
		
	After restarting ICS, repeat steps 1 and 2. 
	
	Another test I do to check that the ESP32 can get an IP from the ethernet cable is by running the "basic" example from ESP-IDF in the "esp_eth" folder. I have also included the example in the github. You run the example using 
	the same steps and menuconfig file as you would with starting the WIFI AP. 
	
	Basically what this does is check your ethernet connection and tests to see if the ESP32 can obtain an IP from the ethernet cable connection. If you see a print out with some IP address numbers, something like "ETH IP: ..." 
	then the ESP32 can obtain an IP from the ethernet connection. If you do not see that printout after a few seconds of running the serial monitor, then try resetting the ESP32, LAN8720 or restarting the Internet sharing.
	In the past, resetting the ESP32 and restarting internet sharing has worked best for me. 
		
		
Once you are confident your setup is ready, you can begin to build, flash, and monitor the program needed to turn the ESP32 into a WIFI AP
		
To start, go to the project folder type in "idf.py set-target esp32" 
Once that is finished, type "idf.py menuconfig"


These are the menuconfig settings I've used that give me the best reliability I could achieve. 
		
	- Serial flasher config -> Flash Size (8 MB)
	- Example Configuration -> Ethernet Type (Internal EMAC)
		-> Ethernet PHY Device (LAN87xx)
		-> (23) SMI MDC GPIO number
		-> (18) SMI MDIO GPIO number
		-> (-1) PHY Reset GPIO number
		-> (1) PHY Address			// Make sure this is set correctly
		-> (Vcc-AP) Wi-Fi SSID		// The name can be whatever you want and so can the PW
		-> (12345678) Wi-Fi Password 
		-> (1) WiFi channel
		-> (4) Maximum STA connections
		
		
	- Component config 	
			-> ESP32-specific -> CPU frequency (240 MHz)
							  -> enable Support for external, SPI-connected RAM
			-> Ethernet -> Support ESP32 internal EMAC controller	-> PHY interface (Reduced Media Independent Interface (RMII))
										-> RMII clock mode (Input RMII clock from external)
										-> (1536) Ethernet DMA buffer size (Byte)
										-> (10) Amount of Ethernet DMA Rx buffers
										-> (10) Amount of Ethernet DMA Tx buffers
			-> HTTP Server -> [*] WebSocket server support
			-> FreeRTOS -> (1000) Tick rate (Hz)
			-> LWIP 
				-> TCP 
					-> Default recieve window size -> 16384 (used to be 5760)
					

Save the menuconfig file.
	
	I also changed two things in the "ethernet_example_main.c" file. Wifi is slower than Ethernet, so these changes were made in an effort to remove bottlenecks when sending recieving data. The code was also uploaded to the github, so you shouldn't need to make changes if you 	obtain the code from there. 
	
		Here are the changes I made. Check to see that these changes are in the main.c file
			
			*Changed the data type from uint8_t to unint64_t of the variable "buffer" in the function "pkt_eth2wifi"
			*Changed the size of the FLOW_CONTROL_QUEUE_LENGTH macro - from 200 to 500
			
Once the code and menuconfig settings are set, you can build the project using "idf.py -p COM* build". (check which COM number the ESP32 is set to by opening the device manager and checking under PORTS & COMMS. Replace the asterisk with that number)
			
After a successful build, flash the program onto the ESP32 using "idf.py -p COM* flash". Open the serial monitor using "idf.py -p COM* monitor". With the program running, you should be able to see the name of the ESP32 wifi AP on your device. Make sure to disconnect and turn 	off the "Automatically connect" settings on your known wifi networks. Also make sure to turn off your data so that you are not aided by any outside network connections. 
	
Conenct to the ESP32 wifi AP by typing in the password. Again, you should not have to set a static IP to access the internet. Everytime I've done so, I have not been able to access the internet. Your phone/device, should be able to obtain an IP address automatically upon connection. If your device is struggling to obtain an IP address. Try resetting the esp32, the LAN8720, and the ICS windows service. I've had to do this acouple of times during testing, but it has worked. 
	
	Recently, I haven't encountered too many errors when building and flashing the project. But here are some errors I've encountered when flashing
	
	- 	E (913) esp.emac: emac_esp32_init(357): reset timeout
		E (913) esp_eth: esp_eth_driver_install(214): init mac failed
		
			Have not ecountered this recently, but check that the reset pin is high during flashing,
			
	- "lan87xx power reset " or something similar, don't remember the exact error
		E (913) esp_eth: esp_eth_driver_install(214): init mac failed
		
		The LAN8720 board/chip is not booting up correctly. To solve this, I have always either power cycled the LAN8720 board and/or unplugging and replugging in the pin connections. I've had to do this a couple times and in different ways. But I have been able to clear the 		error
		
	- " wrong chip ID " in reference to the LAN8720. 
	
		- Check that you have set the right PHY address in the ESP32 menuconfig file. This error occurred and I realzied that I set the wrong PHY address. Putting the right PHY 	address cleared up the error. 
		
	
The changes to the main.c file I made were to help solve the following errors I recieved when trying to use the Wifi AP
	
	- "send flow control ..." (or something similar, again, don't rememeber exact error). 
			
			changing the value of the FLOW_CONTROL_QUEUE_LENGTH macro helped
			
	- "no mems in recieve buffer" 
		
		- changing the data type of the variable "buffer" in the function "pkt_eth2wifi" seemed to work
		
	- E (1377705) eth_example: WiFi send packet failed: 12309
		
		recieved this error as well, but it wasn't a reoccuring one. 
		
Last Notes:

During the summer, I used an ESP32 Wrover IE chip that I had to solder onto a dev board, my soldering wasn't great, so there's a possibilty my soldering job affected the performance. I believe this becuase during the last week of my fellowship, we ordered a ESP32 Wrover E dev board where the chip was already soldered onto the board. It ran very smoothly with the overall setup. The only issues I had were making sure the ethernet link was powered correctly and making sure the IP address was set correctly.

Other than that, I had no errors on the serial monitor when the wifi AP was active and the ethernet connection was stable with no disconnections.

Also, the only different between the two chips is that you can connect an external antenna to the Wrover IE and not the Wrover E. 