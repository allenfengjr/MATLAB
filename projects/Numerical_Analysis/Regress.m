%%假定总评价得分y均与个可能影响因素评分均为一元线性关系
clear all;

qclgpj=xlsread('/Users/fenghao/Desktop/qclgpj.xlsx');
Y=qclgpj(:,5);
%%剔除奇异点
Y=qclgpj(:,5);
X1(:,1:1)=qclgpj(:,1:1);
X2(:,1:1)=qclgpj(:,2:2);
X3(:,1:1)=qclgpj(:,3:3);
X4(:,1:1)=qclgpj(:,4:4);
X_c(:,1:1)=ones(size(Y));
%%X为临时变量，用于传递自变量参数矩阵
X=[X1,X2,X3];
%[b1,bint1,r1,rint1,s1]=regress(Y,X);
%%二次项引入
X1_2=X1.*X1;
X2_2=X2.*X2;
X3_2=X3.*X3;
X4_2=X4.*X4;
%%三次项引入
X1_3=(X1.*X1).*X1;
X2_3=(X2.*X2).*X2;
X3_3=(X3.*X3).*X3;
X4_3=(X4.*X4).*X4;
%%交叉项引入
X1_X2=X1.*X2;
X1_X3=X1.*X3;
X1_X4=X1.*X4;
X2_X3=X2.*X3;
X2_X4=X2.*X4;
X3_X4=X3.*X4;
X=[X1 X2 X3 X4 X1_2 X2_2 X3_2 X4_2 X1_3 X2_3 X3_3 X4_3 X1_X2 X1_X3 X1_X4 X2_X3 X2_X4 X3_X4];
stepwise(X,Y);