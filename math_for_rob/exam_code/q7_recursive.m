x = readmatrix("./data_1/x.csv" );
u = readmatrix("./data_1/u.csv" );

Q = zeros(3,3);

A_i = [];
for i = 1:999
    H_i = [x(i,2),0,0;
     0, x(i,2), u(i)];
    A_i = [A_i;H_i];
    z_i = [x(i+1,1)-x(i,1);x(i+1,2)];
    s_i = [0.02,0;
            0,0.01];
    if(i>=10)
        C_k_new = H_i;
        S_k_new = inv(s_i);

        Q_new = Q + C_k_new'*S_k_new*C_k_new;
        K_new = inv(Q_new)*C_k_new'*S_k_new;

        x_new = x_old + K_new*(z_i-H_i*x_old);
        
        x_old = x_new;
        Q = Q_new;
    else
        addthing = H_i'*s_i*H_i;
        x_old = zeros(3,1);
        Q = Q + addthing;
        
    end
end
