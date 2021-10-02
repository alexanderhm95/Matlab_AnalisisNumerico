%regla de simpson 1/3
clear ;
close ; 
clc;
format long;
fun=input('Ingresa la función f(x): ','s');
f=inline(fun);
n=20;
a=0;
b=10;
h=(b-a)/n;
sumai=0;
sumap=0;
for i=1:2:n-1
    sumai=sumai+feval(f,h*i+a);
end
for i=2:2:n-2
    sumap=sumap+feval(f,h*i+a);
end
int=(h/3)*(feval(f,a)+4*sumai+2*sumap+feval(f,b));
disp(['El resultado de la integral es ' num2str(int)])