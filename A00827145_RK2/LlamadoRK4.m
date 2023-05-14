%Josephine Esposito - A00827145
%% ejercicio 1
f = @(x, y) -y + sin(x);
y0 = -1;
h = 0.1;
a = 4;
b = 9.6;
[x,y] = RK4(f,a,b,y0,h);
plot(x,y,'-r')
hold on
g = @(x) 1.5*exp(-x) + 0.5*sin(x) - 0.5*cos(x);
k = g(x);
plot(x,k,'-b')
title('Ejercicio 4')
xlabel('Eje x')
ylabel('Eje y')
legend('-y + sen(x)','1.5*exp(-x) + 0.5*sin(x) - 0.5*cos(x')
disp(('    Tiempo    Xprox    Xanali    Difer'))
disp([x' y' k' (k' - y')])
%
%% ejercicio 2
f = @(x,y) sin(y) + 0*x;
a = 0;
b = 3;
y0 = 1;
h = 0.1;
[x,y]= RK2(f,a,b,y0,h);
plot(x,y,'.b')
title('Ejemplo 2')
xlabel('Eje x')
xlabel('Eje y')
legend('sin(y)')
disp(['    X    Y'])
disp([x' y'])
%
%% ejercicio 3
f = @(t,y) 20 + 7*sin(2*t) + y*0;
y0 = 15;
a = 0;
b = 2.8;
h = 0.1;
[x,y]= RK2(f,a,b,y0,h);
plot(x,y,'.b')
title('Ejemplo 3')
xlabel('Eje t')
ylabel('Eje y')
legend('20 + 7*sin(2*t)')
disp(['    Tiempo    Y'])
disp([x' y'])
%
%% ejercicio 4
f = @(x, y) 3*y - 4*exp(-x);
y0 = 1;
h = 0.1;
a = 0;
b = 2;
[x,y] = RK2 (f,a,b,y0,h);
plot(x,y,'.r')
hold on
g = @(x) exp(-x);
%j = a:h:b;
k = g(x);
plot(x,k,'-b')
title('Ejercicio 4')
xlabel('Eje x')
ylabel('Eje y')
legend('3*y - 4*exp(-x)','exp(-x)')
disp(('    Tiempo    Xprox    Xanali    Difer'))
disp([x' y' k' (k' - y')])
%
%% ejercicio 5
f = @(x,y) (y+1)*(x+1)*cos(x^2 + 2*x);
fa = @(x) 5*exp((1/2)*sin(x.^2 + 2*x)) -1;
y0 = 4;
a = 0;
b = 2;
h = 0.1;
[x,y] = RK2 (f,a,b,y0,h);
plot(x,y,'.b')
hold on
g = fa(x);
plot(x,g,'ok')
title('Ejercicio 5')
xlabel('Eje x')
ylabel('Eje y')
legend('(y+1)*(x+1)*cos(x^2 + 2*x)','5*exp((1/2)*sin(x^2 + 2*x)) -1')
disp(('    X    Yprox    Yanali    Difer'))
disp([x' y' g' (g' - y')])
hold off
%