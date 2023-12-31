A_eq = [1,1,1,1];
B_eq = 3;
A_in = [
    1,2,3,4;
    5,6,7,8;
    ];
B_in = [5;10];
H =  2*eye(4);
f = [0;0;0;0];
x_1 = quadprog(H,f,A_in,B_in,A_eq,B_eq);

%% 
Q = [
    4,1,0,0;
    1,2,1,0;
    0,1,6,0;
    0,0,1,8
    ];
f = [0;0;0;0];
A_in = [
    1,2,3,4;
    5,6,7,8;
    ];
x0 = [1;2;3;4];
B_in = [5;10] - A_in*x0;
x_2 = quadprog(H,f,A_in,B_in)+x0;