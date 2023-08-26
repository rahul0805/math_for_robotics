A =[
    1,3;
    3,9
    ];

B = [
    6, 10, 11;
    10, 19, 19;
    11, 19, 21
    ];


C = [
    2,  6, 10;
    6, 10, 14;
    10, 14, 18
    ];

% [O_a,D_a] = eig(A)
% A_root = (O_a*sqrt(D_a))'
% [O_b,D_b] = eig(B)
% B_root = (O_b*sqrt(D_b))'
[O_c,D_c] = eig(C)