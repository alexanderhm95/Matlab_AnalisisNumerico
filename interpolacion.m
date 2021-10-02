clear; clc;
format long;
n = input('Ingrese el grado: ');

xi = 3;
x = [0 5 10 20 30 40];
y = [1.787 1.519 1.307 1.002 0.796 0.653];
l=linspace(1,40,100);
gp=[];
for s=1:length(l)
    gp=[gp,interpol(x,y,l(s),n)];
end
plot(x,y,"*"), hold on
plot(l,gp)
[r,p] = interpol(x,y,xi,n);
fprintf('Resultado = %2.8f\n',r)
fprintf('Polinomio = \n%s\n',p)

function [r,p] = interpol(px,py,xi,n)
%n=length(px);
%n=n-1;
syms x;
p = 0;
for i = 1:n
    L = 1;
    for j = 1:n
        if i ~= j
            L = L * (x - px(j)) / (px(i) - px(j));
        end
    end
    p = p + L * py(i);
end
p = expand(p);
x = xi;
r = eval(p);
end