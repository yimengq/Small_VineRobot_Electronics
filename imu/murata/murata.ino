/*
Test script initializes Murata SCH16T-K10 IMU and records accel and gyro data for testing. 
SCH16T-K10 uses 4-wire, 48bit frame SPI with an out of frame protocol (data is received after 
the next transmission is sent from the master). See documentation for further details. 

Documentation describes an initialization procedure which is not fully implemented here (TO DO). 

Further process the IMU data in the main loop() by accessing contents of imu_data struct. 
 */

#include <Arduino.h>
#include <SPI.h>


// ESP32-S3 SPI pins
#define PIN_SPI_MOSI 9
#define PIN_SPI_MISO 8
#define PIN_SPI_SCK 7
#define PIN_SPI_CS 44

/*
 * SCH1 standard requests (from documentation)
 */

// Rate and acceleration
#define REQ_READ_RATE_X1 0x0048000000AC
#define REQ_READ_RATE_Y1 0x00880000009A
#define REQ_READ_RATE_Z1 0x00C80000006D
#define REQ_READ_ACC_X1 0x0108000000F6
#define REQ_READ_ACC_Y1 0x014800000001
#define REQ_READ_ACC_Z1 0x018800000037
#define REQ_READ_ACC_X3 0x01C8000000C0
#define REQ_READ_ACC_Y3 0x02080000002E
#define REQ_READ_ACC_Z3 0x0248000000D9
#define REQ_READ_RATE_X2 0x0288000000EF
#define REQ_READ_RATE_Y2 0x02C800000018
#define REQ_READ_RATE_Z2 0x030800000083
#define REQ_READ_ACC_X2 0x034800000074
#define REQ_READ_ACC_Y2 0x038800000042
#define REQ_READ_ACC_Z2 0x03C8000000B5

// Status
#define REQ_READ_STAT_SUM 0x05080000001C
#define REQ_READ_STAT_SUM_SAT 0x0548000000EB
#define REQ_READ_STAT_COM 0x0588000000DD
#define REQ_READ_STAT_RATE_COM 0x05C80000002A
#define REQ_READ_STAT_RATE_X 0x0608000000C4
#define REQ_READ_STAT_RATE_Y 0x064800000033
#define REQ_READ_STAT_RATE_Z 0x068800000005
#define REQ_READ_STAT_ACC_X 0x06C8000000F2
#define REQ_READ_STAT_ACC_Y 0x070800000069
#define REQ_READ_STAT_ACC_Z 0x07480000009E

// Temperature and traceability
#define REQ_READ_TEMP 0x0408000000B1
#define REQ_READ_SN_ID1 0x0F4800000065
#define REQ_READ_SN_ID2 0x0F8800000053
#define REQ_READ_SN_ID3 0x0FC8000000A4
#define REQ_READ_COMP_ID 0x0F0800000092

// Filters
#define REQ_READ_FILT_RATE 0x0948000000FA
#define REQ_READ_FILT_ACC12 0x0988000000CC
#define REQ_READ_FILT_ACC3 0x09C80000003B
#define REQ_READ_RATE_CTRL 0x0A08000000D5
#define REQ_READ_ACC12_CTRL 0x0A4800000022
#define REQ_READ_ACC3_CTRL 0x0A8800000014
#define REQ_READ_MODE_CTRL 0x0D4800000010
#define REQ_SET_FILT_RATE 0x0968000000   
#define REQ_SET_FILT_ACC12 0x09A8000000  
#define REQ_SET_FILT_ACC3 0x09E8000000   

// Sensitivity and decimation
#define REQ_SET_RATE_CTRL 0x0A28000000   
#define REQ_SET_ACC12_CTRL 0x0A68000000  
#define REQ_SET_ACC3_CTRL 0x0AA8000000   
#define REQ_SET_MODE_CTRL 0x0D68000000   

// DRY/SYNC configuration
#define REQ_READ_USER_IF_CTRL 0x0CC80000007C
#define REQ_SET_USER_IF_CTRL 0x0CE8000000  

// Other
#define REQ_SOFTRESET 0x0DA800000AC3  // SPI soft reset command.
#define CMD_EN_SENSOR 0x0D68000001D3
#define EXP_COMP_ID 0x21

