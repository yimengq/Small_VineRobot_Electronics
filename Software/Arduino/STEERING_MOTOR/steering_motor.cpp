#include "../libraries/ESP32Encoder-0.11.7/src/ESP32Encoder.h"
#include "steering_motor.h"

long TiltMotorEnc = 0;
long RotMotorEnc = 0;

static MotorState_t CurrentState;

void steering_motor::init(){
    //initialize the encoder
    ESP32Encoder TiltEnc; //initialize tilt motor encoder
    ESP32Encoder RotEnc; //initialize rotation motor encoder
    ESP32Encoder::useInternalWeakPullResistors = puType::up; // Enable the weak pull up resistors
}

void steering_motor::update(){

    

}

void RunMotor(motor_event_t Motor_Event){ //should be run function, not sure how to format this framework
    switch(CurrentState)
    {
        case WaitingForInp:
        {
            switch(Motor_EventType_t)
            {
                case ES_INIT:
                {
                    print initialized
                }
                break;

                case ES_ROTATE_MOTOR:
                {
                    CurrentState = MotorTurning;
                    TurnMotor(Motor_Event.MotorType);
                    Motor_Event.EventType = ES_STILL_TURNING;
                    Post motor_event to queue
                }
            }
        }
        break;

        case MotorTurning:
        {
            switch(Motor_EventType_t)
            {
                case ES_STILL_TURNING:
                {
                    if check motor turning function is false
                        post event again
                    else finished turning
                        CurrentState = WaitingForInp
                        print finished turning
                }
                break;
                
                break;
            }
        }
        break;

        break;
        default:
         ;
    }
    
    
}

bool TurnMotor(Motor_MotorType MotorType) //turn on logic pins (best way to pass motor type and desired param?)
{

}

bool CheckMotor(Motor_MotorType, uint16_t TurnParam) //check if motors have finished turning(best way to pass motor type and desired param?)
{
query encoders
check if encoders have exceeded turn param
}