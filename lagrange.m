% INTERPOLACION "POLINOMIO DE LAGRAGE"
clc %permite borrar el area de trabajo
clear %permite borrar las variables almacenadas
format long %permite utilizar la maxima capacidad de la maquina
fprintf('INTERPOLACION "POLINIMIO DE LAGRAGE"\n\n\n');
%fprintf me permite ingresar comentarios de manera textual que pueden
%orientar al usuario en el uso del programa
xi = [0 5 10 20 30 40];
yi = [1.787 1.519 1.307 1.002 0.796 0.653];
%input es un comando de solicitud de entrada de datos del usuario.
n=length(xi);
x=sym('x'); %esta funcion nos permite dejar la variable 'x' como simb�lica
% y asi poder trabajar con ella, sin tener que asignarle un valor.
for j=1:n
    producto=1;
    for i=1:j-1
        producto=producto*(x-xi(i)); %calculo del producto 1 superior de L
    end
    producto2=1;
    for i=j+1:n
        producto2=producto2*(x-xi(i)); %calculo del producto 2 superior de L
    end
    producto3=1;
    for i=1:j-1
        producto3=producto3*(xi(j)-xi(i)); %calculo del producto 3 inferior de L
    end
    producto4=1;
    for i=j+1:n
        producto4=producto4*(xi(j)-xi(i)); %calculo del producto 4 inferior de L
    end
    L(j)=(producto*producto2)/(producto3*producto4); %c�lculos de las L para
    fprintf('\n L%d:\n',j-1) %poder hallar el polinomio
    disp(L(j)) %la funci�n dispo nos permite visualizar variables o texto
    % en el workspace
end
pn=0;
for j=1:n
    pn=pn+L(j)*yi(j); %calculo del polinomio interpolante
end
fprintf('\n POLINOMIO INTERPOLANTE: \n')
%disp(pn) % esta ejecucion la podemos utilizar cuando no necesitamos
%simplicar la expresion
x=input('\nIngrese el punto a aproximar: ');
y=eval(pn); %evaluar el punto en el polinomio
disp('\nLa aproximacion a f(x) es:')
disp(y)