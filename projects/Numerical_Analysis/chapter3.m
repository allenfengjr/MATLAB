%插值多项式
fy = @(x)(sin(x));
dy = @(x)(cos(x));
d2y = @(x)(-sin(x));
x1 = linspace(0,pi,11);
x2 = linspace(0,pi,21);
x = x1;
%自然边界
n = length(x);
a = zeros(1,n);
for i=1:n
    a(1,i) = fy(x(1,i));
end
free = free_spline(10,x1,a);
guzhi = guzhi_spline(10,x1,a,dy(0),dy(pi));