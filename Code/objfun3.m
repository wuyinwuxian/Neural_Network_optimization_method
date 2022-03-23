function loss = objfun3(theta,data1)
x = data1(1,:);
y = data1(2,:);
N = length(x);
loss = 0;
for i = 1:N
    loss = loss + 0.5*(myfun(x(i),theta) - y(i))^2;
end
loss = loss/N;
