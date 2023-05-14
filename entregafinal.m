main()

function[angle, velocity, deltat, height]=askinput()
    prompt = 'Please give the angle of the projectile';
    angle = input(prompt);
    prompt = 'Please give the exitvelocity of the projectile';
    velocity = input(prompt);
    prompt = 'Please give the delta time you would like to see, we recommend using values under .5 seconds';
    deltat = input(prompt);
    prompt = 'Please give the hieght of the mountain of the projectile';
    height = input(prompt);
end

function[totaltime]=generatetotaltime(velocityony, height)
    arrayforroots = [((-1)*(.5)*(9.8)), velocityony, height];
    rootssolved = roots(arrayforroots);
    totaltime = 0;
    if rootssolved(1) > 0
        totaltime = rootssolved(1);
    else
        totaltime = rootssolved(2);
    end        
end



function[velocityonx, velocityony]=generatevelocities(velocity,angle)
    velocityonx = velocity * (cosd(angle));
    velocityony = velocity * (sind(angle));
end

function[t, x, y]=generatearrays(deltat, totaltime, height, velocityony, velocityonx)
    t = [0];
    x = [0];
    y = [height];
    vx = [velocityonx];
    vy = [velocityony];
    for time=deltat:deltat:totaltime
        difvy = -9.8;
        t = [t,time];
        vx = [vx, velocityonx];
        vy = [vy, (vy(end) + difvy*deltat)];
        x = [x, (x(end) + velocityonx*deltat)];
        y = [y, (y(end) + vy(end)*deltat)];
    end
    t = [t,-1];
    x = [x, -1];
    y = [y, -1];
end

function[t, x, y]=generatearraysfric(deltat, height, velocityony, velocityonx)
    t = [0];
    x = [0];
    y = [height];
    vx = [velocityonx];
    vy = [velocityony];
    while vy(end) > 0
            difvy = -9.8;
            t = [t, (t(end) + deltat)];
            vx = [vx, (vx(end) + ((-(dragco*vx(end)/mass))*deltat)) ];
            vy = [vy, (vy(end) + ((-g - (dragco*vy(end)/mass))*deltat)) ];
            x = [x, (x(end) + vx(end)*deltat)];
            y = [y, (y(end) + vy(end)*deltat)];
    end
    t = [t,-1];
    x = [x, -1];
    y = [y, -1];
end



function[finalmatrix]=generatematrix(t, x, y)
    finalmatrixb4trans = [t;x; y];
    finalmatrix = finalmatrixb4trans';
end

function[]=plotgraphs(t1, t2, t3, y1, y2, y3, x1, x2, x3)
    hold on
    i = 1;
    j = 1;
    k = 1;
    while (y1(i) > 0) || (y2(j) > 0) || (y3(k) > 0)
        if y1(i) > 0
            hold on
            plot(x1(i),y1(i),'--or')
            i = i +1; 
        end
        if y2(j) > 0
            hold on
            plot(x2(j),y2(j),'--oy')
            j = j + 1;
        end
        if y3(k) > 0
            hold on
            plot(x3(k),y3(k),'--og')
            k = k + 1;
        end
        
    end

end

function[t1, x1, y1, matrix1]=finalone()
    prompt = 'You will start by giving the values for the first projectile';
    disp(prompt)
    [angle, velocity, deltat, height]=askinput();
    [velocityonx, velocityony]=generatevelocities(velocity,angle);
    [totaltime]=generatetotaltime(velocityony, height);
    [t, x, y]=generatearrays(deltat, totaltime, height, velocityony, velocityonx);
    t1 = t;
    x1 = x;
    y1 = y;
    [finalmatrix]=generatematrix(t, x, y);
    matrix1 = finalmatrix;
end

function[t2, x2, y2, matrix2] = finaltwo()
    prompt = 'Now you will give the values for the second projectile';
    disp(prompt)
    [angle, velocity, deltat, height]=askinput();
    [velocityonx, velocityony]=generatevelocities(velocity,angle);
    [totaltime]=generatetotaltime(velocityony, height);
    [t, x, y]=generatearrays(deltat, totaltime, height, velocityony, velocityonx);
    t2 = t;
    x2 = x;
    y2 = y;
    [finalmatrix]=generatematrix(t, x, y);
    matrix2 = finalmatrix;
end

function[t3, x3, y3, matrix3]=finalthree()
    prompt = 'Now you will give the values for the third projectile';
    disp(prompt)
    [angle, velocity, deltat, height]=askinput();
    [velocityonx, velocityony]=generatevelocities(velocity,angle);
    [totaltime]=generatetotaltime(velocityony, height);
    [t, x, y]=generatearrays(deltat, totaltime, height, velocityony, velocityonx);
    t3 = t;
    x3 = x;
    y3 = y;
    [finalmatrix]=generatematrix(t, x, y);
    matrix3 = finalmatrix;
end


function[]=main()
    disp('We will start with the case assuming there is no resistive force')
    [t1, x1, y1, matrix1]=finalone();
    [t2, x2, y2, matrix2] = finaltwo();
    [t3, x3, y3, matrix3]=finalthree();
    plotgraphs(t1, t2, t3, y1, y2, y3, x1, x2, x3)
    disp('Now we will display each individual projectiles table with t, x and y')
    disp(matrix1)
    disp(matrix2)
    disp(matrix3)
    disp('Now we will make the case assuming there is a resistive force')
    
end