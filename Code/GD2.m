clear all
clc
load mydata
x0 = rand(3,1);
% ÌÝ¶È·¨
maxiter = 2e4;
lr = 0.0005;
history = zeros(maxiter,1);
tic
iter = 0;
index = 0;
tic
while (1)
    index = index + 1;
    sample = data(:,index);
    grad = num_grad(@(x) objfun2(x,sample), x0);
    x1 = x0 - lr*grad;
    x0 = x1;
    iter = iter + 1;
    history(iter) = objfun1(x0,data);
    if index >= 121
        index = 0;
    end
    if iter > maxiter 
        break;
    end
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
