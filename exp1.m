clc; 
clear all; 
close all;

w1 = 10; 
A = 1;
t1 = -15:0.01:15; 
t0 = 2;
xt_original = A * rectpuls(t1, w1);

syms t w
expw = exp(-1j * w * t); 
z_original = int(1 * expw, t, -2, 2);
z_original = simplify(z_original);

subplot(2,1,1)
plot(t1, xt_original)
title('Original Signal in Time Domain')

subplot(2,1,2)
ezplot(abs(z_original))
title('Frequency Spectrum')