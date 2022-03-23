clear all
clc
% a = 133.35;
% b = 5.20;
% c = 0.78;
a = 100;
b = 5;
% c = 1;
x = 0:0.1:12;
y = a./(1+exp(b-x));
y1 = y + 0.4*randn(1,length(y));
plot(x,y,'r-',x,y1,'o')
data = [x;y1];
save mydata1 data