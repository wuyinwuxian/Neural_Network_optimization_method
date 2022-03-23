% function [grad, history, yt, iter] = Adagrad(x0, N, bs, data)
clear all
clc
load mydata
N = length(data);
x0 = [10;2];
% Adagrad
maxiter = 3e5;
track3 = zeros(maxiter,2);
lr = 0.5;
bs = 30;
history3 = zeros(maxiter,1);
tic
iter = 0;
index = 0;
r = 0;                         %�ݶ��ۻ�ƽ����
v = 1e-7;                      %Сֵ

tic
while (1)
    sample = data(:,index*bs + 1:(index+1)*bs);
    grad = num_grad(@(x) objfun3(x,sample), x0);             %�����ݶ�
    r = r + grad.*grad;                                      %�ۼ��ݶ�ƽ����
    x1 = x0 - (lr./(v+r.^0.5)).*grad;                         %����
    x0 = x1;
    iter = iter + 1;
    history3(iter) = objfun1(x0,data);
    track3(iter,:) = x0; 
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
%������ʧ����ֵ�ı仯���
figure(1);
plot(history3)
xlabel('��������')
ylabel('��ʧ����ֵ')
title('��ʧ����ֵ����������ı仯ͼ','FontSize',12)
%��������ֵ��Ŀ��ֵ֮��Ĳ��
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
ylabel('y(ʵ��ֵ) or yt��Ԥ��ֵ��')
title('Ԥ������ʵ����ֵ�Ա�','FontSize',12)
legend('y��ʵ��ֵ��','yt��Ԥ��ֵ��')
%�����ȸ���ͼ���Ż��켣
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
l = track3(:,1);
k = track3(:,2);
plot(k,l,'r-')
hold off
xlabel('b�����Ż�����1��')
ylabel('a�����Ż�����2��')
title('�ȸ���ͼ','FontSize',12)
legend('�ȸ���','�˶��켣')