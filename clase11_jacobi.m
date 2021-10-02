% METODO ITERATIVO DE JACOBI
clc; 
clear;
format long; 
fprintf('METODO ITERATIVO DE JACOBI\n========================')
a=[3 -1 1;2 5 -2;1 -1 -3];
 b=[4 -6 6]';
 x=[0 0 0]';
tol=0.00001;
iter=1000;
n=length(b);%numero de elementos del vector b
d=diag(diag(a)); %obtencion de la matriz diagonal
l=d-tril(a); %obtencion de la matriz diagonal superior L
u=d-triu(a);%obtencion de la matriz diagonal inferior u
fprintf('\n SOLUCION:\n')
fprintf('\nLa matriz de transicion de jacobi:\n')

res(b,x,tol,iter,d,l,u)
function [jacobi]=res(b,x,tol,iter,d,l,u)
T=d^-1*(l+u); % matriz de transicion de jacobi
disp(T)
fprintf('\nEl vector constante es::\n')
C=d^-1*b; % vector constante C, para el metodo
disp(C)
i=0;
err=tol+1;
z=[i,x(1),x(2),x(3),err]; %vector que me permite graficar la tabla
while err>tol && i<iter
    xi=T*x+C;
    err=norm(xi-x); 
    x=xi;
    i=i+1;
    z(i,1)=i;
    z(i,2)=x(1);
    z(i,3)=x(2);
    z(i,4)=x(3);
    z(i,5)=err;
end
end