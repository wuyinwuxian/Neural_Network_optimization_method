clear all
clc
load mydata
x0 = rand(3,1);
% ÌÝ¶È·¨
maxiter = 2e4;
lr = 0.0005;
history = zeros(maxiter,1);
tic
for i = 1:maxiter
    grad = num_grad(@(x) objfun1(x,data), x0);
    x1 = x0 - lr*grad;
    x0 = x1;
    history(i) = objfun1(x0,data);
end
toc
theta = x0;
figure(1)
plot(history)
figure(2)
x = data(1,:);
y = data(2,:);
N = length(x);
yt = zeros(N,1);
for i = 1:N
    yt(i) =  myfun(x(i),theta);
end
plot(x,y,'r-',x,yt,'o')
