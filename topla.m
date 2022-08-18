clear
clc

x = 1:3;
y = 1:3;
[X,Y] = meshgrid(x,y);
Z = (X.*Y);
mesh(X,Y,Z)
grid on
hold on
