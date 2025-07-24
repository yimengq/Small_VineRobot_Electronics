/*
Simple test script to read accel/gyro data from ASM330LHB. 
Assumes the SDO pin is grounded, and IMU I2C addr is 0x6A. 

Prints accel/gyro data to terminal for inspection/testing.

IMU currently configured to 208Hz output (low power mode). 
+-4g for acceleromoter, +- 500dps for gyro. 
*/

#include <Wire.h>

// SDO connected to GND => I2C addr 0x6A
// SDO connected to VDD => I2C addr 0x6B
#define ASM330LHB_ADDR 0x6A 

// WHO_AM_I register for debugging / verificaton
#define WHO_AM_I_REG   0x0F
#define WHO_AM_I_EXPECTED 0x6B

// Registers
#define CTRL1_XL 0x10    // accel control
#define CTRL2_G  0x11    // gyro control 
#define CTRL3_C  0x12    // reset 
#define OUTX_L_G   0x22  // gyro x val out 
#define OUTX_L_A   0x28  // accel x val out

// I2C pins for Xiao ESP32-S3
#define I2C_SDA 5
#define I2C_SCL 6

// Sensitivity (convert raw values to known units)
const float ACC_SENSITIVITY = 0.122f / 1000.0f;  // for ±4g accel config
const float GYRO_SENSITIVITY = 17.5f / 1000.0f;  // for ±500dps gyro config

void write_reg(uint8_t reg, uint8_t value) {
  Wire.beginTransmission(ASM330LHB_ADDR);
  Wire.write(reg);
  Wire.write(value);
  Wire.endTransmission();
}

uint8_t read_reg(uint8_t reg) {
  Wire.beginTransmission(ASM330LHB_ADDR);
  Wire.write(reg);
  Wire.endTransmission(false);
  Wire.requestFrom(ASM330LHB_ADDR, 1);
  return Wire.read();
}

void read_data(uint8_t start_reg, int16_t* x, int16_t* y, int16_t* z) {
  Wire.beginTransmission(ASM330LHB_ADDR);
  Wire.write(start_reg);
  Wire.endTransmission(false);
  Wire.requestFrom(ASM330LHB_ADDR, 6); // read x,y,z (each 2bytes)

  *x = Wire.read() | (Wire.read() << 8);
  *y = Wire.read() | (Wire.read() << 8);
  *z = Wire.read() | (Wire.read() << 8);
}

void setup() {
  Serial.begin(115200);
  delay(1000);

  Wire.begin(I2C_SDA, I2C_SCL);  
  delay(50);

  // check IMU connection 
  uint8_t whoami = read_reg(WHO_AM_I_REG);
  if (whoami != WHO_AM_I_EXPECTED) {
    while (1);
  }
  Serial.println("ASM330LHB detected");

  // reset device
  write_reg(CTRL3_C, 0x01); 
  delay(100);

  // set accelerometer to 208 Hz, ±4g (low power mode)
  write_reg(CTRL1_XL, 0x58);  // b01011000

  // set gyroscope to 208 Hz, ±500 dps
  write_reg(CTRL2_G, 0x54);   // b01010100
}

void loop() {
  int16_t rax, ray, raz;
  int16_t rgx, rgy, rgz;

  read_data(OUTX_L_A, &rax, &ray, &raz);
  read_data(OUTX_L_G, &rgx, &rgy, &rgz);

  // convert raw accel values to Gs
  float ax = rax * ACC_SENSITIVITY; 
  float ay = ray * ACC_SENSITIVITY;
  float az = raz * ACC_SENSITIVITY;

  float gx = rgx * GYRO_SENSITIVITY;
  float gy = rgy * GYRO_SENSITIVITY;
  float gz = rgz * GYRO_SENSITIVITY; 

  Serial.printf("Accel [raw]: X=%.2f Y=%.2f Z=%.2f\tGyro [raw]: X=%.2f Y=%.2f Z=%.2f\n", ax, ay, az, gx, gy, gz);
  delay(500);
}
