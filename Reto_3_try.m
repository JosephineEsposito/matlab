syms x
syms a
syms b
syms c
syms d
ecuacion = input("Scrivi la equazione ordinada per grado includendo quelli mancanti: ");

coeficiente = coeffs(ecuacion); %dal grado piu piccolo a quello piu grande
coeficiente = fliplr(coeficiente); %fa il flip di quelli di sopra
disp(coeficiente)

%raices = roots(coeficiente); %funzione che utilizza la regola del discriminante, per questo gli passiamo solo i coefficienti
%disp(raices)

derivada1 = diff(ecuacion);
derivada2 = diff(derivada1);
disp(derivada1)
disp(derivada2)