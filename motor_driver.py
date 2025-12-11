


import busio
import board
import time
import adafruit_mcp4725 # sudo pip3 install adafruit-circuitpython-mcp4725\
from cedargrove_nau7802 import NAU7802 #pip3 install cedargrove-nau7802

from periphery import PWM #sudo apt-get install python3-periphery

def zero_channel():
    """Initiate internal calibration for current channel.Use when scale is started,
    a new channel is selected, or to adjust for measurement drift. Remove weight
    and tare from load cell before executing."""
    print(
        "channel {0:1d} calibrate.INTERNAL: {1:5s}".format(
            nau7802.channel, str(nau7802.calibrate("INTERNAL"))
        )
    )
    print(
        "channel {0:1d} calibrate.OFFSET:   {1:5s}".format(
            nau7802.channel, str(nau7802.calibrate("OFFSET"))
        )
    )
    print(f"...channel {nau7802.channel:1d} zeroed")


def read_raw_value(samples=2):
    """Read and average consecutive raw sample values. Return average raw value."""
    sample_sum = 0
    sample_count = samples
    while sample_count > 0:
        while not nau7802.available():
            pass
        sample_sum = sample_sum + nau7802.read()
        sample_count -= 1
    return int(sample_sum / samples)



i2c = busio.I2C(board.SCL, board.SDA) # i remmeber this is different for radxa 
nau7802 = NAU7802(board.I2C(), address=0x2A, active_channels=2)
dac = adafruit_mcp4725.MCP4725(i2c)

pwmchip = int(input("pwmchip:")) 
channel = int(input("channel:"))
pwm = PWM(pwmchip, channel)
pwm = PWM(pwmchip, channel) # do this for both pwm
try: 
    pwm.frequency = 10000 
    pwm.duty_cycle = 0.00 
    pwm.enable()
except:
    print("error setting freq")

#set as low for both
DRV_write_addr = 0x60
DRV_read_addr = 0x61
CONFIG0 = 0x09
CONFIG3 = 0x0C
CONFIG4 = 0x0D

# If the bus is available, then lock it
while not i2c.try_lock():
    pass    # Wait until lock is acquired

print("Scanning the I2C")
while (1):
    j = i2c.scan()
    if (len(j)):
        list = i2c.scan()
        print(list)
        for item in list:
            print(hex(item))
    else:
        print(i2c.scan())
        print (".", end="")
        
        
        
print("*** Instantiate and calibrate load cells")
# Enable NAU7802 digital and analog power
enabled = nau7802.enable(True)
print("Digital and analog power enabled:", enabled)

print("REMOVE WEIGHTS FROM LOAD CELLS")
time.sleep(3)

nau7802.channel = 1
zero_channel()  # Calibrate and zero channel
nau7802.channel = 2
zero_channel()  # Calibrate and zero channel

print("READY")

read_buffer = bytearray(7)        
# CONFIG0 for en out 
i2c.writeto_then_readfrom(DRV_write_addr, bytearray([CONFIG0, 0]), read_buffer)  
write_byte = read_buffer | 0b10000000
i2c.writeto(DRV_write_addr, bytearray([CONFIG0, write_byte]))  

# CONFIG3 for IMODE
i2c.writeto_then_readfrom(DRV_write_addr, bytearray([CONFIG3, 0]), read_buffer)  
write_byte = read_buffer | 0b11000000
i2c.writeto(DRV_write_addr, bytearray([CONFIG3, write_byte]))  

# CONFIG4 for I2C-BC and PMODE
i2c.writeto_then_readfrom(DRV_write_addr, bytearray([CONFIG4, 0]), read_buffer)  
write_byte = read_buffer | 0b00001100
i2c.writeto(DRV_write_addr, bytearray([CONFIG4, write_byte]))  
        
# i2c.writeto_then_readfrom(LT8491_ADDR, bytearray([0x09, 0]), result) # CONFIG0 for en out 

dac.value = 32767
while True:
    print("=====")
    nau7802.channel = 1
    value = read_raw_value()
    print(f"channel {nau7802.channel:1.0f} raw value: {value:7.0f}")

    nau7802.channel = 2
    value = read_raw_value()
    print(f"channel {nau7802.channel:1.0f} raw value: {value:7.0f}")