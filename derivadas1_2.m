clear; clc;
format long;
% Valor de a
a = 0;
% Valor de b
b = 10;
% Valor de N
N = 200;
%Calcular H
h = (b-a)/N;
%Calcular Intervalos
x = a:h:b;
x = x(:);
%Calcular Adelante.
cAd = calcularAde(x, h, N);
%Calcular Atr�s.
cAt = calcularAtr(x, h, N);
%Calcular Centro
cCe = calcularCen(x, h, N);
%Tabla de Resultados.
table(x, cAd, cAt, cCe)

function [f] =  funcion(x)
    f = 3*x.^4 + 5*x.^3 - 3*x.^2 + 8*x - 12;
    %f = sin(2*x^3 + 2*x^2)^2;
end
function [cen] = calcularCen(x, h, N)
    for i=1:N+1
        %cen(i) = ((funcion(x(i)+h)) - (funcion(x(i)-h)))/h;
        %PRIMERA DERIVADA cen(i) = (-funcion(x(i)+(2*h))+8*funcion(x(i)+h)-8*funcion(x(i)-h)-3*funcion(x(i)-(2*h)))/(12*h);
        %SEGUNDA DERIVADA cen(i) = (-funcion(x(i)+(2*h))+16*funcion(x(i)+h)-30*funcion(x(i))+16*funcion(x(i)-h)-funcion(x(i)-(2*h)))/(12*(h^2)); 
        %TERCERA DERIVADA 
        cen(i) = (-funcion(x(i)+(3*h))+8*funcion(x(i)+(2*h))-13*funcion(x(i)+h)+13*funcion(x(i)-h)-8*funcion(x(i)-(2*h))+funcion(x(i)-(3*h)))/(8*(h^3)); 
    end
    cen = cen(:);
end
function [atr] = calcularAtr(x, h, N)
    for i=1:N+1
        %atr(i) = ((funcion(x(i))) - (funcion(x(i)-h)))/h;
        %PRIMERA DERIVADA atr(i) = (3*funcion(x(i))-4*funcion(x(i)-h)+funcion(x(i)-(2*h)))/(2*h);
        %SEGUNDA DERIVADA atr(i) = (2*funcion(x(i))-5*funcion(x(i)-h)+4*funcion(x(i)-(2*h))-funcion(x(i)-(3*h)))/(h^2); 
        %Tercera DERIVADA 
        atr(i) = (5*funcion(x(i))-18*funcion(x(i)-h)+24*funcion(x(i)-(2*h))-14*funcion(x(i)-(3*h))+3*funcion(x(i)-(4*h)))/(2*(h^3));
    end
    atr = atr(:);
end
function [ade] = calcularAde(x, h, N)
    for i=1:N+1
        %ade(i) = ((funcion(x(i)+h)) - (funcion(x(i))))/h;
        %PRIMERA DERIVADA ade(i) = (-funcion(x(i)+(2*h))+4*funcion(x(i)+h)-3*funcion(x(i)))/(2*h);
        %SEGUNDA DERIVADA ade(i) = (-funcion(x(i)+(3*h))+4*funcion(x(i)+(2*h))-5*funcion(x(i)+h)+2*funcion(x(i)))/(h^2);       
        %TERCERA DERIVADA 
        ade(i) = (-3*funcion(x(i)+(4*h))+14*funcion(x(i)+(3*h))-24*funcion(x(i)+(2*h))+18*funcion(x(i)+h)-5*funcion(x(i)))/(2*(h^3));
    end
    ade = ade(:);
end