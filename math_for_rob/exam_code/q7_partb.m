y = readmatrix("./data_2/y.csv" );
u = readmatrix("./data_2/u.csv" );

x_hat = zeros(100,2);
y_hat = zeros(100,1);

E_k = [];
% theta_est = [0.150;0.998;0.030];
theta_est = [0.134;0.794;-0.366];
x_new = [1;0.3];
P_new = [1,0;
        0, 1];

% [0.134194742312479;0.794913610698950;-0.366540891243778]
% K gail [0.148806565381450;0.990059681671246]
for i = 1:100
    A = [1,theta_est(1);
            0, theta_est(2)];
    C_i = [0,1];
    Q = 0.01;
    y_i = y(i);
    
    x_old = validate_dyn(theta_est,x_new,u(i));
    P_old = A*P_new*A';
    
    K = (P_old*C_i')*inv((C_i*P_old*C_i')+Q);

    x_new = x_old + K*(y_i - C_i*x_old);
    
    y_hat(i) = C_i*x_new;
    
    x_hat(i,1) = x_new(1);
    x_hat(i,2) = x_new(2);
    
    if(i==1)
        initial_k_gain = K;
    end
    
end

fig = figure('visible','on');
plot(y_hat,'LineWidth',2.0);
hold on
plot(y,'LineWidth',2.0);
hold off
legend('y estimates','y readings');
ylabel('values','FontSize',13)
xlabel('time','FontSize',13)
title("Comparision of sensor values")
saveas(fig, "compare_y_value.png");


fig = figure('visible','on');
plot(x_hat(:,1),x_hat(:,2),'LineWidth',2.0);
title("trajectory")
saveas(fig, "traj.png");


fig = figure('visible','on');
subplot(2,1,1);
plot(x_hat(:,1),'LineWidth',2.0);
title("x_t(1)")
subplot(2,1,2);
plot(x_hat(:,2),'LineWidth',2.0);
title("x_t(2)")
saveas(fig, "traj_comp.png");