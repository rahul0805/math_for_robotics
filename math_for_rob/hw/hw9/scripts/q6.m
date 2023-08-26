A = [1,2;
    3,4;
    5,6;
    ];
[Q1, R1] = qr(A,0)
[Q2, R2] = qr(A)

% a1 = [1;3;5;];
% a2 = [2;4;6;];
% 
% norm(a1)
% aa1 = a1/norm(a1)
% cc = (a2'*aa1)
% a3 = cc*aa1
% aa2 = a2 - a3
% norm(aa2)
% aa2 = aa2/norm(aa2)
% 
% (a1'*aa1)
% (a1'*aa2)
% (a2'*aa1)
% (a2'*aa2)
