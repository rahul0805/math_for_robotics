A = [4.041, 7.046, 3.014;
    10.045, 17.032, 7.027;
    16.006, 27.005, 11.048;];
% rank(A)
[U,S,V] = svd(A);
sigma = S(3,3);
ur = U(:,3);
vr = V(:,3);

delA = -sigma*ur*vr';

A_hat = A + delA;

rank(A_hat)