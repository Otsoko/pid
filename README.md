# PID

C++ Proportional-Integral-Derivative (PID) controller implementation.

## PID output calculation
$$u(t)=K_p\cdot e(t)+K_i\cdot\int_0^t e(\tau)d\tau+K_d\cdot\dot{e}(t)$$

## PID discretized output calculation

$$u[k]=K_p\cdot e[k]+K_i\cdot \left( I[k-1]+\frac{e[k]+e[k-1]}{2}\cdot\Delta T \right)+K_d\cdot \left( \frac{e[k]-e[k-1]}{\Delta T} \right)$$

## Build and run

To build and run this project run

```bash
$ make
$ ./pidx
```

## Build library

To build and run just the library run

```bash
$ make lib
```

## License

[MIT](https://choosealicense.com/licenses/mit/)

Copyright (c) 2024

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.