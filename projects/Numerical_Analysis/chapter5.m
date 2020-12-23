%y' = 1 + y2, y(0) = 0 
f = @(x,y)(1 + y^2);
a = 0;
b = 1;
N = 50;
h = (b-a)/N;
% eular
t = linspace(a,b,N);
