#pragma once

class PID {
private:
    double kp = 0.0;
    double ki = 0.0;
    double kd = 0.0;

    double reference  = 0.0;
    double errork     = 0.0;
    double errorkm1   = 0.0;
    double integral   = 0.0;
    double derivative = 0.0;

    bool firstIteration = true;

public:
    PID(double ref, double kp, double ki, double kd);
    ~PID();
    double compute(double input);
};
