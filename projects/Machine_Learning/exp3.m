% exp1
blue = load('./ex3Data/ex3blue.dat');
green = load('./ex3Data/ex3green.dat');
red = load('./ex3Data/ex3red.dat');
hold on
axis([0 10 0 10]);
plot(blue(:,1),blue(:,2),'*b');
plot(green(:,1),green(:,2),'*g');
plot(red(:,1),red(:,2),'*r');
% 因为每个label的都一样，所以简化处理了
m = length(green);
label = zeros(1,m);
label(:,:) = 1;
% Within-class scatter
u_blue = mean(blue);
u_green = mean(green);
u_red = mean(red);
u = (u_blue + u_green + u_red)/3;
Sw_blue = zeros(2,2);
Sw_green = zeros(2,2);
Sw_red = zeros(2,2);
for i = 1:m
    Sw_blue = Sw_blue + (blue(i,:) - u_blue)' * (blue(i,:) - u_blue);
    Sw_green = Sw_green + (green(i,:) - u_green)' * (green(i,:) - u_green);
    Sw_red = Sw_red + (red(i,:) - u_red)' * (red(i,:) - u_red);
end
Sw = Sw_blue + Sw_green + Sw_red;
Sb = m*((u_blue - u)' * (u_blue - u)+...
        (u_green - u)' * (u_green - u)+...
        (u_red - u)' * (u_red - u));
invSw_Sb = Sw \ Sb;
[V,D] = eig(invSw_Sb);
% eigenvector C-1
W1 = V(:,1);
W2 = V(:,2);
t = 0:10;
k = W1(2,1)/W1(1,1); %斜率
[line_1] = t.*W1(:,:);
plot(line_1(1,:),line_1(2,:));
project_matirx = [1 k; k k*k]./(1+k*k);
project_blue = zeros(m,2);
project_green = zeros(m,2);
project_red = zeros(m,2);
for i =1:m
    project_blue(i,:) = blue(i,:)*project_matirx;
    project_green(i,:) = green(i,:)*project_matirx;
    project_red(i,:) = red(i,:)*project_matirx;
end
plot(project_blue(:,1),project_blue(:,2),'.b');
plot(project_green(:,1),project_green(:,2),'.g');
plot(project_red(:,1),project_red(:,2),'.r');