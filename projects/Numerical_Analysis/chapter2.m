% 第二章上机实验
% 第一题:三种方式求根：不动点，牛顿切线法，牛顿割线法
% 不动点法
x0 = 2;
N0 = 54; %最多迭代次数
x_fix = zeros(N0,1);x_fix(1,1)=x0;
x_newton = zeros(N0,1);x_newton(1,1)=x0;
x_secant = zeros(N0,1);x_secant(1,1)=x0;
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
err=0.0005;
ans2 = binary(left,right,y1,err);
% 第三题:牛顿法解方程
y2 = @(x) 0.5 + x + x^2/4 - x*sin(x) -cos(2*x)/2;
dy2 = @(x) 1+x/2 -sin(x) -x*cos(x) + sin(2*x);
x0 =[pi/2 5*pi 10*pi];
x_newton_init =  [x0 ;zeros(N0-1,3)];
while i<N0
    for j=1:3
        x_newton_init(i+1,j) = x_newton_init(i,j) -...
               y2(x_newton_init(i,j))/dy2(x_newton_init(i,j)); 
    end
    i = i + 1;
end
% 第四题：错位法
y3 = @(x)(5*x-exp(x));
dy3 = @(x)(5-exp(x));