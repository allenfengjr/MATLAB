% 复合梯形公式与Simpson公式==>辛普森不用复合,单纯分段
simpson = @(fa,fb,fc,h) (fa+4*fc+fb)*(h/6);
start = 0;
ends = 1;
h = 1e-4;
n = round((ends-start)/h); %切片数量
Fx = zeros(1,n);
f1 = @(x)(exp(-0.5*x^2));
i = 1;
ansSimpson = 0;
while i<=n
    a = i * h;
    b = a + h;
    c = a + h/2;
    Fx(1,i) = f1(a);
    ansSimpson = ansSimpson + simpson(f1(a),f1(b),f1(c),h);
    i = i + 1;
end
fa = f1(start);
fb = f1(ends);
ansTrapezoid = trapezoid(fa,fb,Fx,h);
% 除以常数,减少计算次数
ansTrapezoid = ansTrapezoid / sqrt(2*pi);
ansSimpson = ansSimpson / sqrt(2*pi);

start = 1;
ends = 6;
h = [0.5;0.25;0.125];
f2 = @(x)(2+sin(2*sqrt(x)));
i = 1;
ansSimpson = zeros(1,3);
ansTrapezoid = zeros(1,3);
n = (ends-start)./h; %切片数量
Fx = zeros(1,n);