/*
 * Frame field masks
 */
#define TA_FIELD_MASK 0xFFC000000000
#define SA_FIELD_MASK 0x7FE000000000
#define DATA_FIELD_MASK 0x00000FFFFF00
#define CRC_FIELD_MASK 0x0000000000FF
#define ERROR_FIELD_MASK 0x001E00000000

const float ACC_SENSITIVITY = 3200.0f;  // to convert raw accelerometer readings 
const float GYRO_SENSITIVITY = 1600.0f; // to convert raw gyro readings 

/* ----- */

// store imu readings  
struct imu_data {
  float acc_x;
  float acc_y;
  float acc_z;
  float gyro_x;
  float gyro_y;
  float gyro_z;
};

SPIClass murataSPI(HSPI);
imu_data imu_data; 

// TO DO: implement 
void sch1_reset() {
  return;
}

/* 8-bit CRC for 48-bit SPI frames. Function from Murata documentation */
uint8_t CRC8(uint64_t SPIframe)
{
  uint64_t data = SPIframe & 0xFFFFFFFFFF00LL;
  uint8_t crc = 0xFF;

  for (int i = 47; i >= 0; i--)
  {
      uint8_t data_bit = (data >> i) & 0x01;
      crc = crc & 0x80 ? (uint8_t)((crc << 1) ^ 0x2F) ^ data_bit : (uint8_t)(crc << 1) | data_bit;
  }
  
  return crc;
}

/* Activates/deactivate SCH1 measurement mode and sets the EOI bit if needed. */
int sch1_enable_meas(bool enable_sensor, bool set_eoi) {
  uint64_t requestFrame_Mode_Ctrl;
  uint64_t responseFrame_Mode_Ctrl;
  uint8_t  CRCvalue;

  requestFrame_Mode_Ctrl = REQ_SET_MODE_CTRL;

  // Handle EN_SENSOR bit
  if (enable_sensor)
      requestFrame_Mode_Ctrl |= 0x01;

  // Handle EOI_CTRL bit
  if (set_eoi)
      requestFrame_Mode_Ctrl |= 0x02;

  requestFrame_Mode_Ctrl <<= 8;
  CRCvalue = CRC8(requestFrame_Mode_Ctrl);
  requestFrame_Mode_Ctrl |= CRCvalue;
  spi48_send_request(requestFrame_Mode_Ctrl, responseFrame_Mode_Ctrl);

  // Read back sensitivity control register contents
  spi48_send_request(REQ_READ_MODE_CTRL, responseFrame_Mode_Ctrl);
  spi48_send_request(REQ_READ_MODE_CTRL, responseFrame_Mode_Ctrl);

  // Check that return frame is not blank
  if ((responseFrame_Mode_Ctrl == 0xFFFFFFFFFFFF) || (responseFrame_Mode_Ctrl == 0x00))
      return 1; // TO DO: change return codes to enum

  // Check that Source Address matches Target Address.
  if (((requestFrame_Mode_Ctrl & TA_FIELD_MASK) >> 38) != ((responseFrame_Mode_Ctrl & SA_FIELD_MASK) >> 37))
      return 1; // TO DO: change return codes to enum
  
  return 0; // TO DO: change return codes to enum
}

/* Initialize SCH1 sensor */
// TO DO: implement full procedure and error checking described in datasheet 
int sch1_init() { 

  delay(32);
  if (sch1_enable_meas(true, false)) {
    return 1; 
  }

  delay(215);

  if (sch1_enable_meas(true, true)) {
    return 1; 
  }

  delay(3); 
  return 0; 
}


//   for (startup_attempt = 0; startup_attempt < 2; startup_attempt++) {              
//       delay(32); // wait 32ms for non-volatile memory read 

//       // write EN_SENSOR = 1
//       if (sch1_enable_meas(true, false)) {
//         cont
//       }

//       delay(215); // wait 215 ms 
  
//       // write EOI = 1 (End of Initialization command)
//       if (sch1_enable_meas(true, true)) {

//       }
      
//       delay(3); // wait 3ms 
//       SCH1status = true;
      
