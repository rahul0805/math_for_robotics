A = [
    2,1;
    -3,7;
    5,4;
    ];
b = [3;2;12];
f = [0,0,1,1,1];
A_in = [
    A, -eye(3);
    -A, -eye(3);
    ];
B_in = [
    b;
    -b;
    ];
x_1 = linprog(f,A_in,B_in);

A = [
    2,1;
    -3,7;
    5,4;
    ];
b = [3;2;12];
f = [0,0,1];
A_in = [
    A, -ones(3,1);
    -A, -ones(3,1);
    ];
B_in = [
    b;
    -b;
    ];
x_2 = linprog(f,A_in,B_in);
