%% Loading Data
y = load("./data/HW05_Prob4_Data.mat","f");
Y = cell2mat(struct2cell(y));
t = load("./data/HW05_Prob4_Data.mat","t");
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
saveas(f0,"./results/prob_4_a.png");

%% prob 4_b
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
saveas(f1,"./results/prob_4_b.png");

%% prob 4_c
A = [sin(pi*t), sin(2*pi*t), sin(3*pi*t), sin(4*pi*t), sin(5*pi*t)];
alpha_hat_c = inv(A'*A)*A'*Y;

Y_hat_c = A*alpha_hat_c;

f2 = figure;
plot(t,Y,'r','linewidth',3)
hold on
plot(t,Y_hat_c,'b','linewidth',3)
legend('Original Function','Fitted Curve')
grid on
xlabel('t', 'FontSize',18)
ylabel('f', 'FontSize',18)
hold off
saveas(f2,"./results/prob_4_c.png");

