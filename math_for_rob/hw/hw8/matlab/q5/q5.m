A = [
    1,2;
    3,4;
    5,0;
    0,6
    ];

Q = eye(4);

Y = [
     1.5377;
     3.6948;
     -7.7193;
     7.3621;
    ];

y = Y;
x_sol_wls = inv(A' * A)*A'*y

P = 100*eye(2);
C = A;
y = Y;
cov_blue = inv(C'*inv(Q)*C)
k_hat = (cov_blue)*C'*inv(Q);
x_sol_blue = k_hat*y 

P = 100*eye(2);
C = A;
y = Y;
cov = inv((C'*inv(Q)*C) + inv(P));
k_hat = (cov)*C'*inv(Q);
B = inv((C*P*C') + Q);
covariance_less = P - (P*C'*B*C*P)
x_sol_less = k_hat*y

P = 1000000*eye(2);
C = A;
y = Y;
cov = inv((C'*inv(Q)*C) + inv(P));
k_hat = (cov)*C'*inv(Q);
B = inv((C*P*C') + Q);
covariance_more = P - (P*C'*B*C*P)
x_sol_more = k_hat*y


