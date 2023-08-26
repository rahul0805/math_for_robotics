
B = 0.1;
A = 1;
c = 3*1e8;
C = -2/c;
Q = 1e-18;

x0 = 0.5*randn(1) + 1;
u_hat = 4*randn(1) + 10;
z_meas = 2.2*1e-8;

var_x0 = 0.25;
var_u = 16;

x_est = A*x0 + B*u_hat;
P_10 = (A*var_x0*A') + (B*var_u*B');
z_hat = C*(x_est-5);

K = P_10*C'*(inv(C*P_10*C' + Q));

x1 = x_est + K*(z_meas-z_hat);
P_11 = P_10 - K*C*P_10;

u_last = A*1 + B*10;

