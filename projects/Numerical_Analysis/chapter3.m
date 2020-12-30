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
zhouqi = zhouqi_spline(10,x1,a);
feiniujie = feiniujie_spline(10,x1,a);
figure
hold on
for i=1:n-1
    x_tmp = linspace(x1(i),x1(i+1),5);
    disp(x_tmp);
    y_free = chazhi(free,x1,i,x_tmp);
    y_guzhi = chazhi(guzhi,x1,i,x_tmp);
    y_zhouqi = chazhi(zhouqi,x1,i,x_tmp);
    y_feiniujie = chazhi(feiniujie,x1,i,x_tmp);
    plot(x_tmp,y_feiniujie)
end