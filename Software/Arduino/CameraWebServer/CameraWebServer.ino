#include <Wire.h>
#include "esp_camera.h"
#include <WiFi.h>
#include "imu_function.h"
#include <ESP32Servo.h>

// ===================
// Camera model
// ===================
#define CAMERA_MODEL_XIAO_ESP32S3  // Has PSRAM
#include "camera_pins.h"

// ===========================
// WiFi credentials
// ===========================
// const char *ssid = "M";
// const char *password = "12345678";

const char *ssid = "NETGEAR42";
const char *password = "cleverroad877";

void startCameraServer();

// =======
// Setup Servos 
// =======
extern Servo myServo1;  
extern Servo myServo2;  
const int servoPin1 = 46;  // GPIO pin for the servo signal (adjust as needed)
const int servoPin2 = 45;  // GPIO pin for the servo signal (adjust as needed)

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
  Wire.begin(3, 4);
  Serial.begin(115200);
  while (!Serial) delay(10);  // Wait for serial
  Serial.setDebugOutput(true);
  delay(1000);

  imu_init();
  
  myServo1.setPeriodHertz(50);
  myServo1.attach(46);
  myServo2.setPeriodHertz(50);
  myServo2.attach(45);
  

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
  config.xclk_freq_hz = 24000000;
  config.frame_size = FRAMESIZE_HD;      // resolution, FHD=1920x1080
  config.pixel_format = PIXFORMAT_JPEG;  // for streaming
  config.grab_mode = CAMERA_GRAB_LATEST;
  config.fb_location = CAMERA_FB_IN_PSRAM;
  config.jpeg_quality = 12;
  config.fb_count = 2;

  // camera init
  esp_err_t err = esp_camera_init(&config);
  if (err != ESP_OK) {
    Serial.printf("Camera init failed with error 0x%x", err);
    return;
  }

  sensor_t *s = esp_camera_sensor_get();

  s->set_res_raw(s, 16, 252, 2576, 1692, 0, 0, 2560, 1440, 1280, 720, true, true); // optimal 720p settings per OV5640 datasheet
  s->set_hmirror(s, 1);

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

void loop() {}
