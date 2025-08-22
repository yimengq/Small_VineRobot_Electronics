// /*
//   Read InertialSense
//   Basic example reading uINS over serial.
// */

// #include "src/ISsdk/ISComm.h"
// #include <stddef.h>

// static uint8_t s_buffer[1024];
// static is_comm_instance_t comm;

// // Port write callback that matches pfnIsCommPortWrite
// static int arduinoPortWrite(unsigned int port, const unsigned char* data, int length)
// {
//     // We only have one physical serial port to the uINS; ignore 'port'
//     (void)port;
//     // Write to Serial1 (the uINS link). Return number of bytes written.
//     return Serial1.write(data, length);
// }

// static void handleINSMessage(ins_1_t *ins)
// {
//     Serial.print("Lat: ");   Serial.print((float)ins->lla[0], 6); Serial.print("\t");
//     Serial.print(", Lon: "); Serial.print((float)ins->lla[1], 6); Serial.print("\t");
//     Serial.print(", Alt: "); Serial.print((float)ins->lla[2], 2); Serial.print("\t");
//     Serial.print(", roll: ");  Serial.print(ins->theta[0] * C_RAD2DEG_F); Serial.print("\t");
//     Serial.print(", pitch: "); Serial.print(ins->theta[1] * C_RAD2DEG_F); Serial.print("\t");
//     Serial.print(", yaw: ");   Serial.println(ins->theta[2] * C_RAD2DEG_F);
// }

// void setup()
// {
//     Serial.begin(115200);
// // map Serial1 to RX=16, TX=17
//     Serial1.begin(115200, SERIAL_8N1, /*rx=*/16, /*tx=*/17);
//     // In setup()
//     // Serial1.begin(115200, SERIAL_8N1, /*RX=*/44, /*TX=*/43);


//     if (sizeof(double) != 8)
//     {
//         Serial.println("Inertial Sense SDK requires 64-bit double support");
//         while (true) {}
//     }

//     Serial.println("initializing");

//     // Initialize comm interface
//     is_comm_init(&comm, s_buffer, sizeof(s_buffer));

//     // Stop all broadcasts on all ports of the device
//     // NOTE: this call uses our callback to transmit; no extra Serial1.write needed.
//     int result = is_comm_stop_broadcasts_all_ports(arduinoPortWrite, /*port=*/0, &comm);
//     if (result <= 0) {
//         Serial.println("Failed to send stop-broadcasts command");
//     }

//     // Request DID_INS_1 at 20 Hz (period = 1000/20 = 50 ms)
//     // This function fills s_buffer with the command; we then send it.
//     int messageSize = is_comm_get_data_to_buf(s_buffer, sizeof(s_buffer), &comm,
//                                               DID_INS_1, sizeof(ins_1_t),
//                                               /*offset=*/0,
//                                               /*periodMs=*/10);
//     if (messageSize > 0) {
//         Serial1.write(s_buffer, messageSize);
//     } else {
//         Serial.println("Failed to build INS data request");
//     }
// }

// void loop()
// {   
//     // Serial.println("ss");
//     // Read from Serial1, parse bytes through the SDK
//     while (Serial1.available())
//     {
//         uint8_t inByte = (uint8_t)Serial1.read();
//         uint32_t message_type = is_comm_parse_byte(&comm, inByte);

//         if (message_type == _PTYPE_INERTIAL_SENSE_DATA)
//         {
//             switch (comm.rxPkt.dataHdr.id)
//             {
//                 case DID_NULL:
//                     break;
//                 case DID_INS_1:
//                     handleINSMessage((ins_1_t*)(comm.rxPkt.data.ptr));
//                     break;
//                 default:
//                     Serial.print("Got unexpected DID: ");
//                     Serial.println(comm.rxPkt.dataHdr.id, DEC);
//                     break;
//             }
//         }
//     }
// }


















/*
  Read InertialSense PIMU
  Example showing how to request and parse DID_PIMU (Preintegrated IMU) data.
*/

#include "src/ISsdk/ISComm.h"
#include <stddef.h>

static uint8_t s_buffer[1024];
static is_comm_instance_t comm;

// Port write callback for uINS link
static int arduinoPortWrite(unsigned int port, const unsigned char* data, int length)
{
    (void)port;
    return Serial1.write(data, length);
}

// Handler for DID_PIMU messages
static void handlePIMUMessage(pimu_t *pimu)
{
    Serial.print("time: ");  Serial.print(pimu->time, 3); Serial.print(" s\t");
    Serial.print("dt: ");    Serial.print(pimu->dt, 6);   Serial.print(" s\t");

    Serial.print("theta [rad]: ");
    Serial.print(pimu->theta[0], 6); Serial.print(", ");
    Serial.print(pimu->theta[1], 6); Serial.print(", ");
    Serial.print(pimu->theta[2], 6); Serial.print("\t");

    Serial.print("vel [m/s]: ");
    Serial.print(pimu->vel[0], 6); Serial.print(", ");
    Serial.print(pimu->vel[1], 6); Serial.print(", ");
    Serial.println(pimu->vel[2], 6);
}

void setup()
{
    Serial.begin(115200);
    Serial1.begin(115200, SERIAL_8N1, /*rx=*/16, /*tx=*/17);

    if (sizeof(double) != 8)
    {
        Serial.println("Inertial Sense SDK requires 64-bit double support");
        while (true) {}
    }

    Serial.println("initializing");

    // Initialize comm interface
    is_comm_init(&comm, s_buffer, sizeof(s_buffer));

    // Stop all broadcasts on all ports of the device
    int result = is_comm_stop_broadcasts_all_ports(arduinoPortWrite, 0, &comm);
    if (result <= 0) {
        Serial.println("Failed to send stop-broadcasts command");
    }

    // Request DID_PIMU at 20 Hz (period = 50 ms)
    int messageSize = is_comm_get_data_to_buf(s_buffer, sizeof(s_buffer), &comm,
                                              DID_PIMU, sizeof(pimu_t),
                                              /*offset=*/0,
                                              /*periodMs=*/50);
    if (messageSize > 0) {
        Serial1.write(s_buffer, messageSize);
    } else {
        Serial.println("Failed to build PIMU data request");
    }
}

void loop()
{
    while (Serial1.available())
    {
        uint8_t inByte = (uint8_t)Serial1.read();
        uint32_t message_type = is_comm_parse_byte(&comm, inByte);

        if (message_type == _PTYPE_INERTIAL_SENSE_DATA)
        {
            switch (comm.rxPkt.dataHdr.id)
            {
                case DID_PIMU:
                    handlePIMUMessage((pimu_t*)(comm.rxPkt.data.ptr));
                    break;
                default:
                    // Uncomment if debugging other DID packets:
                    // Serial.print("Got DID: ");
                    // Serial.println(comm.rxPkt.dataHdr.id, DEC);
                    break;
            }
        }
    }
}



