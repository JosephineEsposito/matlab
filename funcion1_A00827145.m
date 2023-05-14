main()

function[]=main()
    x=input("Teclea el valor de x ");
    n=input("Teclea el valor de n ");
    [serie]=taylor(x,n);
    fprintf("El resultado= %f5.3\n", serie)
end

function[serie]=taylor(x,n)
    serie=0;
    for cual=0:n-1
        serie=serie+x^cual/factorialJE(cual);
    end
end

function[resultado]=factorialJE(num)
    resultado=1;
    for x=num:-1:1
        resultado=resultado*x;
    end
end