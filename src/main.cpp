#include <cstdio>
#include <cstdlib>
#include <pid.h>

double plant(double input, double action);

int main(void) {
    double input  = 50.0;
    double output = 0.0;

    double kp        = 1.0;
    double ki        = 0.01;
    double kd        = 0.75;
    double reference = 100.0;

    PID pid(reference, kp, ki, kd);
    for (int i = 0; i < 100; i++) {
        output = pid.compute(input);
        input  = plant(input, output);
        printf("[%2d] action: % 6.2lf\tplant: % 7.2lf\terror: % 10.6lf\n", i,
               output, input, (input - reference));
    }

    return 0;
}

double plant(double input, double action) {
    return (0.35 * action) + input + (rand() % 100 * 0.0001);
}
