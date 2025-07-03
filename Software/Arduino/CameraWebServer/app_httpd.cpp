// Copyright 2015-2016 Espressif Systems (Shanghai) PTE LTD
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
#include "esp_http_server.h"
#include "esp_timer.h"
#include "esp_camera.h"
#include "img_converters.h"
#include "fb_gfx.h"
#include "esp32-hal-ledc.h"
#include "sdkconfig.h"
#include "camera_index.h"
#include <ESP32Servo.h>

#define MIN(a, b) ((a) < (b) ? (a) : (b))

#define PART_BOUNDARY "123456789000000000000987654321"
static const char *_STREAM_CONTENT_TYPE = "multipart/x-mixed-replace;boundary=" PART_BOUNDARY;
static const char *_STREAM_BOUNDARY = "\r\n--" PART_BOUNDARY "\r\n";
static const char *_STREAM_PART = "Content-Type: image/jpeg\r\nContent-Length: %u\r\nX-Timestamp: %d.%06d\r\n\r\n";

typedef struct {
  httpd_req_t *req;
  size_t len;
} jpg_chunking_t;

httpd_handle_t server = NULL;

// temp test function -> TODO: implement and move to separate file, e.g. peripherals.cpp
void command_servo(int angle) {
  Serial.printf("Servo moving %d degrees\n", angle); 
}


/* Read http servo request and command servo if angle is valid. */
esp_err_t servo_handler(httpd_req_t *req)
{
    char content[8];
    size_t recv_size = MIN(req->content_len, sizeof(content));
    int ret = httpd_req_recv(req, content, recv_size);

    if (ret <= 0) {  
        if (ret == HTTPD_SOCK_ERR_TIMEOUT) {  // check for timeout
            httpd_resp_send_408(req);
        }
        return ESP_FAIL;
    }

    content[ret] = '\0'; 
    int angle = atoi(content); 

    if (angle < 0 || angle > 180) {  // verify angle 
      httpd_resp_send_err(req, HTTPD_400_BAD_REQUEST, "Requested angle must be 0-180");
      return ESP_FAIL;
    }

    command_servo(angle);  // move servo 
    httpd_resp_sendstr(req, "OK");
    return ESP_OK;
}


/* Send IMU and ToF data */
esp_err_t telemetry_handler(httpd_req_t *req) {
  httpd_resp_set_type(req, "text/event-stream");
  httpd_resp_set_hdr(req, "Cache-Control", "no-cache");
  httpd_resp_set_hdr(req, "Access-Control-Allow-Origin", "*");

  char buf[700];

  while (true) {
    // COMMENTED OUT since IMU/ToF not mounted 
    // imu::Vector<3> accel = bno.getVector(Adafruit_BNO055::VECTOR_ACCELEROMETER);
    // imu::Vector<3> mag   = bno.getVector(Adafruit_BNO055::VECTOR_MAGNETOMETER);
    // imu::Vector<3> gyro  = bno.getVector(Adafruit_BNO055::VECTOR_GYROSCOPE);
    // imu::Vector<3> euler = bno.getVector(Adafruit_BNO055::VECTOR_EULER);
    // imu::Vector<3> lin   = bno.getVector(Adafruit_BNO055::VECTOR_LINEARACCEL);
    // imu::Vector<3> grav  = bno.getVector(Adafruit_BNO055::VECTOR_GRAVITY);
    // int8_t temp = bno.getTemp();
    // int tof_dist = tof.dist();  

    snprintf(buf, sizeof(buf),
    "{"
    "\"euler\":[%.2f,%.2f,%.2f],"
    "\"accel\":[%.2f,%.2f,%.2f],"
    "\"gyro\":[%.2f,%.2f,%.2f],"
    "\"mag\":[%.2f,%.2f,%.2f],"
    "\"lin\":[%.2f,%.2f,%.2f],"
    "\"grav\":[%.2f,%.2f,%.2f],"
    "\"temp\":%d,"
    "\"tof\":%d"
    "}\n\n",
    // COMMENTED OUT since IMU/ToF not mounted 
    // euler.x(), euler.y(), euler.z(),
    // accel.x(), accel.y(), accel.z(),
    // gyro.x(), gyro.y(), gyro.z(),
    // mag.x(), mag.y(), mag.z(),
    // lin.x(), lin.y(), lin.z(),
    // grav.x(), grav.y(), grav.z(),
    // temp,
    // tof_distance_mm,                

    // Placeholder data 
    57.62, 88.93, 12.74, 
    0.22, 0.56, 0.33,
    0.05, 0.03, 0.13,
    1.12, 2.13, 0.54,
    0.51, 0.32, 0.22, 
    0.01, 8.77, 0.22,
    45,
    37
  );

    if (httpd_resp_send_chunk(req, buf, strlen(buf)) != ESP_OK)
      break;

    vTaskDelay(pdMS_TO_TICKS(10));  // stream at 100 Hz (adjust to match IMU/ToF freq.)
    Serial.println("Successfully sent last chunk"); 
  }

  httpd_resp_send_chunk(req, NULL, 0);  
  return ESP_OK;
}


