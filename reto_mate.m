syms x
syms a
syms b
syms c
syms d
j = 0.01*x;
k = 2*0.01*x;
%f = a*sin(0.01*x)+b*cos(0.01*x)+c*sin(2*0.01*x)+d*cos(2*0.01*x);
f = 0.052*x^2-3.39*x+67.42;
ecua1 = f;
ecua2 = diff(ecua1);

disp(ecua1)
disp(ecua2)