clear all
clc
load mydata1
N = length(data);             %��������
x0 = rand(2,1);               %��ʼ��
bs = 30;                      %ÿ����������Ŀ
alpha = 0.9;                  %һ��˥��ϵ��
beta = 0.999;                 %˥��ϵ��2
tic
% [history, yt, iter] = SGD(x0, N, bs, data);
% [history, yt, iter] = SGDM(x0, N, bs, data, alpha);
% [grad, history, yt, iter] = Adagrad(x0, N, bs, data);
% [r, history, yt, iter] = AdaDelta(x0, N, bs, data, beta);
[r, history, yt, iter] = Adam(x0, N, bs, data, alpha, beta);
toc
