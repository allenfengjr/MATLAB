%第九章
VEC_INIT = [1;1;1];
A = [4 ,-1 ,1;
    -1, 3, -2 ;
    1, -2 ,3];
%x的范数为1,幂法为无穷范数,对称幂法为二范数，反幂法没有规定
[u1,x1] = power_method(A,1e-5,100,VEC_INIT);
[u2,x2] = symmetric_power_method(A,1e-5,100,VEC_INIT);
[u3,x3] = inv_power_method(A,1e-5,100,VEC_INIT);