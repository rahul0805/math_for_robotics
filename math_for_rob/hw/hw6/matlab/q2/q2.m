load ./data/DataHW06_Prob2

fig1 = figure();
plot(t,y,'r','linewidth',3);
grid on
xlabel('t','FontSize',18);
ylabel('f','FontSize',18);

dy_dt = naive_der(y,t);
[y_regress,dy_dt_regress] = do_regress(y,t);

fig2 = figure();
hold on
plot(t,dy,'r','linewidth',3);
plot(t,dy_dt,'b','linewidth',1);
grid on
xlabel('t','FontSize',18);
ylabel('f','FontSize',18);
hold off


fig3 = figure();
hold on
plot(t,y,'r','linewidth',3);
plot(t,y_regress,'b','linewidth',1);
grid on
xlabel('t','FontSize',18);
ylabel('f','FontSize',18);
hold off

fig4 = figure();
hold on
plot(t,dy,'r','linewidth',3);
plot(t,dy_dt_regress,'b','linewidth',1);
grid on
xlabel('t','FontSize',18);
ylabel('f','FontSize',18);
hold off


