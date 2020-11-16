% linear
Linx = load('./ex5Data/ex5Linx.dat');
Liny = load('./ex5Data/ex5Liny.dat');
Logx = load('./ex5Data/ex5Logx.dat');
Logy = load('./ex5Data/ex5Logy.dat');
hold on
plot(Linx,Liny,'*r');
m = length(Linx);
Linx = [ones(m,1),Linx,Linx.^2,Linx.^3,Linx.^4,Linx.^5];
D = [0,ones(1,5)];
D = diag(D);
Linlambda = 10; % change lambda as you want
Lintheta = (Linx'*Linx + Linlambda*D)\Linx'*Liny;
resy = Linx*Lintheta;
y=  @(x)[1,x,x.^2,x.^3,x.^4,x.^5]*Lintheta;
resX = linspace(-1,1,100);
resY = zeros(1,100);
for i=1:100
    resY(1,i) = y(resX(1,i));
end
plot(resX,resY,'g');
%logistic
figure
pos = find(Logy);
neg = find(Logy ==0);
hold on
plot(Logx(pos,1),Logx(pos,2),'+')
plot(Logx(neg,1),Logx(neg,2),'o')
Logx = map_feature(Logx(:,1),Logx(:,2));
h = @(z)(1.0 / (1.0 + exp(-z)));
m = length(Logx);
Loglambda = 1;
Logtheta = ones(28,1)/4; % == > the initial value will change the result
for t=1:10
    R = zeros(m,m);
    hx_y = zeros(m,1);
    for i=1:m
        R(i,i) = h(Logx(i,:)*Logtheta)*h(-Logx(i,:)*Logtheta);
        hx_y(i,1) = h(Logx(i,:)*Logtheta)-Logy(i,1);
    end
    Hession = Logx' * R * Logx + Loglambda*diag([0,ones(1,27)]);
    delta_J_theta = Logx' * hx_y + Loglambda*[0;Logtheta(2:28,1)];
    Logtheta = Logtheta - Hession\delta_J_theta;
end
u = linspace(-1,1.5,200);
v = linspace(-1,1.5,200);
z = zeros(length(u),length(v));
for i = 1:length(u)
    for j = 1:length(v)
        z(i,j) = map_feature(u(i),v(j))*Logtheta;
    end
end
z = z';
contour(u,v,z,[0,0],'LineWidth',2);