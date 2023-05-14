main()

function[]=main()
    rentri=input("Teclea el numero de renglones para el triangulo ");
    matri=triangulo(rentri);
    disp(matri)
end


function[matri]=triangulo(rentri)
    matri=zeros(rentri,rentri);
    a=rentri;
    for i=1:a
        matri(i,i)="1";
        a=a-1;
    end
end