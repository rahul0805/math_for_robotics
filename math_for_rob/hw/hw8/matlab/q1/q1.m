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

sol = [];
for i=2:4
    Q = Q_cov(1:i,1:i);
    C = A(1:i,:);
    y = Y(1:i,:);
    cov = inv(C'*inv(Q)*C)
    k_hat = (cov)*C'*inv(Q);
    x_sol = k_hat*y 
end