clear all
clc
load mydata1
N = length(data);             %样本总数
x0 = rand(2,1);               %初始点
bs = 30;                      %每批的样本数目
alpha = 0.9;                  %一阶衰减系数
beta = 0.999;                 %衰减系数2
tic
% [history, yt, iter] = SGD(x0, N, bs, data);
% [history, yt, iter] = SGDM(x0, N, bs, data, alpha);
% [grad, history, yt, iter] = Adagrad(x0, N, bs, data);
% [r, history, yt, iter] = AdaDelta(x0, N, bs, data, beta);
[r, history, yt, iter] = Adam(x0, N, bs, data, alpha, beta);
toc
