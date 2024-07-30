![build workflow](https://github.com/Otsoko/pid/actions/workflows/build.yml/badge.svg)

# PID

C++ Proportional-Integral-Derivative (PID) controller implementation.

## PID output calculation
$$u(t)=K_p\cdot e(t)+K_i\cdot\int_0^t e(\tau)\ d\tau+K_d\cdot\dot{e}(t)$$

## PID discretized output calculation

$$u[k]=K_p\cdot e[k]+K_i\cdot \left( I[k-1]+\frac{e[k]+e[k-1]}{2}\cdot\Delta T \right)+K_d\cdot \left( \frac{e[k]-e[k-1]}{\Delta T} \right)$$

## Build

To build this project run

```bash
$ mkdir build
$ cd build
$ cmake ..
$ make
```

## Run

To run this project run

```bash
$ ./app
```

## License

[Apache License 2.0](https://choosealicense.com/licenses/apache-2.0/)
