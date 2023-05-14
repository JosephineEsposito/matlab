main()

function[numfibo]=main()
    numfibo=input("Teclea la cantidad de terminos a evaluar ");
    suma=fibo(numfibo)+2;
    fprintf("La suma total es de %i", suma)
end

function[suma]=fibo(numfibo)
    fib=1:1:numfibo;
    fib(1)=0;
    fib(2)=1;
    fib(3)=1;
    suma=0;
    for i=4:1:numfibo+1
        fib(i)=fib(i-1)+fib(i-2);
        suma=suma+fib(i);
        disp(suma)
    end
end