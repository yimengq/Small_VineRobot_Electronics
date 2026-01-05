#include <ESP32Servo.h>

Servo myServo;  // Create servo object
const int servoPin = 7;  // GPIO pin for the servo signal (adjust as needed)
int servoAngle = 0; // 0 for right, 1 for left

void setup() {
    Serial.begin(115200);
    while (!Serial) delay(10);  // Wait for serial
    Serial.setDebugOutput(true);
    Serial.println("Starting motor test...");
    myServo.attach(servoPin, 750, 2250);  // Attach the servo to the specified pin
    // Serial.println("Enter an angle between 0 and 180:");
}

void loop() {
    // if (Serial.available()) {
    //     String input = Serial.readStringUntil('\n'); // Read input until newline
    //     int angle = input.toInt(); // Convert input to integer
        
    //     if (angle >= 0 && angle <= 180) {
    //         myServo.write(angle);
    //         Serial.print("Moved servo to: ");
    //         Serial.println(angle);
    //     } else {
    //         Serial.println("Invalid input. Enter a value between 0 and 180.");
    //     }
    // }
    
    if(servoAngle == 0){
      Serial.println("Moving right...");
      myServo.write(servoAngle);
      servoAngle = 180;
    }
    else if(servoAngle == 180){
      Serial.println("Moving left...");
      myServo.write(servoAngle);
      servoAngle = 0;
    }
    else{
      servoAngle = 0;
    }
    delay(5000);
}