clear
clc

A = [0 0 0];
B = [1 0 0];
C = [0 1 0];
D = [0 0 1];
E = [0 1 1];
F = [1 0 1];
G = [1 1 0];
H = [1 1 1];
P = [A;B;F;H;G;C;A;D;E;H;F;D;E;C;G;B];

d = input('Öteleme (x) deðerlerini giriniz');
h = input('Öteleme (y) deðerlerini giriniz');
l = input('Öteleme (z) deðerlerini giriniz');
a = input('Büyütme (x)deðerlerini giriniz');
f = input('Büyütme (y)deðerlerini giriniz');
k = input('Büyütme (z)deðerlerini giriniz');
c = input('Döndürme açýsýný giriniz');

translation = [1 0 0 0; 0 1 0 0; 0 0 1 0; d h l 1];
scaling = [a 0 0 0; 0 f 0 0; 0 0 k 0; 0 0 0 1];

rotation_z = [cos(c) -sin(c) 0 0; sin(c) cos(c) 0 0; 0 0 1 0; 0 0 0 1];
rotation_x = [1 0 0 0; 0 cos(c) -sin(c) 0; 0 sin(c) cos(c) 0; 0 0 0 1];
rotation_y = [cos(c) 0 sin(0) 0; 0 1 0 0; -sin(c) 0 cos(c) 0; 0 0 0 1];


subplot(2,2,1)
plot3(P(:,1),P(:,2),P(:,3))
title('Original');

subplot(2,2,2)
A = [A 1]*translation; A(end) = [];
B = [B 1]*translation; B(end) = [];
C = [C 1]*translation; C(end) = [];
D = [D 1]*translation; D(end) = [];
E = [E 1]*translation; E(end) = [];
F = [F 1]*translation; F(end) = [];
G = [G 1]*translation; G(end) = [];
H = [H 1]*translation; H(end) = [];
TRANSLATE = [A;B;F;H;G;C;A;D;E;H;F;D;E;C;G;B];
plot3(TRANSLATE(:,1),TRANSLATE(:,2),TRANSLATE(:,3))
title('Translated');

subplot(2,2,3)
A = [A 1]*scaling; A(end) = [];
B = [B 1]*scaling; B(end) = [];
C = [C 1]*scaling; C(end) = [];
D = [D 1]*scaling; D(end) = [];
E = [E 1]*scaling; E(end) = [];
F = [F 1]*scaling; F(end) = [];
G = [G 1]*scaling; G(end) = [];
H = [H 1]*scaling; H(end) = [];
SCALE = [A;B;F;H;G;C;A;D;E;H;F;D;E;C;G;B];
plot3(SCALE(:,1),SCALE(:,2),SCALE(:,3))
title('Scaled');

subplot(2,2,4)
A = [A 1]*rotation_x; A(end) = [];
B = [B 1]*rotation_x; B(end) = [];
C = [C 1]*rotation_x; C(end) = [];
D = [D 1]*rotation_x; D(end) = [];
E = [E 1]*rotation_x; E(end) = [];
F = [F 1]*rotation_x; F(end) = [];
G = [G 1]*rotation_x; G(end) = [];
H = [H 1]*rotation_x; H(end) = [];
ROTATE = [A;B;F;H;G;C;A;D;E;H;F;D;E;C;G;B];
plot3(ROTATE(:,1),ROTATE(:,2),ROTATE(:,3))
title('Rotated');
