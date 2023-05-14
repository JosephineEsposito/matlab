syms x
main()
%x 100 - 2600

function[]=plots()
    hold on
    grid on
    for x = 100 : 1 : 2600
        y = -(0.000000653)*x^3+(0.0027)*x^2-(2.6589)*x+1939.7;
        plot(x,y,'--.r')
    end
end

function[]=main()
    %y = -(0.000000653)*x^3+(0.0027)*x^2-(2.6589)*x+1939.7;
    plots()
end