//   } 
//   if (SCH1status != true)
//       ret = 1;
            
//   return ret;
// }

/* Send SPI command to IMU */
void spi48_send_request(uint64_t request, uint64_t &rx) {
  delayMicroseconds(10);
  uint16_t tx_buf[3];
  uint16_t rx_buf[3];
  uint8_t index;
  uint8_t size = 3;  // 48-bit SPI-transfer consists of three 16-bit transfers

  for (index = 0; index < size; index++) {
    tx_buf[size - index - 1] = (request >> (index << 4)) & 0xFFFF;
  }

  digitalWrite(PIN_SPI_CS, LOW);

  for (int i = 0; i < 3; i++) {
    rx_buf[i] = murataSPI.transfer16(tx_buf[i]);
  }

  digitalWrite(PIN_SPI_CS, HIGH);
  rx = ((uint64_t)rx_buf[0] << 32) | ((uint64_t)rx_buf[1] << 16) | ((uint64_t)rx_buf[2]);
}

/* Reads response to SPI command, using out-of-frame protocol */
int32_t spi48_read_response(uint64_t &rx) {
  spi48_send_request(0x000000000000, rx);  // send dummy request 
  delayMicroseconds(10);
  uint32_t out = (rx & DATA_FIELD_MASK) >> 8;
  return sign_extend(out);  
}

/* Sign extends 20-bit datafield to int32 */
int32_t sign_extend(uint32_t raw) {
  if (raw & (1 << 19)) {
    return (int32_t)(raw | 0xFFF00000); // extend negative
  } else {
    return (int32_t)(raw & 0x000FFFFF); // positive
  }
}


/* Read and convert raw IMU data, store in global struct */
void read_imu_data() {
  uint64_t resp = 0;

  spi48_send_request(REQ_READ_ACC_X1, resp);
  imu_data.acc_x = spi48_read_response(resp) / ACC_SENSITIVITY;

  spi48_send_request(REQ_READ_ACC_Y1, resp);
  imu_data.acc_y = spi48_read_response(resp) / ACC_SENSITIVITY;

  spi48_send_request(REQ_READ_ACC_Z1, resp);
  imu_data.acc_z = spi48_read_response(resp) / ACC_SENSITIVITY;

  spi48_send_request(REQ_READ_RATE_X1, resp);
  imu_data.gyro_x = spi48_read_response(resp) / GYRO_SENSITIVITY; 

  spi48_send_request(REQ_READ_RATE_Y1, resp);
  imu_data.gyro_y = spi48_read_response(resp) / GYRO_SENSITIVITY;

  spi48_send_request(REQ_READ_RATE_Z1, resp);
  imu_data.gyro_z = spi48_read_response(resp) / GYRO_SENSITIVITY;
}


void setup() {
  Serial.begin(115200);
  delay(1000);

  pinMode(PIN_SPI_CS, OUTPUT);
  digitalWrite(PIN_SPI_CS, HIGH);

  murataSPI.begin(PIN_SPI_SCK, PIN_SPI_MISO, PIN_SPI_MOSI, PIN_SPI_CS);
  murataSPI.beginTransaction(SPISettings(1000000, MSBFIRST, SPI_MODE0));

  uint64_t resp = 0;
  spi48_send_request(REQ_READ_COMP_ID, resp);
  spi48_read_response(resp);

  Serial.print("COMP_ID register read: 0x");
  Serial.print((resp >> 8) & 0xFFFF, HEX);
  Serial.println(" (expected 0x21)");

  sch1_init(); // TO DO: handle initialization errors 
}

void loop() {
  read_imu_data();

  Serial.print("Accel (m/s^2): X=");
  Serial.print(imu_data.acc_x);
  Serial.print(" Y=");
  Serial.print(imu_data.acc_y);
  Serial.print(" Z=");
  Serial.print(imu_data.acc_z);

  Serial.print(" | Gyro (dps): X=");
  Serial.print(imu_data.gyro_x);
  Serial.print(" Y=");
  Serial.print(imu_data.gyro_y);
  Serial.print(" Z=");
  Serial.println(imu_data.gyro_z);

  delay(1000);
}
