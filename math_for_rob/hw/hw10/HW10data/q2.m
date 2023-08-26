

load SegwayData4KF


phi=zeros(N,1);
theta=zeros(N,1);
phi_dot=zeros(N,1);
theta_dot=zeros(N,1);
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
    t(k)=k*Ts;
    xk=xkp1;
    pk = pkp1;
end
[Kss,Pss] = dlqe(A,G,C,R,Q);

