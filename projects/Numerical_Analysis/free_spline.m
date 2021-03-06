%修改n为区间数,下标都+1即可
function abcd =free_spline(n,x,a)
abcd = zeros(4,n+1);
h = zeros(1,n);
alpha = zeros(1,n+1);
for i=1:n
    h(1,i) = x(1,i+1) - x(1,i);
end
for i=2:n
    alpha(1,i) = 3*(a(1,i+1)-a(1,i))/h(1,i) - 3*(a(1,i)-a(1,i-1))/h(1,i-1);
end
l = zeros(1,n+1);l(1,1)=1;l(1,n+1)=1;
u = zeros(1,n+1);
z = zeros(1,n+1);
for i=2:n
    l(1,i) = 2*(x(1,i+1)-x(1,i-1)) - h(1,i-1)*u(1,i-1);
    u(1,i) = h(1,i) /l(1,i);
    z(1,i) = (alpha(1,i)- h(1,i-1)*z(1,i-1)) / l(1,i);
end
b = zeros(1,n+1);
c = zeros(1,n+1);
d = zeros(1,n+1);

for j=n:-1:1
    c(1,j) = z(1,j)-u(1,j)*c(1,j+1);
    b(1,j) = (a(1,j+1)-a(1,j))/h(1,j) - h(1,j)*(c(1,j+1)+2*c(1,j))/3;
    d(1,j) = (c(1,j+1)-c(1,j))/(3*h(1,j));
end
abcd = [a;b;c;d];