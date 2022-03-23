clear all
clc
load SGDloss
load SGDMloss
load Adagradloss
load AdaDeltaloss
load Adamloss
load AMSGradloss
load Adamaloss
plot(SGDloss)
xlabel('迭代次数')
ylabel('损失函数值')
title('损失函数值随迭代次数的变化图','FontSize',12)
