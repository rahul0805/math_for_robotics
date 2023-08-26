%%% Problem 5
%% Loading Data
y = load("./data/HW05_Prob5_Data.mat","f");
Y = cell2mat(struct2cell(y));
t = load("./data/HW05_Prob5_Data.mat","t");
t = cell2mat(struct2cell(t));

%% PLotting Data
f0 = figure;
plot(t,Y,'r','linewidth',3)
hold on
legend('Original Function')
grid on
xlabel('t', 'FontSize',18)
ylabel('f', 'FontSize',18)
hold off
saveas(f0,"./results/prob_5_data.png");

%% prob 5
A = [ones(length(t),1), t, t.^2, t.^3, t.^4, t.^5];
alpha_hat_a = inv(A'*A)*A'*Y;

Y_hat_a = A*alpha_hat_a;

f1 = figure;
plot(t,Y,'r','linewidth',3)
hold on
plot(t,Y_hat_a,'b','linewidth',3)
legend('Original Function','Fitted Curve')
grid on
xlabel('t', 'FontSize',18)
ylabel('f', 'FontSize',18)
hold off
saveas(f1,"./results/prob_5_data_fit.png");

%% derivative
t = 0.3;
B = [zeros(length(t),1), ones(length(t),1), 2*t, 3*t.^2, 4*t.^3, 5*t.^4];
Y_hat_der_a = B*alpha_hat_a;
