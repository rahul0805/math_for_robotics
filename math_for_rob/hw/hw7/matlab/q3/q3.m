A = [
      1,  0,  sqrt(2);
      0,  2,   0;
    sqrt(2), 0, 0;
    ];

[V,D,W] = eig(A);
check = V'*A*(V);
A2 = check(1:2,1:2);
[U2,D1] = eig(A2);
U = [1,0,0;
    0, U2(1,1), U2(1,2);
    0, U2(2,1), U2(2,2)];
O = V*U;
final = O'*A*O;