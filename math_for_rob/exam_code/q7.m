x = readmatrix("./data_1/x.csv" );
u = readmatrix("./data_1/u.csv" );

H = [];
z = [];
Q = [];

 for i = 1:999
     
    H_add = [x(i,2),0,0;
     0, x(i,2), u(i)];
    z_add = [x(i+1,1)-x(i,1);x(i+1,2)];
    Q_add = [0.02,0;
    0,0.01;];

    H_new = [H;
           H_add];
    z_new = [z;z_add];
    if(~isempty(Q))
        Q_new = [Q,zeros(length(Q(:,1)),2);
               zeros(2,length(Q(1,:))),Q_add];
    else
        Q_new = Q_add; 
    end
    
    H = H_new;
    Q = Q_new; 
    z = z_new;
 end
 
Q_in = inv(Q);
est_mat = inv((H')*Q_in*H)*(H')*Q_in;
theta_est = est_mat*z;

x_new = validate_dyn(theta_est, x(80,:)', u(80));