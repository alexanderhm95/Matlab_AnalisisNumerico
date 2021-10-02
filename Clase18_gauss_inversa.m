clc;
clear;
format long;
format rat;
disp('METODO Gauusss')
%a = [3 2 5;2 -1 4; -1 2 1];
a=[2 3;2 2];
b = gauss_inv(a);
c = inv(a);
disp('==================================')
disp('=====MATRIZ INICIAL=================== ')
disp('\n'+a)
disp('==================================')
disp('=====METODO GAUSS==================')
disp(b)
disp('==================================')
disp('=====FUNCION DE PRUEBA MATLAB=========')
disp(c)
disp('==================================')
disp('=====DETERMINANTE DE LA MATRIZ=========')
da=det(a);
disp(da)
function b = gauss_inv(a)
% Encuentra las dimensiones de la matriz de entrada
[r,c] = size(a);

%Si la matriz de entrada no es cuadrada,  se debe detener la función
if r ~= c
    disp('Solo puede ingresar matrices cuadradas')
    b = [];
    return
end

% Matriz de identidad objetivo que se transformará en la salida
%inversa de la matriz
b = eye(r);
%crea una matriz con valores de uno en su diagonal. magic: crea una matriz
%cuadrada, en la que la suma de los renglones, columnas o diagonales suman el mismo valor
% El siguiente código realmente realiza la inversión de la matriz trabajando
% en cada elemento de la entrada
for j = 1 : r
    for i = j : r
        if a(i,j) ~= 0
            for k = 1 : r
                s = a(j,k);
                a(j,k) = a(i,k);
                a(i,k) = s;
                s = b(j,k); b(j,k) = b(i,k); b(i,k) = s;
            end
            t = 1/a(j,j);
            for k = 1 : r
                a(j,k) = t * a(j,k);
                b(j,k) = t * b(j,k);
            end
            for L = 1 : r
                if L ~= j
                    t = -a(L,j);
                    for k = 1 : r
                        a(L,k) = a(L,k) + t * a(j,k);
                        b(L,k) = b(L,k) + t * b(j,k);
                    end
                end
            end
        end
        break
    end
    
    % Muestra una advertencia si se encuentra una fila llena de ceros
    if a(i,j) == 0
        disp('Advertensia: Matriz Singular')
        b = 'error';
        return
    end
end
% Mostrar la evolución de la matriz de entrada, de modo que podamos
% confirma que se convirtió en una matriz de identidad.
disp(a)
end