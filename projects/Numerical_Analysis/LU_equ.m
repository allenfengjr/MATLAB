% 函数功能：实现Ax=b的LU分解求解，其中A为n阶矩阵，将其分解为LU的形式
% 输入：矩阵A，b
% 输出：得到的解矩阵x
% 顺序主子式均不等于0，对称正定矩阵，严格对角占优矩阵时可以使用

function x = LU_equ(A, b)
[~, n] = size(A);
%方阵的LU分解(Doolittle分解)
y = b; % 把b放入增广矩阵，分解后得到y
A(2: n, 1) = A(2: n, 1) / A(1, 1); % 先求第一列的L矩阵，第一行不变不用求
for k = 2: n % 第k行/列循环
    A(k, k: n) = A(k, k: n) - A(k, 1: k - 1) * A(1: k - 1, k: n); % 计算第k行的U矩阵
    A(k + 1: n, k) = (A(k + 1: n, k) - A(k + 1: n, 1: k - 1) * A(1: k - 1, k)) / A(k, k); % 计算第k列的L矩阵
    y(k, :) = y(k, :) - A(k, 1: k - 1) * y(1: k - 1, :); % 用同样的方法对b分解
end

% 转化为求解方程组LU=A,Ux=y
x = UTri_equ(A, y);

end