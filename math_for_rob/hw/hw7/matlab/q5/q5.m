load DataHW07_Prob5.mat  

A_k = [];
x_hat = [];
Y_k = [];
R_k = [];
E_k = [];
flag =0;
for i = 1:length(x_actual)
    A_k = [A_k;cell2mat(C(i))];
    Y_k = [Y_k;cell2mat(y(i))];
    R_k = blkdiag(R_k, eye(3));
    if(flag==0 && rank(A_k)>=20)
        n = i;
        flag = 1;
        tstart = tic;
    end
    if(flag==1)
        
        x = cell2mat(x_actual(i));
        sol_now = inv(A_k'*R_k*A_k)*A_k'*R_k*Y_k;
        x_hat = [x_hat;sol_now];
        err = sqrt((sol_now-x)'*(sol_now-x));
        E_k = [E_k;err];
    end
end
total_time = toc(tstart);
fig = figure('visible','on');
plot(n:length(x_actual),E_k,'LineWidth',1.0)
ylabel('Norm error in x-hat','FontSize',13)
xlabel('k','FontSize',13)
title("“Norm error in x-hat without forgetting factor")
saveas(fig, "q5_plot1.png")
