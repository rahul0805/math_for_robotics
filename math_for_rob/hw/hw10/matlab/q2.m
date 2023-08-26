

load ../HW10data/SegwayData4KF


phi=zeros(N,1);
theta=zeros(N,1);
phi_dot=zeros(N,1);
theta_dot=zeros(N,1);

k1=zeros(N,1);
k2=zeros(N,1);
k3=zeros(N,1);
k4=zeros(N,1);

xk=x0;
pk = P0;

t=zeros(1,N);
for k =1:N
    uk=u(k);
    K = (pk*C')*(inv((C*pk*C')+ Q));
    xkp1=A*xk+B*uk + A*K*(y(k)-(C*xk));
    pkp1= (A*(pk - (K*C*pk))*A') + (G*R*G');
    phi(k)=[1 0 0 0]*xkp1;
    theta(k)=[0 1 0 0]*xkp1;
    phi_dot(k)=[0 0 1 0]*xkp1;
    theta_dot(k)=[0 0 0 1]*xkp1;
    
    k1(k) = K(1);
    k2(k) = K(2);
    k3(k) = K(3);
    k4(k) = K(4);
    
    t(k)=k*Ts;
    xk=xkp1;
    pk = pkp1;
end

[Kss,Pss] = dlqe(A,G,C,R,Q);

fig1 = figure();
subplot(2,1,1);
plot(t, phi);
title("phi");
subplot(2,1,2);
plot(t, theta);
title("theta");


fig2 = figure();
subplot(2,1,1);
plot(t, phi_dot);
title("phi dot");
subplot(2,1,2);
plot(t, theta_dot);
title("theta dot");

fig3 = figure();
subplot(2,2,1);
plot(t, k1, 'b', t,Kss(1)*ones(length(k1)), 'r');
title("k1");
subplot(2,2,2);
plot(t, k2, 'b', t,Kss(2)*ones(length(k2)), 'r');
title("k2");
subplot(2,2,3);
plot(t, k3, 'b', t,Kss(3)*ones(length(k3)), 'r');
title("k3");
subplot(2,2,4);
plot(t, k4, 'b', t,Kss(4)*ones(length(k4)), 'r');
title("k4");


