% Initialize values
A = diag([0.5, 1, 1, 0.5, 1]);
B = [3, 0, 2, 0, 1]';
C = 0.25;
D = B';
%% Function call
A_inv = inv(A);
output_matrix = matrix_lemma(A, B, C, D, A_inv)
req_ans = inv(A+(B*C*D))