% 复合梯形公式与Simpson公式==>辛普森不用复合,单纯分段
simpson = @(fa,fb,fc,h) (fa+4*fc+fb)*(h/6);
%第一题
start = 0;
ends = 1;
h = 1e-4;
n = round((ends-start)/h); %区间数量,点的数量要再+1
Fx1 = zeros(1,n);
f1 = @(x)(exp(-0.5*x.^2));
i = 1;
ansSimpson1 = simpson(f1(start),f1(start+h),f1(start+h/2),h);
while i<n
    a = i * h;
    b = a + h;
    c = a + h/2;
    Fx1(1,i) = f1(a);
    ansSimpson1 = ansSimpson1 + simpson(f1(a),f1(b),f1(c),h);
    i = i + 1;
end
fa = f1(start);
fb = f1(ends);
ansTrapezoid1 = trapezoid(fa,fb,Fx1,h);
ansTrapezoid1 = ansTrapezoid1 / sqrt(2*pi);
ansSimpson1 = ansSimpson1 / sqrt(2*pi);
%第二题
start = 1;
ends = 6;
h = [0.5;0.25;0.125];
f2 = @(x)(2+sin(2*sqrt(x)));
ansSimpson2 = zeros(1,3);
ansTrapezoid2 = zeros(1,3);
n = (ends-start)./h; %切片数量
Fx2 = zeros(1,n(3,1)-1);
i = 1;
while i<n(3,1)
    Jmin = 3;
    if i<10
        Jmin = 1;
    elseif i<20
        Jmin = 2;
    end
    for j=Jmin:3
        a = i * h(j,1);
        b = a + h(j,1);
        c = a + h(j,1)/2;
        Fx2(j,i) = f2(a);
        ansSimpson2(1,j) = ansSimpson2(1,j) + simpson(f2(a),f2(b),f2(c),h(j,1));
    end
    i = i + 1;
end
fa = f2(start);
fb = f2(ends);

%Simpson加上第一个区间
for j=1:3
    ansSimpson2(1,j) = ansSimpson2(1,j) + simpson(f2(start),f2(start+h(j,1)),f2(start+h(j,1)/2),h(j,1));
    ansTrapezoid2(1,j) = trapezoid(fa,fb,Fx2(j,1:n(j,1)-1),h(j,1));
end
q2 = integral(f2,1,6);
q1 = integral(f1,0,1)/sqrt(2*pi);