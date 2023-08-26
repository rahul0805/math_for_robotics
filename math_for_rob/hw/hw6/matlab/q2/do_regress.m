function [y_regress,dy_dt_regress] = do_regress(y,t)

dy_dt_regress = zeros(1, length(y));
y_regress = zeros(1, length(y));
for i = 4 : length(y)
    y_window = [y(i - 3) ;y(i - 2); y(i - 1); y(i)];
    moving_window = [t(i-3); t(i-2); t(i-1); t(i)];
    A = [ones(4,1), moving_window, moving_window.^2];
    alpha_hat = inv(A' * A)*A'*y_window;
    dy_dt_regress(i) = alpha_hat(2) + 2*alpha_hat(3) * t(i);
    y_regress(i) = alpha_hat(1) + alpha_hat(2)*(t(i)) + alpha_hat(3) * (t(i)^2);
end

end

