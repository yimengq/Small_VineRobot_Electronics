import serial
import time
import re
import csv

# Serial port parameters — change as needed
SERIAL_PORT = '/dev/tty.usbmodem14201'     # e.g., 'COM3' on Windows, '/dev/ttyUSB0' on Linux/Mac
#SERIAL_PORT = '/dev/tty.usbmodem159405501'  
BAUD_RATE = 115200

# Number of samples to use for bias calibration
CALIBRATION_SAMPLES = 100

def main():
    ser = serial.Serial(SERIAL_PORT, BAUD_RATE, timeout=1)
    time.sleep(2)  # wait for Arduino to reset and start sending data

    # Regex to parse your Arduino line
    pattern = re.compile(
        r'Accel \(m/s\^2\): X=([-+]?\d*\.\d+|[-+]?\d+) Y=([-+]?\d*\.\d+|[-+]?\d+) Z=([-+]?\d*\.\d+|[-+]?\d+)\s*\|\s*Gyro \(dps\): X=([-+]?\d*\.\d+|[-+]?\d+) Y=([-+]?\d*\.\d+|[-+]?\d+) Z=([-+]?\d*\.\d+|[-+]?\d+)'
    )

    # pattern = re.compile(
    #     r'Gyroscope \(dps\) - X:\s*([-+]?\d*\.\d+|[-+]?\d+)\s+Y:\s*([-+]?\d*\.\d+|[-+]?\d+)\s+Z:\s*([-+]?\d*\.\d+|[-+]?\d+)'
    # )

    print(f"Calibrating gyro bias over {CALIBRATION_SAMPLES} samples...")
    gx_bias = 0.0
    gy_bias = 0.0
    gz_bias = 0.0

    calib_count = 0
    while calib_count < CALIBRATION_SAMPLES:
        line = ser.readline().decode('utf-8').strip()
        if not line:
            continue
        match = pattern.match(line)
        if match:
            gx_bias += float(match.group(4))
            gy_bias += float(match.group(5))
            gz_bias += float(match.group(6))
            # gx_bias += float(match.group(1))
            # gy_bias += float(match.group(2))
            # gz_bias += float(match.group(3))
            calib_count += 1

    gx_bias /= CALIBRATION_SAMPLES
    gy_bias /= CALIBRATION_SAMPLES
    gz_bias /= CALIBRATION_SAMPLES
    print(f"Calibration done:")
    print(f"  gx_bias = {gx_bias:.4f} dps")
    print(f"  gy_bias = {gy_bias:.4f} dps")
    print(f"  gz_bias = {gz_bias:.4f} dps\n")

    angle_x, angle_y, angle_z = 0.0, 0.0, 0.0
    prev_time = time.time()
    ax = 0.0
    ay = 0.0
    az = 0.0

    duration = 330  # duration in seconds
    start_time = time.time()
    dt = 0.1 
    t = 0
    print(f"Starting angle integration for {duration} seconds...")
    with open('y_neg45.csv', 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['Time', 'X', 'Y', 'Z'])  # Header

        while time.time() - start_time < duration:
            line = ser.readline().decode('utf-8').strip()
            if not line:
                continue
            match = pattern.match(line)
            if not match:
                continue
            
            # gx_raw = float(match.group(4))
            # gy_raw = float(match.group(5))
            # gz_raw = float(match.group(6))

            # gx_raw = float(match.group(1))
            # gy_raw = float(match.group(2))
            # gz_raw = float(match.group(3))

            gx_raw = float(match.group(4))
            gy_raw = float(match.group(5))
            gz_raw = float(match.group(6))

            gx = gx_raw - gx_bias
            gy = gy_raw - gy_bias
            gz = gz_raw - gz_bias

            angle_x += gx * dt
            angle_y += gy * dt
            angle_z += gz * dt

            print(f"Angle (deg): X={angle_x:.2f}, Y={angle_y:.2f}, Z={angle_z:.2f}")
            writer.writerow([t, angle_x, angle_y, angle_z])
            t += 0.1

    ser.close()

if __name__ == "__main__":
    main()
