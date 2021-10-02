clear; clc;
format long;
fprintf('=====================================================\n')
fprintf('RESOLUCION DE ECUACIONES DIFERENCIALES POR MEDIO METODO DE EULER\n')
fprintf('=====================================================\n')
%POR: Byron Alexander Herrera Martinez%
%iEcuacion de caso de prueba f( 0.4*x*y ) cos(2*x)+sin(3*x)
f=input('\nIngrese la ecuacion diferencial de la forma: dy/dx=f(x,y)\n','s');
a=input('\nIngrese el primer punto a:\n');
b=input('\nIngrese el segundo punto b:\n');
%Condicion de caso de prueba 1
y0=input('\nIngrese la condicion inicial y(x0):\n');
%Numero de saltos =1
n=input('\nIngrese el numero de pasos n:\n');
h=(b-a)/n;
xs=a:h:b;
y1=y0;
for i=1:n
it=i-1;
a=xs(i);
x=a;
b=xs(i+1);
y=y0;
y1=y0+h*eval(f);
fprintf('\n%10.2f%10.6f\n',xs(i+1),y1);
y0=y1;
end
fprintf('\n El punto aproximado y(x1) es = %10.6f\n',y1);
