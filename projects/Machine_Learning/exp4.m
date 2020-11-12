% logistic regression
x = load('./ex4Data/ex4x.dat');
y = load('./ex4Data/ex4y.dat');
sigma = [0 std(x)];
mu = [1 mean(x)];
m = length(x);
x = [ones(m,1) x];
% should i standardize the data ?
% x(: ,2) = (x(: ,2) - mu(2))./ sigma(2); 
% x(: ,3) = (x(: ,3) - mu(3))./ sigma(3);
pos = find(y==1);
neg = find(y==0); 
hold on 
plot(x(pos, 2), x(pos,3), '+');
plot(x(neg, 2), x(neg, 3), 'o')
% newton method
g = @(z)(1.0 / (1.0 + exp(-z)));
h = @(X)(X>0.5)*1;
theta = zeros(3,1);
for t=1:5
    R = zeros(m,m);
    for i=1:m
        R(i,i) = g(x(i,:)*theta)*g(-x(i,:)*theta);
    end
    Hession = x' * R * x;
    dif_J_theta = zeros(3,1);
    for i=1:m
        dif_J_theta = dif_J_theta + (g(x(i,:)*theta)-y(i,1))*x(i,:)';
    end
    % dif_J_theta = dif_J_theta/m;
    % 这里不应该除以m, 损失函数既然定义成交叉熵,那么求平均并没有意义,与求和是等价的
    % 如果取平均,那么损失函数会减小,只会令J_theta对应的梯度的绝对值减小,使收敛变慢
    theta = theta - Hession\  dif_J_theta;
end
% hyperplane is theta*x = 0 , when ploting consider x2,x3 = x,y
x_plot = 10:70;
y_plot = -theta(2,1)/theta(3,1) * x_plot - theta(1,1)/theta(3,1);
plot(x_plot,y_plot,'g');
Predict_stu = [1 20 80];
% Predict_stu = [1 (20-mu(1,2))/sigma(1,2) (80-mu(1,3))/sigma(1,3)];
disp(1-g(Predict_stu*theta));