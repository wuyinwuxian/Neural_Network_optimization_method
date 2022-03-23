% function [history, yt, iter] = SGD(x0, N, bs, data)
clear all
clc
load mydata
N = length(data);
x0 = [10;2];
% 分批随机梯度法
maxiter = 3e4;
lr = 0.005;
bs = 30;
history1 = zeros(maxiter,1);
track1 = zeros(maxiter,2);     %轨迹点
tic
iter = 0;
index = 0;
tic
while (1)
    sample = data(:,index*bs + 1:(index+1)*bs);
    grad = num_grad(@(x) objfun3(x,sample), x0);
    x1 = x0 - lr*grad;
    x0 = x1;
    iter = iter + 1;
    track1(iter,:) = x0; 
    history1(iter) = objfun1(x0,data);
    if iter > maxiter 
        break;
    end
    index = index + 1;
    if index >= floor(N/bs-1)
        index = 0;
    end
end
toc
theta = x0;
%画出损失函数值的变化情况
figure(1);
plot(history1)
% save SGDloss history
xlabel('迭代次数')
ylabel('损失函数值')
title('损失函数值随迭代次数的变化图','FontSize',12)
%画出理想值与目标值之间的差距
figure(2);
x = data(1,:);
y = data(2,:);
N = length(x);
yt = zeros(N,1);
for i = 1:N
    yt(i) =  myfun(x(i),theta);
end
plot(x,y,'r-',x,yt,'o')
xlabel('x')
ylabel('y(实际值) or yt（预测值）')
title('预测结果与实际数值对比','FontSize',12)
legend('y（实际值）','yt（预测值）')
%画出等高线图及优化轨迹
figure(3)
m = 0 : 1 : 200;
n = 0 : 0.1 : 20;
z = zeros(201, 201);
for w = 1:length(m)
    for j = 1:length(n)
        z(w,j) = objfun3([m(w);n(j)], data);
    end
end
v = 1 :10: 2000;
contour(n,m,z,v)
hold on
l = track1(:,1);
k = track1(:,2);
plot(k,l,'r-')
hold off
xlabel('b（待优化参数1）')
ylabel('a（待优化参数2）')
title('等高线图','FontSize',12)
legend('等高线','运动轨迹')