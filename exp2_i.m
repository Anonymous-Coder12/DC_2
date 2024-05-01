clc;clear all;close all;
w1 = 4;
A = 1;
t1 = -5:0.01:5;
t0 = 2;
xt_original = A * rectpuls(t1, w1);
xt_shifted = A * rectpuls(t1-t0, w1);

syms t w
expw = exp(-j*w*t);
z_original=int(1*expw,t,-2,2);
z_original=simplify(z_original);
z_shifted=int(1*expw,t,0,4);
z_shifted=simplify(z_shifted);

subplot(2,2,1)
plot(t1,xt_original)
subplot(2,2,3)
plot(t1,xt_shifted)
subplot(2,2,2)
ezplot(abs(z_original));
subplot(2,2,4)
ezplot(abs(z_shifted));
%axis([-5 5 -3 12])