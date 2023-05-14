arregloP = ones(10,10);
indice = 2;
syms x
ecuacion = 2*x^2+3*x+5;
tangent = lintan(ecuacion, indice, arregloP);
%m = coeffs(tan);
disp(tangent)

function[tangente_L]=lintan(ecuacion, indice, arregloP)
    syms x
    tan = diff(ecuacion);
    y = subs(tan,{x},arregloP(1, indice));
    b = subs(tan, {x}, 0);
    m = (y-b)/x;
    tangente_L(1,1) = tan;
    tangente_L(1,2) = m;
    disp(tangente_L)
end

