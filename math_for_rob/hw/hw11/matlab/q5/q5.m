
x = [0;10];
% x = [0;0];

for i=1:100
    del = del_f1(x);
    fun = f1(x);
    x_new = x - (inv(del)*fun);
    x = x_new;
end
