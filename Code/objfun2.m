function loss = objfun2(theta,sample)
x = sample(1);
y = sample(2);
loss =  0.5*(myfun(x,theta) - y)^2;
