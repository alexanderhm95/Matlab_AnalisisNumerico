clear;clc;
format long
A = [3 -1 -1;-1 3 1;2 1 4];
b = [1 3 7];
[x] = 0;
[y] = 0;
[z] = 0;
tol = 0.01;
c = 1;
m = 1000;
i=1:1:100;
while c < m
    temp =[x y z];
    A = [A;temp];
    x = (1+(1*y)+(1*z))/3;
    y =(3+(1*x)-(1*z))/3;
    z =(7-(1*y)-(2*x))/4;
    if c > 1
        vectAnt = [A(c-1,1) A(c-1,2) A(c-1,3)];
        Etemp = abs(temp(:) - vectAnt(:));
        if Etemp(1)<tol && Etemp(2)<tol && Etemp(3)<tol
            break;
        end
    end
    c = c + 1;
end
i=1:1:length(A);
i=i(:);
table(i,A)



