%Byron Herrera%
%5to A Computacion%
clear; clc;
format long;

%Variables iniciales
a = 1;
b = 2;
N = 10;
h = (b-a)/N;
x = a:h:b;
n = 0:1:N;
ye = zeros(1,N+1);
eu = calEuler(x,ye,h);
yh = zeros(1,N+1);
he = calHeun(x,ye,yh,h);

disp(table(n(:),x(:),eu(:),he(:)))
function [yh] = calHeun(x,ye,yh,h)
    ye(1) = 1; 
    yh(1) = 1;
    for i=1:length(ye)-1
        ye(i+1) = ye(i) + h * fun(x(i),ye(i));
        yh(i+1) = yh(i) + (h*(fun(x(i),yh(i))+fun(x(i+1),ye(i+1))))/2;
        ye(i+1) = yh(i+1);
    end
end
function [y] = calEuler(x,y,h)
    y(1) = 1; %Y1 inicial
    for i=1:length(y)-1
        y(i+1) = y(i) + h * fun(x(i),y(i));
    end
end
function [f] = fun(x,y)
    f = 0.4*x*y;
    %f = cos(2*x) + sin(3*x);
end
