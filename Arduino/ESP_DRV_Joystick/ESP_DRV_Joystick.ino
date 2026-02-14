#include <Arduino.h>
#include <Wire.h>
#include <Adafruit_INA219.h>

// -------------------- USER CONFIG --------------------
static const int I2C_SDA = 21;
static const int I2C_SCL = 22;
static const uint32_t I2C_HZ = 400000;

// DRV8234 7-bit address
static const uint8_t DRV_ADDR_7B = 0x30;

// INA219 (optional)
static const bool USE_INA219 = true;
static const uint8_t INA_ADDR_7B = 0x40;

// UART joystick input (Serial2)
static const int UART_RX = 16;
static const int UART_TX = 17;
static const uint32_t UART_BAUD = 115200;

// Velocity command range
static const int VEL_MAX = 255;      // expects -255..255
static const int DEAD_BAND = 10;     // ignore small commands near zero
static const uint32_t CMD_TIMEOUT_MS = 300; // stop if no cmd for this long

// I2C-"PWM" frequency (keep modest; higher loads I2C/CPU)
static const float PWM_HZ = 120.0f;  // 80–200 Hz typical
static const uint32_t PWM_PERIOD_US = (uint32_t)(1000000.0f / PWM_HZ);

// Telemetry print interval
static const uint32_t TELEMETRY_MS = 100;
// -----------------------------------------------------

// -------- DRV8234 registers --------
static const uint8_t REG_FAULT   = 0x00;
static const uint8_t REG_CONFIG0 = 0x09;
static const uint8_t REG_CONFIG4 = 0x0D;

// CONFIG0 bits
static const uint8_t CFG0_EN_OUT  = 0x80; // bit7
static const uint8_t CFG0_CLR_FLT = 0x02; // bit1

// CONFIG4 bits
static const uint8_t CFG4_PMODE   = 0x08; // bit3 (0=PH/EN)
static const uint8_t CFG4_I2C_BC  = 0x04; // bit2 (1=bridge ctrl from I2C bits)
static const uint8_t CFG4_I2C_EN1 = 0x02; // bit1 (Enable)
static const uint8_t CFG4_I2C_PH2 = 0x01; // bit0 (Phase/direction)
// ----------------------------------

Adafruit_INA219 ina219(INA_ADDR_7B);
static HardwareSerial& JoyUart = Serial2;

// Cached CONFIG4 so we avoid reading every toggle
static uint8_t cfg4_cache = 0;
static bool cfg4_valid = false;

// Command state
static int cmdVel = 0;
static uint32_t lastCmdMs = 0;

// Desired direction + duty from joystick
static bool forward = true;
static float duty = 0.0f; // 0..1

// PWM engine state
static uint32_t cycleStartUs = 0;
static bool enHigh = false;

// -------------------- I2C helpers --------------------
static bool i2cWriteReg8(uint8_t addr7, uint8_t reg, uint8_t val) {
  Wire.beginTransmission(addr7);
  Wire.write(reg);
  Wire.write(val);
  return Wire.endTransmission(true) == 0;
}

static bool i2cReadReg8(uint8_t addr7, uint8_t reg, uint8_t &val) {
  Wire.beginTransmission(addr7);
  Wire.write(reg);
  if (Wire.endTransmission(false) != 0) return false;
  if (Wire.requestFrom((int)addr7, 1, (int)true) != 1) return false;
  val = Wire.read();
  return true;
}

static bool drvProbe() {
  Wire.beginTransmission(DRV_ADDR_7B);
  return Wire.endTransmission(true) == 0;
}

// IMPORTANT: PMODE and I2C_BC only writable when EN_OUT=0
static bool drvInitI2CBridge_PHEN() {
  uint8_t c0=0, c4=0;

  // EN_OUT=0
  if (!i2cReadReg8(DRV_ADDR_7B, REG_CONFIG0, c0)) return false;
  c0 &= ~CFG0_EN_OUT;
  if (!i2cWriteReg8(DRV_ADDR_7B, REG_CONFIG0, c0)) return false;

  // CONFIG4: PMODE=0 (PH/EN), I2C_BC=1, EN/PH default 0
  if (!i2cReadReg8(DRV_ADDR_7B, REG_CONFIG4, c4)) return false;
  c4 &= ~(CFG4_PMODE | CFG4_I2C_BC | CFG4_I2C_EN1 | CFG4_I2C_PH2);
  c4 |= CFG4_I2C_BC;
  if (!i2cWriteReg8(DRV_ADDR_7B, REG_CONFIG4, c4)) return false;

  // Clear faults
  if (!i2cReadReg8(DRV_ADDR_7B, REG_CONFIG0, c0)) return false;
  c0 |= CFG0_CLR_FLT;
  (void)i2cWriteReg8(DRV_ADDR_7B, REG_CONFIG0, c0);

  // EN_OUT=1
  if (!i2cReadReg8(DRV_ADDR_7B, REG_CONFIG0, c0)) return false;
  c0 |= CFG0_EN_OUT;
  if (!i2cWriteReg8(DRV_ADDR_7B, REG_CONFIG0, c0)) return false;

  cfg4_cache = c4;
  cfg4_valid = true;
  return true;
}

