load DataHW07_Prob4.mat 

x_hat = [];
E_k = [];
Q = zeros(100,100);
T_k = zeros(100,1);
flag = 0;
A_k = [];
for i = 1:length(x_actual)
    A_k = [A_k;cell2mat(C(i))];
    C_i = cell2mat(C(i));
    S = eye(3);
    y_i = cell2mat(y(i));
    x_i = cell2mat(x_actual(i));
    if(flag==1)
        C_k_new = C_i;
        S_k_new = eye(3);
        kkk = inv(inv(S_k_new)+(C_k_new*P_k*C_k_new'));
        P_k_new = P_k - P_k*C_k_new'*(kkk*C_k_new*P_k);

        K_new = P_k_new*C_k_new'*S_k_new;

        x_new = x_old + K_new*(y_i - C_k_new*x_old);

        x_old = x_new;
        P_k = P_k_new;
        x_hat = [x_hat;mat2cell(x_old, 100,1)];

        err = (x_i-x_old)'*(x_i-x_old);
        E_k = [E_k;sqrt(err)];
    else
        s_i = eye(3);
        addthing = C_i'*s_i*C_i;
        Q = Q + addthing;
        T_k = T_k + (C_i'*s_i*y_i);
        
        if (rank(A_k)>=100)
            flag = 1;
            tstart = tic;
            P_k = inv(Q);
            x_old = P_k*T_k;
            x_hat = [x_hat;mat2cell(x_old, 100,1)];
            err = (x_i-x_old)'*(x_i-x_old);
            E_k = [E_k;sqrt(err)];

        end
    end
end

total_time = toc(tstart);
fig = figure('visible','on');
plot(n:length(x_actual),E_k,'LineWidth',1.0)
ylabel('Norm error in x-hat ','FontSize',13)
xlabel('k','FontSize',13)
title("Norm error in x-hat using RLS and Matrix Inverse lemma")
saveas(fig, "q4_plot3.png")
