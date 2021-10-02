%Newtoon
clear;clc;
format long
error = 0.01;
eTemp = 20;
f=inline('x.^3-x-1');
c = 1;
x = [];
x = [x,0.0];
while eTemp > error
    rDer = double(secDer(x(c)));
    if rDer ~= 0.0
        rpol = f(x(c));
        resultado = x(c) - (rpol / rDer);  
        if c > 2
            eTemp = abs(x(c) - x(c-1));
        end
        if eTemp > error
            x = [x,resultado]; 
        end
        c = c +1;
    end
    
end



