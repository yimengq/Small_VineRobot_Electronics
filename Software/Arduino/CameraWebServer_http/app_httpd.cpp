#include "esp_http_server.h"
#include "esp_timer.h"
#include "esp_camera.h"
#include "img_converters.h"
#include "fb_gfx.h"
#include "esp32-hal-ledc.h"
#include "sdkconfig.h"
#include "camera_index.h"
#include <ESP32Servo.h>
#include <ArduinoJson.h>
#include "imu_function.h"

#define MIN(a, b) ((a) < (b) ? (a) : (b))

#define PART_BOUNDARY "123456789000000000000987654321"
static const char *_STREAM_CONTENT_TYPE = "multipart/x-mixed-replace;boundary=" PART_BOUNDARY;
static const char *_STREAM_BOUNDARY = "\r\n--" PART_BOUNDARY "\r\n";
static const char *_STREAM_PART = "Content-Type: image/jpeg\r\nContent-Length: %u\r\nX-Timestamp: %d.%06d\r\n\r\n";

typedef struct {
  httpd_req_t *req;
  size_t len;
} jpg_chunking_t;

httpd_handle_t stream = NULL;   // :81
httpd_handle_t data = NULL;     // :80
httpd_handle_t telem = NULL;    // :82  (NEW)

Servo myServo1;
Servo myServo2;

// --- Servo command helper ---
void command_servo(uint8_t angle1, uint8_t angle2) {
  Serial.printf("Servo1 moving %d degrees\n", angle1);
  Serial.printf("Servo2 moving %d degrees\n", angle2);
  myServo1.write(angle1);
  delay(1);
  myServo2.write(angle2);
  delay(1);

}

/* ===== /servo (POST JSON) ===== */
esp_err_t servo_handler(httpd_req_t *req)
{
    // Read the FULL POST body (up to 256 bytes)
    if (req->content_len == 0 || req->content_len > 256) {
        httpd_resp_send_err(req, HTTPD_400_BAD_REQUEST, "Body too large or empty");
        return ESP_FAIL;
    }
    char content[257];
    size_t read_total = 0;
    while (read_total < req->content_len) {
        int r = httpd_req_recv(req, content + read_total, req->content_len - read_total);
        if (r <= 0) {
            if (r == HTTPD_SOCK_ERR_TIMEOUT) httpd_resp_send_408(req);
            return ESP_FAIL;
        }
        read_total += r;
    }
    content[read_total] = '\0';

    StaticJsonDocument<128> doc;
    DeserializationError error = deserializeJson(doc, content);
    if (error) {
      httpd_resp_send_err(req, HTTPD_400_BAD_REQUEST, "Bad JSON");
      return ESP_FAIL;
    }

    int s1 = doc["servo1"] | -1;
    int s2 = doc["servo2"] | -1;

    if (s1 < 0 || s1 > 180 || s2 < 0 || s2 > 180) {
      httpd_resp_send_err(req, HTTPD_400_BAD_REQUEST, "Requested angles must be 0-180");
      return ESP_FAIL;
    }

    command_servo((uint8_t)s1, (uint8_t)s2);
    httpd_resp_set_hdr(req, "Access-Control-Allow-Origin", "*");
    httpd_resp_sendstr(req, "OK");
    return ESP_OK;
}

/* ===== /telemetry (GET, SSE) ===== */
esp_err_t telemetry_handler(httpd_req_t *req) {
  // SSE headers
  httpd_resp_set_type(req, "text/event-stream");
  httpd_resp_set_hdr(req, "Cache-Control", "no-cache");
  httpd_resp_set_hdr(req, "Connection", "keep-alive");
  httpd_resp_set_hdr(req, "Access-Control-Allow-Origin", "*");

  const TickType_t tick_10ms = pdMS_TO_TICKS(10);
  uint32_t hb_ms = 0;

  while (true) {
    const char* buf = imu_update();  // should return a short, null-terminated JSON string (no newlines)
    if (buf && buf[0] != '\0') {
      if (httpd_resp_sendstr_chunk(req, "data: ") != ESP_OK) break;
      if (httpd_resp_sendstr_chunk(req, buf) != ESP_OK) break;
      if (httpd_resp_sendstr_chunk(req, "\n\n") != ESP_OK) break;
      hb_ms = 0;
    } else {
      // heartbeat comment each ~1s so proxies keep the connection alive
      if (hb_ms >= 1000) {
        if (httpd_resp_sendstr_chunk(req, ": keepalive\n\n") != ESP_OK) break;
        hb_ms = 0;
      }
    }

    vTaskDelay(tick_10ms);
    hb_ms += 10;
  }

  httpd_resp_send_chunk(req, NULL, 0);
  return ESP_OK;
}

