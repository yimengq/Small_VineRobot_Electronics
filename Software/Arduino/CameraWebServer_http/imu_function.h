
#ifndef __IMU_FUNCTION_H__
#define __IMU_FUNCTION_H__
#include <ESP32Servo.h>
extern Servo myservo;
// class imu_function{
//     public:
//     void init();

//     const char* update();
// };

void imu_init(); 
const char* imu_update();

#endif /* __IMU_FUNCTION_H__ */
















