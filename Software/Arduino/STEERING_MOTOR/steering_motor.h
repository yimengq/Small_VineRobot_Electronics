#ifndef __STEERING_MOTOR_H__
#define __STEERING_MOTOR_H__

class steering_motor{
    public:
    void init();

    void update();
}

typedef enum{ //events in comma separated list
    ES_ROTATE_MOTOR,
    ES_INIT,
    ES_STILL_TURNING
}Motor_EventType_t;

typedef enum{
    MOTOR_TILT,
    MOTOR_ROTATION
}Motor_MotorType;

typedef enum{ //states in comma separated list
    WaitingForInp,
    MotorTurning
}MotorState_t;

typedef struct Motor_Event{
    Motor_EventType_t EventType;
    Motor_MotorType MotorType;
    uint16_t TurnParam;
}Motor_Event_t;

#endif /* __MOTOR_H__ */