f1 = @(t) 1;
f2 = @(t) t;
f3 = @(t) t.^2;
f4 = @(t) sin(pi*t);

f11 = @(t) 1;
f12 = @(t) t;
f13 = @(t) t.^2;
f14 = @(t) sin(pi*t);
f22 = @(t) t.^2;
f23 = @(t) t.^3;
f24 = @(t) t.*sin(pi*t);
f33 = @(t) t.^4;
f34 = @(t) (t.^2).*sin(pi*t);
f44 = @(t) (sin(pi*t)).*sin(pi*t);
li =2;
%% for part a

a11 = 2;
a12 = integral(f12,0,li);
a13 = integral(f13,0,li);
a14 = integral(f14,0,li);
a22 = integral(f22,0,li);
a23 = integral(f23,0,li);
a24 = integral(f24,0,li);
a33 = integral(f33,0,li);
a34 = integral(f34,0,li);
a44 = integral(f44,0,li);

G = [
    a11,a12,a13,a14;
    a12,a22,a23,a24;
    a13,a23,a33,a34;
    a14,a24,a34,a44;
    ];

A = [a12,a22,a23,a24;];
b = 2;
P = inv(G)*A';
x1 = P*(inv(A*P))*b;


A = [a12,a22,a23,a24;
    a14,a24,a34,a44;];
b = [2;pi];
P = inv(G)*A';
x2 = P*(inv(A*P))*b;