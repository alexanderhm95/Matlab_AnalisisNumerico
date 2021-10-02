clear; clc;
format long
a = 0
b = 10
N = 20
h = (b-a)/N;
x = a:h:b;
[tya] = [(fun(x+h)-fun(x))/h];
[tyd] = [(fun(x)-fun(x-h))/h];
[tyc] = [(fun(x+h)-fun(x-h))/h];
x=x(:);
tya=tya(:);
tyd=tyd(:);
tyc=tyc(:);
table(x,tya,tyd,tyc)
function [y]=fun(x)
    y=3*x.^4+5*x.^3-3*x.^2+8*x-12;
end
