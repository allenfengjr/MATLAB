function integral =trapezoid(fa,fb,Fx,h)
integral = fa+fb;
n = length(Fx);
for i =1:n
    integral = integral + 2*Fx(1,i);
end
integral = integral * (h/2);