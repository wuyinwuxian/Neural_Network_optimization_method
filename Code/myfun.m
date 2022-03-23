function y = myfun(x,theta)
a = theta(1);
b = theta(2);
% c = theta(3);
y = a./(1+exp(b-x));