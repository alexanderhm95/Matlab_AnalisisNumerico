%regla de simpson 3/8
clear ;
close ; 
clc;
format long;
f=inline('x.^4.*(5-x.^2)');
n=20;
a=0;
b=10;
h=(b-a)/n;
sumai=0;
sumap=0;
for i=1:1:n-1
    sumai=sumai+feval(f,h*i+a);
end
int=((3*h)/8)*(feval(f,a)+3*sumai+feval(f,b));
disp(['El resultado de la integral es ' num2str(int)])