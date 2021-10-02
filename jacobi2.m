% METODO ITERATIVO DE JACOBI
clc 
clear
format long 
fprintf('METODO ITERATIVO DE JACOBI\n\n\n')
%A=[3 -1 1;2 5 -2;1 -1 -3];
  %b=[4 -6 6]';
  A=[-4 1 2 ;2 4 -1 ;1 1 -3];
  b=[9 -5 -9];
 x=[1 1 1]';
tol=0.00001;
m=1000;
jacobimetodo(A,b,x,tol,m);

function jacobimetodo(A,b,x,tol,m)
n=length(x);
for k=1:m
    w=x;
    for i=1:n
        s=A(i,1:i-1)*w(1:i-1)+A(i,i+1:n)*w(i+1:n);
        x(i)=(b(i)-s)/A(i,i);
    end
    if norm(w-x,inf)<tol
        return
    end
    fprintf('\n la solucion del sistema en la iteracion %4.0f\n',k)
    for i=1:n
        fprintf(' x(%1.0f)=%6.8f\n',i,x(i))
    end
end
end