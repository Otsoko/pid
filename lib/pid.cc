#include "pid.hh"

PID::PID(double reference, double kp, double ki, double kd) {
    this->kp        = kp;
    this->ki        = ki;
    this->kd        = kd;
    this->reference = reference;
}

PID::~PID() {}

double PID::compute(double input) {
    errork = reference - input;

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
