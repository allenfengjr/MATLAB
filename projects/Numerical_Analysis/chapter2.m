% 第二章上机实验
% 第一题:三种方式求根：不动点，牛顿切线法，牛顿割线法
% 不动点法
x0 = 2;
x_fix = zeros(100,1);x_fix(1,1)=x0;
x_newton = zeros(100,1);x_newton(1,1)=x0;
x_secant = zeros(100,1);x_secant(1,1)=x0;
N0 = 100; %最多一百次迭代
i = 1;
while i <N0
    x_fix(i+1,1)=15-2*x_fix(i,1)*x_fix(i,1);
    i=i+1;
end
i = 1;
while i<N0
    x_newton(i+1,1) = 15/(2*x_newton(i,1)+1);
    i = i+1;
end
i = 1;
while i<N0
    x_secant(i+1,1) = x_secant(i,1) - (2*x_secant(i,1)^2+x_secant(i,1)-15)/(4*x_secant(i,1));
    i = i+1;
end
% 第二题:二分法解方程
y1 = @(x) 2 - 3*x - sin(x);
left = 0; right = 1;
y_left = y1(left);
y_right = y1(right);
i = 1;
while i<100
    middle = (left + right)/2;
    y_middle = y1(middle);        
    % 误差不大于0.0005,是哪个误差?
    if abs(y_middle) < 0.0005
        disp(i);
        break
    elseif y_middle*y1(left)>0
        left = middle;
    else
        right = middle;
    end
    i = i + 1;
end
% 第三题:牛顿法解方程
y2 = @(x) 0.5 + x + x^2/4 - x*sin(x) -cos(2*x)/2;
dy2 = @(x) 1+x/2 -sin(x) -x*cos(x) + sin(2*x);
