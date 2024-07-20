#include "pid.h"
#include <cstdio>

PID::PID(double ref, double kp, double ki, double kd) {
    this->kp  = kp;
    this->ki  = ki;
    this->kd  = kd;
    this->ref = ref;
}

PID::~PID() {}

double PID::compute(double input) {
    errork = ref - input;

    if (firstIteration) {
        firstIteration = false;
        return kp * errork;
    }

    int deltaT = 10;
    derivative = (errork - errorkm1) / deltaT;
    integral += ((errork + errorkm1) / 2.0) * deltaT;

    errorkm1 = errork;

    return kp * errork + ki * integral + kd * derivative;
}
