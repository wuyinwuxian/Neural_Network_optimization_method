
function df = num_grad(func, X)
h = 1e-5;
df = zeros(length(X), 1);

% for each dimension of objective function
for i=1:length(X)
    % vary variable i by a small amount (left and right)
    x1 = X;
    x2 = X;
    x1(i) = X(i) - h;
    x2(i) = X(i) + h;
    
    % evaluate the objective function at the left and right points
    y1 = feval(func,x1);
    y2 = feval(func,x2);
    
    % calculate the slope (rise/run) for dimension i
    df(i) = (y2 - y1) / (2*h);
end
