clear; clc;
disp('Método de Newton Raphson')
%Damos de alta la variable simbólica X
syms x;
%Introducimos la función,el punto de inicio,así como
%porcentaje de error
f=inline('x^3 - x -1');
ini=-10;
err=0.01;
%Calculamos la derivada de la función
d=diff(f(x),x);
d=inline(d);
ea=100;
j=0;
while ea>err
%Aproximamos la raiz con la fórmula correpondiente
xi=ini-(f(ini)/d(ini));
%Calculamos el porcentaje de error
ea=abs(((xi-ini)/xi)*100);
ini=xi;
j=j+1;
end
%Mostramos los resultados en pantalla (con 3 decimales)
fprintf('\nRaiz= %10.3f en %d Iteraciones',ini,j)