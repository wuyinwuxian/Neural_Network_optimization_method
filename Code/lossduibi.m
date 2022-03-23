clear all
clc
load SGDloss.mat
load SGDMloss.mat
load Adagradloss.mat
load AdaDeltaloss.mat
load Adamloss.mat
load AMSGradloss.mat
load Adamaloss.mat
plot(history1,'y-','linewidth',1)
axis([0,20000,0,20])
hold on
plot(history2,'m--','linewidth',1)
hold on
plot(history3,'k-','linewidth',1)
hold on
plot(history4,'g:.','linewidth',1)
hold on
plot(history5,'r:','linewidth',1.5)
hold on
plot(history6,'b--','linewidth',1)
hold on
plot(history7,'c:','linewidth',1.5)  
% hold on
% plot(history8,'k')
xlabel('��������')
ylabel('��ʧ����ֵ')
title('��ʧ����ֵ����������ı仯ͼ','FontSize',12)
legend('SGD','SGDM','AdaGrad','AdaDelta','Adam','AMSGrad','Adama')