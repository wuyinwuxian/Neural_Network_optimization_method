clear all
clc
load mydata
load SGDtrack;
load SGDMtrack;
load Adagradtrack;
load AdaDeltatrack;
load Adamtrack;
load AMSGradtrack;
load Adamatrack;
figure(1)
m = 99.8 : 0.0002 : 100.2;
n = 4.98 : 0.00002 : 5.02;
z = zeros(2001, 2001);
for w = 1:length(m)
    for j = 1:length(n)
        z(w,j) = objfun3([m(w);n(j)], data);
    end
end
v = 0.00005 :0.00025: 0.1;
contour(n,m,z,v)

hold on
l1 = track1(29000:30000,1);
k1 = track1(29000:30000,2);
plot(k1,l1,'y-')
hold on
l2 = track2(29000:30000,1);
k2 = track2(29000:30000,2);
plot(k2,l2,'m-')
hold on
l3 = track3(290000:300000,1);
k3 = track3(290000:300000,2);
plot(k3,l3,'c-')
hold on
l4 = track4(290000:300000,1);
k4 = track4(290000:300000,2);
plot(k4,l4,'r-')
hold on
l5 = track5(29000:30000,1);
k5 = track5(29000:30000,2);
plot(k5,l5,'g-')
hold on
l6 = track6(290000:300000,1);
k6 = track6(290000:300000,2);
plot(k6,l6,'k-')
hold on
l7 = track7(80000:100000,1);
k7 = track7(80000:100000,2);
plot(k7,l7,'rx')
xlabel('b（待优化参数1）')
ylabel('a（待优化参数2）')
title('等高线图','FontSize',12)
legend('等高线','SGD','SGDM','AdaGrad','AdaDelta','Adam','AMSGrad','Adama')