x = [1, 3, -1];
jac = zeros(3,5);
del = 1;
for j = 1:2
    del = del*1e-1;
    for i = 1:3
        e = zeros(1,3);
        e(i) = 1;
        x1 = x - del*e;
        x2 = x + del*e;
        jac(i,j) = (part_b(x2) - part_b(x1)).*(1/(2*del)); 
    end
end

function r = part_b(x)
    r = (3*x(1)*(2*x(2) - (x(3)^3))) + ((x(2)^4)/3);
end