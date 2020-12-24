%y' = 1 + y2, y(0) = 0 
f1 = @(t,y)(1 + y^2);
fy1 = @(x)(tan(x));
a = 0;b = 1;
N = 50;
h = (b-a)/N;
% eular
t = linspace(a,b,N+1);
Euler_Explicit = zeros(1,N);
Euler_Explicit(1,1) = 0;
Trapezoid = zeros(1,N);
Trapezoid(1,1) = 0;
Runge_Kutta_ans = zeros(1,N);
Runge_Kutta_ans(1,1) = 0;
Analytical_expression = fy1(t);

for i=2:N+1
    %欧拉显格式
    Euler_Explicit(1,i) = Euler_Explicit(1,i-1) + h*f1(t(1,i-1),Euler_Explicit(1,i-1));
    %梯形预估修正
    %先使用w(i+1) = w(i)+h*f(t(i),w(i))预估,然后带入隐士修正w(i+1),最后用梯形公式
    Trapezoid(1,i) = Trapezoid(1,i-1)...
        +(h/2)*(f1(t(1,i-1),Trapezoid(1,i-1)) +...
        f1(t(1,i),Trapezoid(1,i-1)+h*f1(t(1,i-1),Trapezoid(1,i-1))));
end
%龙格库塔四阶
Runge_Kutta_ans = Runge_Kutta(t,f1,Runge_Kutta_ans,h);

%Adam四阶预测校正算法
f2 = @(t,y)((t-y)/2);
fy2 = @(t)((t+3*exp(-t/2)-2));
a=0;b=3;
h = [1,0.5,0.25,0.125];
for i=4:4
    N = (b-a)./h(1,i);
    t = linspace(a,b,N+1);
    Adam_res = zeros(1,N);
    Adam_res(1,1)=1;
    Adam_res = Adam_Fourth_Order_Predictor_Corrector(t,f2,Adam_res,h(1,i));
end
Analytical_expression_Adam = fy2(t);
