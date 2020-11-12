Linx = load('./ex5Data/ex5Linx.dat');
Liny = load('./ex5Data/ex5Liny.dat');
Logx = load('./ex5Data/ex5Logx.dat');
Logy = load('./ex5Data/ex5Logy.dat');
hold on
plot(Linx,Liny,'.r');
Linx = [ones(m,1),Linx,Linx.^2,Linx.^3,Linx.^4,Linx.^5];
m = length(Linx);
n = length(Logx);
D = [0,ones(1,5)];
D = diag(D);
lambda = 1; % change lambda as you want
theta = (Linx'*Linx + lambda*D)\Linx'*Liny;