x = [1, 1, 1, 1, 1];
jac = zeros(5,5);
del = 1;
for j = 1:5
    del = del*1e-1;
    for i = 1:5
        e = zeros(1,5);
        e(i) = 1;
        x1 = x - del*e;
        x2 = x + del*e;
        jac(i,j) = (funcPartC(x2) - funcPartC(x1)).*(1/(2*del)); 
    end
end
