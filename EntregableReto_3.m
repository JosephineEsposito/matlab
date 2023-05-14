syms x
plots()

function[]=simGradas()
    %in
    plots()
    %SHOW:
    %seccion de pista
    %posicion del auto en cada instante
    %seccion de gradas junto a la pista en la zona segura
    %en un recuadro: datos del auto (posicion, velocidad, aceleracion,
    %tiempo y pierdida de calor"opcional")
    %ASK:
    %tipo de simulacion
    %min o max de la curva
end

function[]=simRecorrido()
    %in
    plots()
end

function[]=plots()
    hold on
    grid on
    for x = 100 : 10 : 2600
        y = -(0.000000653)*x^3+(0.0027)*x^2-(2.6589)*x+1939.7;
        plot(x,y,'or');
        pause(0.1)
    end
end

function main()
    fprintf("¿Qué simulación quiere ver?\n")
    risp = input("Colocación de gradas o Recorrido de la pista [C R] ");
    
    if (risp == "C")
        minmax = input("¿Quieres ver el mínimo de la curva o su máximo? [Min Max] ");
        if (minmax == "Min")
            %g
            %funcion para los valores min
        elseif (minmax == "Max")
            %g
            %funcion para los valores max
        else
            fprintf("Error: se aceptan solo respuestas como Min o Max")
        end
        simGradas();
    elseif (risp == "R")
        minmax = input("¿Quieres ver el mínimo de la curva o su máximo? [Min Max] ");
        if (minmax == "Min")
            %g
            %funcion para los valores min
        elseif (minmax == "Max")
            %g
            %funcion para los valores max
        end
        simRecorrido()
    else
        fprintf("Error: la respuesta solo puede ser C o R")
    end
end