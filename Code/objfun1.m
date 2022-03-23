function loss = objfun1(theta,data)
x = data(1,:);
y = data(2,:);
N = length(x);
loss = 0;
for i = 1:N
    loss = loss + 0.5*(myfun(x(i),theta) - y(i))^2;
end
loss = loss/N;
