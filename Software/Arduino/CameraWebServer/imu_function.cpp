// #include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>
#include "imu_function.h"

#define IMU_JSON_BUFFER_SIZE 700

/* Set the delay between fresh samples */
uint16_t BNO055_SAMPLERATE_DELAY_MS = 100;


// Check I2C device address and correct line below (by default address is 0x29 or 0x28)
//                                   id, address
Adafruit_BNO055 bno = Adafruit_BNO055(55, 0x28, &Wire);

void printEvent(sensors_event_t* event);

void imu_init(){
    /* Initialise the sensor */
    if (!bno.begin())
    {
        /* There was a problem detecting the BNO055 ... check your connections */
        Serial.print("Ooops, no BNO055 detected ... Check your wiring or I2C ADDR!");
        while (1);
    }
}

const char* imu_update() {
    static char buf[IMU_JSON_BUFFER_SIZE];

    sensors_event_t orientation, gyro, linearAccel, mag, accel, gravity;
    bno.getEvent(&orientation, Adafruit_BNO055::VECTOR_EULER);
    bno.getEvent(&gyro, Adafruit_BNO055::VECTOR_GYROSCOPE);
    bno.getEvent(&linearAccel, Adafruit_BNO055::VECTOR_LINEARACCEL);
    bno.getEvent(&mag, Adafruit_BNO055::VECTOR_MAGNETOMETER);
    bno.getEvent(&accel, Adafruit_BNO055::VECTOR_ACCELEROMETER);
    bno.getEvent(&gravity, Adafruit_BNO055::VECTOR_GRAVITY);

    int8_t temp = bno.getTemp();
    uint8_t sys, g, a, m;
    bno.getCalibration(&sys, &g, &a, &m);

    // JSON string
    snprintf(buf, IMU_JSON_BUFFER_SIZE,
        "{"
          "\"orientation\":{\"x\":%.2f,\"y\":%.2f,\"z\":%.2f},"
          "\"gyro\":{\"x\":%.2f,\"y\":%.2f,\"z\":%.2f},"
          "\"linear_accel\":{\"x\":%.2f,\"y\":%.2f,\"z\":%.2f},"
          "\"mag\":{\"x\":%.2f,\"y\":%.2f,\"z\":%.2f},"
          "\"accel\":{\"x\":%.2f,\"y\":%.2f,\"z\":%.2f},"
          "\"gravity\":{\"x\":%.2f,\"y\":%.2f,\"z\":%.2f},"
          "\"temp\":%d,"
          "\"calib\":{\"sys\":%d,\"gyro\":%d,\"accel\":%d,\"mag\":%d}"
        "}\n\n",
        orientation.orientation.x, orientation.orientation.y, orientation.orientation.z,
        gyro.gyro.x, gyro.gyro.y, gyro.gyro.z,
        linearAccel.acceleration.x, linearAccel.acceleration.y, linearAccel.acceleration.z,
        mag.magnetic.x, mag.magnetic.y, mag.magnetic.z,
        accel.acceleration.x, accel.acceleration.y, accel.acceleration.z,
        gravity.acceleration.x, gravity.acceleration.y, gravity.acceleration.z,
        temp, sys, g, a, m
    );

    return buf;
}