// Set EN/PH bits via CONFIG4 (cached)
static void drvSetENPH(bool en, bool fwd) {
  if (!cfg4_valid) {
    uint8_t t=0;
    if (!i2cReadReg8(DRV_ADDR_7B, REG_CONFIG4, t)) return;
    cfg4_cache = t;
    cfg4_valid = true;
  }

  uint8_t c4 = cfg4_cache;

  // Force correct mode bits
  c4 &= ~CFG4_PMODE;  // PH/EN
  c4 |= CFG4_I2C_BC;  // I2C bridge control

  // Direction: choose which PH polarity is "forward"
  if (fwd) c4 &= ~CFG4_I2C_PH2;  // PH=0
  else     c4 |=  CFG4_I2C_PH2;  // PH=1

  // Enable
  if (en)  c4 |=  CFG4_I2C_EN1;
  else     c4 &= ~CFG4_I2C_EN1;

  if (c4 != cfg4_cache) {
    i2cWriteReg8(DRV_ADDR_7B, REG_CONFIG4, c4);
    cfg4_cache = c4;
  }
}

static inline float clamp01(float x) { return x < 0 ? 0 : (x > 1 ? 1 : x); }

static void applyVelCommand(int v) {
  v = constrain(v, -VEL_MAX, VEL_MAX);
  cmdVel = v;

  if (abs(v) < DEAD_BAND) {
    duty = 0.0f;
    return;
  }

  forward = (v > 0);
  duty = clamp01((float)abs(v) / (float)VEL_MAX);
}

// -------------------- UART line reader --------------------
static bool readLineFromUart(String &out) {
  static String buf;
  while (JoyUart.available()) {
    char c = (char)JoyUart.read();
    if (c == '\r' || c == '\n') {
      if (buf.length() == 0) continue;
      out = buf;
      buf = "";
      return true;
    }
    buf += c;
    if (buf.length() > 64) { out = buf; buf = ""; return true; }
  }
  return false;
}

// -------------------- Telemetry --------------------
static void printTelemetry() {
  float busV = 0, curmA = 0, pwrmW = 0, shuntmV = 0;
  if (USE_INA219) {
    busV = ina219.getBusVoltage_V();
    curmA = ina219.getCurrent_mA();
    pwrmW = ina219.getPower_mW();
    shuntmV = ina219.getShuntVoltage_mV();
  }
  uint8_t fault=0xFF;
  (void)i2cReadReg8(DRV_ADDR_7B, REG_FAULT, fault);

  Serial.printf("cmd=%d duty=%.2f dir=%s | INA: V=%.3f I=%.1f P=%.1f Vsh=%.2f | DRV_FAULT=0x%02X\n",
                cmdVel, duty, forward ? "FWD" : "REV",
                busV, curmA, pwrmW, shuntmV,
                fault);
}

void setup() {
  Serial.begin(115200);
  delay(200);

  Wire.begin(I2C_SDA, I2C_SCL);
  Wire.setClock(I2C_HZ);

  if (!drvProbe()) {
    Serial.println("[ERR] DRV8234 not ACKing on I2C. Check address/power/pullups.");
    while (true) delay(1000);
  }
  if (!drvInitI2CBridge_PHEN()) {
    Serial.println("[ERR] DRV init failed.");
    while (true) delay(1000);
  }

  if (USE_INA219) {
    if (!ina219.begin(&Wire)) {
      Serial.println("[ERR] INA219 not found.");
      while (true) delay(1000);
    }
    ina219.setCalibration_32V_2A();
  }

  JoyUart.begin(UART_BAUD, SERIAL_8N1, UART_RX, UART_TX);

  // Start stopped
  duty = 0.0f;
  forward = true;
  drvSetENPH(false, forward);
  enHigh = false;

  lastCmdMs = millis();
  cycleStartUs = micros();

  Serial.println("I2C-only velocity control ready.");
  Serial.println("Send a line on Serial2: -255..255 (e.g., 120 or -200).");
}

void loop() {
  // Read UART commands
  String line;
  if (readLineFromUart(line)) {
    line.trim();
    int v = line.toInt();  // expects "-123" etc.
    applyVelCommand(v);
    lastCmdMs = millis();
  }

  // Failsafe: stop if no commands
  if (millis() - lastCmdMs > CMD_TIMEOUT_MS) {
    duty = 0.0f;
    cmdVel = 0;
  }

  // Software PWM over I2C: toggle EN bit each cycle
  if (duty <= 0.001f) {
    drvSetENPH(false, forward); // coast/stop
    enHigh = false;
  } else {
    uint32_t nowUs = micros();
    uint32_t elapsed = nowUs - cycleStartUs;

    // New cycle
    if (elapsed >= PWM_PERIOD_US) {
      cycleStartUs = nowUs;
      elapsed = 0;
      enHigh = true;
      drvSetENPH(true, forward);
    }

    // Turn off after on-time
    uint32_t onTimeUs = (uint32_t)(duty * (float)PWM_PERIOD_US);
    if (enHigh && elapsed >= onTimeUs) {
      enHigh = false;
      drvSetENPH(false, forward);
    }
  }

  // Telemetry
  static uint32_t lastTelem = 0;
  if (millis() - lastTelem >= TELEMETRY_MS) {
    lastTelem = millis();
    printTelemetry();
  }

  delay(1);
}