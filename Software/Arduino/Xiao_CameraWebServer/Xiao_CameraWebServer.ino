#include <Wire.h>
#include "esp_camera.h"
#include <WiFi.h>
#include "imu_function.h"
#include <ESP32Servo.h>

//
// WARNING!!! PSRAM IC required for UXGA resolution and high JPEG quality
//            Ensure ESP32 Wrover Module or other board with PSRAM is selected
//            Partial images will be transmitted if image exceeds buffer size
//
//            You must select partition scheme from the board menu that has at least 3MB APP space.
//            Face Recognition is DISABLED for ESP32 and ESP32-S2, because it takes up from 15
//            seconds to process single frame. Face Detection is ENABLED if PSRAM is enabled as well

// ===================
// Select camera model
// ===================
//#define CAMERA_MODEL_WROVER_KIT // Has PSRAM
// #define CAMERA_MODEL_ESP_EYE  // Has PSRAM
//#define CAMERA_MODEL_ESP32S3_EYE // Has PSRAM
//#define CAMERA_MODEL_M5STACK_PSRAM // Has PSRAM
//#define CAMERA_MODEL_M5STACK_V2_PSRAM // M5Camera version B Has PSRAM
//#define CAMERA_MODEL_M5STACK_WIDE // Has PSRAM
//#define CAMERA_MODEL_M5STACK_ESP32CAM // No PSRAM
//#define CAMERA_MODEL_M5STACK_UNITCAM // No PSRAM
//#define CAMERA_MODEL_M5STACK_CAMS3_UNIT  // Has PSRAM
// #define CAMERA_MODEL_AI_THINKER // Has PSRAM
//#define CAMERA_MODEL_TTGO_T_JOURNAL // No PSRAM
#define CAMERA_MODEL_XIAO_ESP32S3 // Has PSRAM
// ** Espressif Internal Boards **
//#define CAMERA_MODEL_ESP32_CAM_BOARD
//#define CAMERA_MODEL_ESP32S2_CAM_BOARD
//#define CAMERA_MODEL_ESP32S3_CAM_LCD
//#define CAMERA_MODEL_DFRobot_FireBeetle2_ESP32S3 // Has PSRAM
//#define CAMERA_MODEL_DFRobot_Romeo_ESP32S3 // Has PSRAM
#include "camera_pins.h"

// ===========================
// Enter your WiFi credentials
// ===========================
// const char *ssid = "Vcc-AP";
// const char *password = "12345678";

const char *ssid = "NETGEAR42";
const char *password = "cleverroad877";

const int ledPin = 21; // On-board LED on GPIO21
int ledState = 0;

imu_function imu_func;

extern Servo myServo1;  // Create servo object
extern Servo myServo2;  // Create servo object
const int servoPin1 = 1;  // GPIO pin for the servo signal (adjust as needed)
const int servoPin2 = 2;  // GPIO pin for the servo signal (adjust as needed)

int servoAngle1 = 0; // 0 for right, 1 for left
int servoCounter1 = 0;
int servoAngle2 = 0; // 0 for right, 1 for left
int servoCounter2 = 0;

void startCameraServer();
void setupLedFlash(int pin);


// Function to handle WiFi events
void WiFiEvent(WiFiEvent_t event) {
  switch (event) {
    case ARDUINO_EVENT_WIFI_STA_DISCONNECTED:
      Serial.println("WiFi disconnected! Attempting reconnection...");
      WiFi.begin(ssid, password);
      break;

    case ARDUINO_EVENT_WIFI_STA_CONNECTED:
      Serial.println("WiFi connected!");
      break;

    case ARDUINO_EVENT_WIFI_STA_GOT_IP:
      Serial.print("WiFi reconnected! New IP address: ");
      Serial.println(WiFi.localIP());
      break;

    default:
      break;
  }
}

