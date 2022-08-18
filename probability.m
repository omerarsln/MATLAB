clear
clc

syms x y c
assume (x <= y);
assume (x >= 0);
assume (y <= 3);
f(x,y) = c * x * y * x * exp(-x*y);
answer = int(int(f,y,x,3),x,0,y);