/* MJPEG streaming. Read camera frames, JPEG compression (if not done), send over http */
static esp_err_t stream_handler(httpd_req_t *req) {
  camera_fb_t *fb = NULL;
  struct timeval _timestamp;
  esp_err_t res = ESP_OK;
  size_t _jpg_buf_len = 0;
  uint8_t *_jpg_buf = NULL;
  char *part_buf[128];

  res = httpd_resp_set_type(req, _STREAM_CONTENT_TYPE);
  if (res != ESP_OK) {
    return res;
  }

  httpd_resp_set_hdr(req, "Access-Control-Allow-Origin", "*");
  httpd_resp_set_hdr(req, "X-Framerate", "60");

  while (true) {
    fb = esp_camera_fb_get();
    if (!fb) {
      log_e("Camera capture failed");
      res = ESP_FAIL;
    } else {
      _timestamp.tv_sec = fb->timestamp.tv_sec;
      _timestamp.tv_usec = fb->timestamp.tv_usec;
      if (fb->format != PIXFORMAT_JPEG) {
        bool jpeg_converted = frame2jpg(fb, 80, &_jpg_buf, &_jpg_buf_len);
        esp_camera_fb_return(fb);
        fb = NULL;
        if (!jpeg_converted) {
          log_e("JPEG compression failed");
          res = ESP_FAIL;
        }
      } else {
        _jpg_buf_len = fb->len;
        _jpg_buf = fb->buf;
      }
    }
    if (res == ESP_OK) {
      res = httpd_resp_send_chunk(req, _STREAM_BOUNDARY, strlen(_STREAM_BOUNDARY));
    }
    if (res == ESP_OK) {
      size_t hlen = snprintf((char *)part_buf, 128, _STREAM_PART, _jpg_buf_len, _timestamp.tv_sec, _timestamp.tv_usec);
      res = httpd_resp_send_chunk(req, (const char *)part_buf, hlen);
    }
    if (res == ESP_OK) {
      res = httpd_resp_send_chunk(req, (const char *)_jpg_buf, _jpg_buf_len);
    }
    if (fb) {
      esp_camera_fb_return(fb);
      fb = NULL;
      _jpg_buf = NULL;
    } else if (_jpg_buf) {
      free(_jpg_buf);
      _jpg_buf = NULL;
    }
    if (res != ESP_OK) {
      log_e("Send frame failed");
      break;
    }
  }
  return res;
}


/* Init camera server for video streaming 
 * stream_uri => MJPEG streaming to user 
 * servo_uri => receive servo commands from user 
*/
void startCameraServer() {
  httpd_config_t config = HTTPD_DEFAULT_CONFIG();
  config.max_uri_handlers = 16;

  httpd_uri_t stream_uri = {
    .uri = "/stream",
    .method = HTTP_GET,
    .handler = stream_handler,
    .user_ctx = NULL
#ifdef CONFIG_HTTPD_WS_SUPPORT
    ,
    .is_websocket = true,
    .handle_ws_control_frames = false,
    .supported_subprotocol = NULL
#endif
  };

  httpd_uri_t servo_uri = {
    .uri = "/servo", 
    .method = HTTP_POST,
    .handler = servo_handler, 
    .user_ctx = NULL
  };

  httpd_uri_t telemetry_uri = {
    .uri = "/telemetry", 
    .method = HTTP_GET, 
    .handler = telemetry_handler,
    .user_ctx = NULL
  };

  if (httpd_start(&server, &config) == ESP_OK) {
    httpd_register_uri_handler(server, &stream_uri);
    httpd_register_uri_handler(server, &servo_uri);
    httpd_register_uri_handler(server, &telemetry_uri);
  }
}