void setup() {
  // Wire.begin(3, 4); //Comment out if using XIAO sense, diff SDA/SCL pins
  // Wire.begin(23, 22); //Comment out if using XIAO sense, diff SDA/SCL pins
  Wire.begin(5, 6);

  Serial.begin(115200);
  while (!Serial) delay(10);  // Wait for serial
  Serial.setDebugOutput(true);
  Serial.println();

  Serial.println("-- Full Sense Board Test --"); Serial.println("");

  imu_func.init();
  Serial.println("IMU init done");

  pinMode(ledPin, OUTPUT);
  digitalWrite(ledPin, HIGH);  // turn the LED on (HIGH is the voltage level)
  delay(1000);

  // myServo1.attach(servoPin1, 750, 2250);  // Attach the servo to the specified pin
  // myServo2.attach(servoPin2, 750, 2250);  // Attach the servo to the specified pin

  Serial.println( "   Heap: " );
  Serial.print( "      Total: " );
  Serial.println( ESP.getHeapSize() );
  Serial.print( "      Used: " );
  Serial.println( ESP.getHeapSize() - ESP.getFreeHeap() );
  Serial.print( "      Free: " );
  Serial.println( ESP.getFreeHeap() );
  Serial.println( "   PSRAM: " );
  Serial.print( "      Total: " );
  Serial.println( ESP.getPsramSize() );
  Serial.print( "      Used: " );
  Serial.println( ESP.getPsramSize() - ESP.getFreePsram() );
  Serial.print( "      Free: " );
  Serial.println( ESP.getFreePsram() );

  camera_config_t config;
  config.ledc_channel = LEDC_CHANNEL_0;
  config.ledc_timer = LEDC_TIMER_0;
  config.pin_d0 = Y2_GPIO_NUM;
  config.pin_d1 = Y3_GPIO_NUM;
  config.pin_d2 = Y4_GPIO_NUM;
  config.pin_d3 = Y5_GPIO_NUM;
  config.pin_d4 = Y6_GPIO_NUM;
  config.pin_d5 = Y7_GPIO_NUM;
  config.pin_d6 = Y8_GPIO_NUM;
  config.pin_d7 = Y9_GPIO_NUM;
  config.pin_xclk = XCLK_GPIO_NUM;
  config.pin_pclk = PCLK_GPIO_NUM;
  config.pin_vsync = VSYNC_GPIO_NUM;
  config.pin_href = HREF_GPIO_NUM;
  config.pin_sccb_sda = SIOD_GPIO_NUM;
  config.pin_sccb_scl = SIOC_GPIO_NUM;
  config.pin_pwdn = PWDN_GPIO_NUM;
  config.pin_reset = RESET_GPIO_NUM;
  config.xclk_freq_hz = 20000000;
  config.frame_size = FRAMESIZE_UXGA;
  config.pixel_format = PIXFORMAT_JPEG;  // for streaming
  //config.pixel_format = PIXFORMAT_RGB565; // for face detection/recognition
  config.grab_mode = CAMERA_GRAB_WHEN_EMPTY;
  config.fb_location = CAMERA_FB_IN_PSRAM;
  config.jpeg_quality = 12;
  config.fb_count = 1;

  // if PSRAM IC present, init with UXGA resolution and higher JPEG quality
  //                      for larger pre-allocated frame buffer.
  if (config.pixel_format == PIXFORMAT_JPEG) {
    if (psramFound()) {
      config.jpeg_quality = 10;
      config.fb_count = 2;
      config.grab_mode = CAMERA_GRAB_LATEST;
    } else {
      // Limit the frame size when PSRAM is not available
      config.frame_size = FRAMESIZE_SVGA;
      config.fb_location = CAMERA_FB_IN_DRAM;
    }
  } else {
    // Best option for face detection/recognition
    config.frame_size = FRAMESIZE_240X240;
#if CONFIG_IDF_TARGET_ESP32S3
    config.fb_count = 2;
#endif
  }

#if defined(CAMERA_MODEL_ESP_EYE)
  pinMode(13, INPUT_PULLUP);
  pinMode(14, INPUT_PULLUP);
#endif
  

  // camera init
  esp_err_t err = esp_camera_init(&config);
  if (err != ESP_OK) {
    Serial.printf("Camera init failed with error 0x%x", err);
    // return;
    delay(1000);
  }

  sensor_t *s = esp_camera_sensor_get();
  // initial sensors are flipped vertically and colors are a bit saturated
  if (s->id.PID == OV3660_PID) {
    s->set_vflip(s, 1);        // flip it back
    s->set_brightness(s, 1);   // up the brightness just a bit
    s->set_saturation(s, -2);  // lower the saturation
  }
  // drop down frame size for higher initial frame rate
  if (config.pixel_format == PIXFORMAT_JPEG) {
    s->set_framesize(s, FRAMESIZE_QVGA);
  }

#if defined(CAMERA_MODEL_M5STACK_WIDE) || defined(CAMERA_MODEL_M5STACK_ESP32CAM)
  s->set_vflip(s, 1);
  s->set_hmirror(s, 1);
#endif

#if defined(CAMERA_MODEL_ESP32S3_EYE)
  s->set_vflip(s, 1);
#endif

// Setup LED FLash if LED pin is defined in camera_pins.h
#if defined(LED_GPIO_NUM)
  setupLedFlash(LED_GPIO_NUM);
#endif

  WiFi.begin(ssid, password);
  WiFi.setSleep(false);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  WiFi.onEvent(WiFiEvent);
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.print("IP Address: ");
  Serial.println(WiFi.localIP());

  startCameraServer();

  Serial.print("Camera Ready! Use 'http://");
  Serial.print(WiFi.localIP());
  Serial.println("' to connect");
}

void loop() {
  imu_func.update();
  delay(1000);
  digitalWrite(ledPin, ledState);  // turn the LED on (HIGH is the voltage level)
  ledState = ~ledState;
  // if(servoCounter == 5){
  //   servoCounter = 0;
  //   if(servoAngle == 0){
  //     Serial.println("Moving right...");
  //     myServo.write(servoAngle);
  //     servoAngle = 180;
  //   }
  //   else if(servoAngle == 180){
  //     Serial.println("Moving left...");
  //     myServo.write(servoAngle);
  //     servoAngle = 0;
  //   }
  //   else{
  //     servoAngle = 0;
  //   }
  // }
  // else{
  //   servoCounter += 1;
  // }
  // delay(10000);
  Serial.print("Camera Ready! Use 'http://");
  Serial.print(WiFi.localIP());
  Serial.println("' to connect");
}
