%evaluacion unidad 1
%Por Byron Herrera
%5 de computacion
% Para ejecutar presione F5
clear ;close ;clc;
format long
a = 0;
b = 10;
N = 50;
h = (b-a)/N;
x = a:h:b;
[tya] = [( -5.*fun(x) +18*fun(x+h) -24*fun(x+2.*h) + 14*fun(x+3.*h) -3*fun(x+4.*h)  )/(2*h.^3)];
[tyb] = [( fun(x-3*h) -8*fun(x-2*h) +13*fun(x-h) -13.*fun(x+h) +8*fun(x+2.*h)  -fun(x+3.*h))/(8*h.^3)];
[tyc] = [( 3.*fun(x-4*h) -14*fun(x-3*h) +24*fun(x-2.*h) -18.*fun(x-h) +5*fun(x) )/(2*h.^3)];
x=x(:);
tya=tya(:); tyb=tyb(:); tyc=tyc(:);
table(x,tya,tyb,tyc)
function [y]=fun(x)
    y=3*x.^4 +5*x.^3 -8*x +12;
end