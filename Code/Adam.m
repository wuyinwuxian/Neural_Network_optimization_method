%  function [r, history, yt, iter] = Adam(x0, N, bs, data, alpha, beta)
clear all
clc
load mydata
N = length(data);
x0 = [20;2];
%Adam
maxiter = 3e4;
lr = 0.05;
bs = 30;
track5 = zeros(maxiter,2);
history5 = zeros(maxiter,1);
tic
iter = 0;
index = 0;
s = 0;                         %��������
r = 0;                         %�ݶ��ۻ�ƽ����
v = 1e-7;                      %��Ӧֵ
alpha = 0.9;                   %˥��ϵ��1
beta = 0.9;                  %˥��ϵ��2

tic
while (1)
    sample = data(:,index*bs + 1:(index+1)*bs);
    grad = num_grad(@(x) objfun3(x,sample), x0);             %�����ݶ�
    s = alpha*s + (1 - alpha)*grad;                          %ȷ����������
    r = beta*r  + (1 - beta)*grad.*grad;                     %�ۼ��ݶ�ƽ����
    iter = iter + 1;
    s1 = s/(1 - alpha^iter);                                       %��������ƫ��
    r1 = r/(1 - beta^iter);                                       %�����ۻ�ƫ��
    x1 = x0 - (lr*s1./(v+r1.^0.5));                                %����
    x0 = x1;
    
    history5(iter) = objfun1(x0,data);
    track5(iter,:) = x0; 
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
plot(history5)
xlabel('��������')
ylabel('��ʧ����ֵ')
title('Adam�㷨��ʧ����ֵ����������ı仯ͼ','FontSize',12)
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
title('Adam�㷨Ԥ������ʵ����ֵ�Ա�','FontSize',12)
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
l = track5(:,1);
k = track5(:,2);
plot(k,l,'r-')
hold off
xlabel('b�����Ż�����1��')
ylabel('a�����Ż�����2��')
title('Adam�㷨�ȸ���ͼ','FontSize',12)
legend('�ȸ���','�˶��켣')