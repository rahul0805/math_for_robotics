function y = f1(x)
C = [3;4];
B = [4,3;
    2,1];
A = [1;2];

y = C + B*x - (x*x')*A;

end

