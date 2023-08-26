function dy_dt = naive_der(y,t)
%NAOVE_DER Summary of this function goes here
%   Detailed explanation goes here
dy_dt = t;

for i=2:length(t)
    dy_dt(i) = ((y(i)-y(i-1))/(t(i)-t(i-1)));
end
end

