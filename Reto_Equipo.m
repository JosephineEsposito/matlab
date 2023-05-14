function[eq] = generaEcuacion(opcion_de_menu)
    if opcion_de_menu == 1
        prompt = "Da la ecuación que quieres tomar encuenta, utiliza el modelo a*x^3 + b*x^2 + c*x^2";
        eq(x) = input(prompt);
    elseif opcion_de_menu == 2
        prompt = "give the initial x value"';
        xinitial = double(input(prompt));
        prompt = "give the initial y value";
        yinitial = double(input(prompt));
        prompt = "give the final x value";
        xfinal = double(input(prompt));
        prompt = "give the final y value";
        yfinal = double(input(prompt));
        xtwo = double(xinitial + double(.20*(xfinal-xinitial)));
        xthree = double(xinitial + double(.8*(xfinal-xinitial)));
        ytwo = double(yinitial - double(.20*(xfinal-xinitial)));
        ythree = double(yfinal + double(.20*(xfinal-xinitial)));
        exesmat = [ 1 xinitial double(xinitial^2) double(xinitial^3) ; 1 xtwo double(xtwo^2) double(xtwo^3) ; 1 xthree double(xthree^2) double(xthree^3) ; 1 xfinal double(xfinal^2) double(xfinal^3)];
        disp(exesmat);
    	ysmat = [yinitial ; ytwo ; ythree ; yfinal];
        coefsmat = double(exesmat \ ysmat);
        a = coefsmat(1,1);
        b = coefsmat(2,1);
        c = coefsmat(3,1);
        d = coefsmat(4,1);
        eq(x) = d*x^3 + c*x^2 + b*x + a;
    else
        xinitial = double(100);
        yinitial = double(1700);
        xfinal = double(2600);
        yfinal = double(1800);
        xtwo = double(xinitial + double(.20*(xfinal-xinitial)));
        xthree = double(xinitial + double(.8*(xfinal-xinitial)));
        ytwo = double(yinitial - double(.20*(xfinal-xinitial)));
        ythree = double(yfinal + double(.20*(xfinal-xinitial)));
        exesmat = [ 1 xinitial double(xinitial^2) double(xinitial^3) ; 1 xtwo double(xtwo^2) double(xtwo^3) ; 1 xthree double(xthree^2) double(xthree^3) ; 1 xfinal double(xfinal^2) double(xfinal^3)];
        disp(exesmat);
    	ysmat = [yinitial ; ytwo ; ythree ; yfinal];
        coefsmat = double(exesmat \ ysmat);
        %(600, 1700) y (2600, 1800)
        a = coefsmat(1,1);
        b = coefsmat(2,1);
        c = coefsmat(3,1);
        d = coefsmat(4,1);
        eq(x) = d*x^3 + c*x^2 + b*x + a;
    end
end