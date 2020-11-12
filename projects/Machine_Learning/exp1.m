% exp1
x = load('./ex1Data/ex1x.dat');
y = load('./ex1Data/ex1y.dat');
figure 
plot(x,y,'o');
ylabel ('Height in meters');
xlabel('Age in years');
m = length(y);
x = [ones(m,1),x];
% gradient descent
theta = zeros(1500,2);
alpha = 0.07;
for i=1:1500
    for j=1:2
        sumall = 0;
        for k=1:m
            sumall = sumall+(dot(theta(i,:),x(k,:))-y(k,1))*x(k,j);
        end
        theta(i+1,j) = theta(i,j) - (alpha/m) * sumall;
    end
end
% .' 转置，在运算中需要 .*是分别相乘
theta_final = theta(1500,:).';
hold on
plot(x(:,2),x*theta_final,'-');
legend('Training data','Linear regression');
test = [1 3.5;1 7];
hold on
plot(test(:,2),test*theta_final,'gx');
J_vals = zeros(100, 100); % initialize Jvals to
% 100∗100 matrix of 0 ’ s
theta0_vals = linspace(-3, 3, 100); 
theta1_vals = linspace(-1, 1, 100); 
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
        t = [theta0_vals(i); theta1_vals(j)]; 
        for k = 1:m
            J_vals(i,j) = J_vals(i,j)+((x(k,:)*t-y(k,1))^2)/(2*m);
        end
    end
end
J_vals = J_vals';
figure
surf(theta0_vals,theta1_vals,J_vals);
xlabel('\theta_0');ylabel('\theta_1');
figure
contour(theta0_vals,theta1_vals,J_vals,100);
xlabel('\theta_0');ylabel('\theta_1');