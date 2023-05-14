%Josephine Esposito - A00827145
main()

function [I]=trapezoidal(a,b,f)
    syms x;
    %I = (h/2)*(fi+2*(fi)+ff);
    n = input("Teclea el numero de intervalos ");
    h = (b - a)/n;
    val = 0;
    fTot = calculaFuncion(f,a);
    for i = a+h:h:b
        fTot = fTot + 2*(calculaFuncion(f , val));
        val = a + h;
    end
    fTot = fTot + calculaFuncion(f, b);
    I = (h/2)*fTot;
end

function [I]=simpson13(a,b,f)
    syms x;
    n = 3;
    while mod(n,2)~= 0
        n = input("Teclea el numero de intervalos que debe ser par ");
    end
    h = (b - a)/ n;
    %fprintf("El valor de h: %i\n", h)
    
    fTot = 0;
    val = 0;
    fTot = fTot + calculaFuncion(f,a);
    %fprintf("El valor de f0: %i\n", fTot);
    m = 0;
    fTot = calculaFuncion(f, val);
    for i = a+h:h:b
        if m == 1
            fTot = fTot + 4*(calculaFuncion(f,val));
            m = m - 1;
        elseif m == 0
            fTot = fTot + 2*(calculaFuncion(f,val));
            m = m + 1;
        end
        val = a + h;
        %fprintf("El valor de val: %i\n",val)
    end
    fTot = fTot + calculaFuncion(f,b);
    I = (h/3)*fTot;
    %I = (h/3)*(fi + 4*(fi) + 2*(fii) + ff);
end

function [fi] = calculaFuncion(f, val)
    syms x;
    fi = subs(f, {x}, val);
    %disp(fi)
end

function main()
    syms x;

    f = input("Teclea la funcion a evaluar ");
    a = input("Teclea el valor inicial ");
    b = input("Teclea el valor final ");
    risp = input("Que reglas deseas utilizar? [T - S] ");
    if risp == "T"
        I = trapezoidal(a,b,f);
        disp(I);
    elseif risp == "S"
        I = simpson13(a,b,f);
        disp(I);
    else
        fprintf("Error: eligir una opcion.\n")
    end
end