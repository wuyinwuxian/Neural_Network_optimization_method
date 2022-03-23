%  function [r, history, yt, iter] = Adam(x0, N, bs, data, alpha, beta)
clear all
clc
load mydata
N = length(data);
x0 = [20;2];
%Adam
maxiter = 1e5;
lr = 0.05;
bs = 30;
track7 = zeros(maxiter,2);
history7 = zeros(maxiter,1);
tic
iter = 0;
index = 0;
s = 0;                         %��������
r = 0;                         %�ݶ��ۻ�ƽ����
r1 = 0;
r2 = 0;
v = 1e-7;                      %��Ӧֵ
alpha = 0.9;                   %˥��ϵ��1
beta = 0.9;                    %˥��ϵ��2
lambda = 0.99;                 %һ�׶���ϵ����˥������
gamma = 0.9;
tic
while (1)
    sample = data(:,index*bs + 1:(index+1)*bs);
    grad = num_grad(@(x) objfun3(x,sample), x0);             %�����ݶ�
%     alpha = alpha*lambda^iter;                               %����һ�׶���ϵ��
    s = alpha*s + (1 - alpha)*grad;                          %ȷ����������
    r = beta*r  + (1 - beta)*grad.*grad;                     %�ۼ��ݶ�ƽ����
    r2 = gamma*r2 + (1 - gamma)*r;
    r1 = max(r1,r2);
    iter = iter + 1;
    s1 = s/(1 - alpha^iter);                                       %��������ƫ��
%     r1 = r2/(1 - beta^iter);                                       %�����ۻ�ƫ��
    x1 = x0 - (lr*s1./(v+r1.^0.5));                                %����
    x0 = x1;
    
    history7(iter) = objfun1(x0,data);
    track7(iter,:) = x0; 
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
plot(history7)
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
l = track7(:,1);
k = track7(:,2);
plot(k,l,'r-')
hold off
xlabel('b�����Ż�����1��')
ylabel('a�����Ż�����2��')
title('�ȸ���ͼ','FontSize',12)
legend('�ȸ���','�˶��켣')