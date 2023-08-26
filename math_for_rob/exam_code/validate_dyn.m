function x_new = validate_dyn(theta,x,u)
A = [1, theta(1);
     0, theta(2);];
B = [0;
    theta(3);];
x_new = A*x + B*u;
end

