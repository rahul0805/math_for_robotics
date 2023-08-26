A = [
    1,2;
    3,4;
    5,0;
    0,6
    ];

Q_cov = [
        1   ,   0.5,    0.5,    0.25;
        0.5,    2,      0.25,   1;
        0.5,    0.25,    2,     1;
        0.25,    1,    1,       4;
        ];

Y = [
     1.5377;
     3.6948;
     -7.7193;
     7.3621;
    ];

P = [
    0.5, 0.25;
    0.25, 0.5;
    ];
x_dat = [1;
         -1;];
e_dat = [0;
         0;
         0;
         0;];
Q = Q_cov;
C = A;
y = Y;
y_dat = (C*x_dat) + e_dat;
B = (inv((C*P*C') + Q));
covariance = P - (P*C'*B*C*P)
k_hat = P*C'*B;
x_sol = x_dat + (k_hat*(y-y_dat)) 
