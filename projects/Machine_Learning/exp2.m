x = load('./ex2Data/ex2x.dat');
y = load('./ex2Data/ex2y.dat');
m = length(y);
x = [ones(m,1) x];
% normal equation
theta_normal =inv(x'*x)*x'*y;
predict = [1 1650 3];
answer1 = predict*theta_normal;
disp(answer1);
% select A learning rate using J(theta)
sigma = std(x);
mu = mean(x);
x(: ,2) = (x(: ,2) - mu(2))./ sigma(2); 
x(: ,3) = (x(: ,3) - mu(3))./ sigma(3);
theta = zeros(3,2);%这次不需要记录了，直接迭代
% 疑问,在迭代的过程中,按说先更新哪个向量是无关的,
% 但是如果提前迭代了分量会对下一个有影响
J = zeros(100,1);
alphas =[0.01,0.03,0.1,0.5];
color = ['g-','b-','k-','r-'];
figure
for times = 1:4
    theta = zeros(3,2);
    for i=1:100
        J(i,1)=0;
        for j=1:3
            sumall = 0;
            for k=1:m
                sumall = sumall+(dot(x(k,:),theta(:,mod(i,2)+1))-y(k,1))*x(k,j);
            end
            theta(j,mod(i+1,2)+1) = theta(j,mod(i,2)+1) - (alphas(1,times)/m) * sumall;
        end
        J(i,1)=J(i,1)+(x*theta(:,mod(i,2)+1)-y)'*(x*theta(:,mod(i,2)+1)-y)/(2*m);
    end
    hold on
    plot(0:99,J(1:100),color(1,times))
end
xlabel('Number of iterations')
ylabel('Cost J')
predict(: ,2) = (predict(: ,2) - mu(2))./ sigma(2); 
predict(: ,3) = (predict(: ,3) - mu(3))./ sigma(3);
answer2 = predict*theta(:,1);
disp(answer2);
