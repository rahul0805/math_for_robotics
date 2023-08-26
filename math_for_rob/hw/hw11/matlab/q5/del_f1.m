function y = del_f1(x)
B = [4,3;
    2,1];
x1 = x(1);
x2 = x(2);
der = [2*(x1+x2), 2*x1;
       x2, x1+4*x2];
y = B - der;
end

