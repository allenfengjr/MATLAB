% 三种方式求根：不动点，牛顿切线法，牛顿割线法
% 不动点法
x0 = 2;
x_fix = zeros(1,100);x_fix(1,1)=x0;
x_newton = zeros(1,100);x_newton(1,1)=x0;
x_secant = zeros(1,100);x_secant(1,1)=x0;
N0 = 100; %最多一百次迭代
i = 1;
while i <N0
    x_fix(1,i+1)=15-2*x_fix(1,i)*x_fix(1,i);
    i=i+1;
end
i = 1;
while i<N0
    x_newton(1,i+1) = 15/(2*x_newton(1,i)+1);
    i = i+1;
end
i = 1;
while i<N0
    x_secant(1,i+1) = x_secant(1,i) - (2*x_secant(1,i)^2+x_secant(1,i)-15)/(4*x_secant(1,i));
    i = i+1;
end

% 牛顿法解方程
y = 0.5 + x + x^2/4 - x*sin(x) -cos(2*x)/2;