/* ===== /stream (GET, MJPEG) ===== */
static esp_err_t stream_handler(httpd_req_t *req) {
  camera_fb_t *fb = NULL;
  struct timeval _timestamp;
  esp_err_t res = ESP_OK;
  size_t _jpg_buf_len = 0;
  uint8_t *_jpg_buf = NULL;
  char part_buf[128];  // FIXED TYPE

  res = httpd_resp_set_type(req, _STREAM_CONTENT_TYPE);
  if (res != ESP_OK) return res;

  httpd_resp_set_hdr(req, "Access-Control-Allow-Origin", "*");
  httpd_resp_set_hdr(req, "X-Framerate", "60");

  while (true) {
    // if client disconnected, break
    if (httpd_req_to_sockfd(req) == -1) break;

    fb = esp_camera_fb_get();
    if (!fb) {
      res = ESP_FAIL;
    } else {
      _timestamp.tv_sec = fb->timestamp.tv_sec;
      _timestamp.tv_usec = fb->timestamp.tv_usec;
      _jpg_buf_len = fb->len;
      _jpg_buf = fb->buf;
    }

    if (res == ESP_OK) {
      res = httpd_resp_send_chunk(req, _STREAM_BOUNDARY, strlen(_STREAM_BOUNDARY));
    }
    if (res == ESP_OK) {
      size_t hlen = snprintf(part_buf, sizeof(part_buf), _STREAM_PART,
                             (unsigned)_jpg_buf_len, (int)_timestamp.tv_sec, (int)_timestamp.tv_usec);
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

    if (res != ESP_OK) break;

    // **Yield** so other sockets (servo/telemetry) get CPU/TCP time
    vTaskDelay(pdMS_TO_TICKS(15));  // ~60–66 FPS; use 33 for ~30 FPS
  }
  return res;
}

/* ===== Server init: 80 (/servo), 81 (/stream), 82 (/telemetry) ===== */
void startCameraServer() {
  // ---- Server on :80 (servo) ----
  httpd_config_t cfg80 = HTTPD_DEFAULT_CONFIG();
  cfg80.max_uri_handlers   = 16;
  cfg80.max_open_sockets   = 10;
  cfg80.backlog_conn       = 10;
  cfg80.lru_purge_enable   = true;
  cfg80.send_wait_timeout  = 2;   // seconds
  cfg80.recv_wait_timeout  = 2;   // seconds
  cfg80.stack_size         = 4096;

  httpd_uri_t servo_uri = {
    .uri      = "/servo",
    .method   = HTTP_POST,
    .handler  = servo_handler,
    .user_ctx = NULL
  };

  if (httpd_start(&data, &cfg80) == ESP_OK) {
    httpd_register_uri_handler(data, &servo_uri);
  }

  // ---- Server on :81 (stream) ----
  httpd_config_t cfg81 = HTTPD_DEFAULT_CONFIG();
  cfg81.server_port       = 81;
  cfg81.ctrl_port         = 32769;  // unique
  cfg81.max_uri_handlers  = 16;
  cfg81.max_open_sockets  = 10;
  cfg81.backlog_conn      = 10;
  cfg81.lru_purge_enable  = true;
  cfg81.send_wait_timeout = 2;
  cfg81.recv_wait_timeout = 2;
  cfg81.stack_size        = 8192;   // more stack for MJPEG

  httpd_uri_t stream_uri = {
    .uri      = "/stream",
    .method   = HTTP_GET,
    .handler  = stream_handler,
    .user_ctx = NULL
#ifdef CONFIG_HTTPD_WS_SUPPORT
    , .is_websocket = true,
    .handle_ws_control_frames = false,
    .supported_subprotocol = NULL
#endif
  };

  if (httpd_start(&stream, &cfg81) == ESP_OK) {
    httpd_register_uri_handler(stream, &stream_uri);
  }

  // ---- Server on :82 (telemetry SSE) ----
  httpd_config_t cfg82 = HTTPD_DEFAULT_CONFIG();
  cfg82.server_port       = 82;
  cfg82.ctrl_port         = 32770;  // unique
  cfg82.max_uri_handlers  = 8;
  cfg82.max_open_sockets  = 8;
  cfg82.backlog_conn      = 8;
  cfg82.lru_purge_enable  = true;
  cfg82.send_wait_timeout = 2;
  cfg82.recv_wait_timeout = 2;
  cfg82.stack_size        = 4096;

  httpd_uri_t telemetry_uri = {
    .uri      = "/telemetry",
    .method   = HTTP_GET,
    .handler  = telemetry_handler,
    .user_ctx = NULL
  };

  if (httpd_start(&telem, &cfg82) == ESP_OK) {
    httpd_register_uri_handler(telem, &telemetry_uri);
  }
}
