%Raúl Jerlach Garza (40%) - A01193581
%Rodrigo De la Garza Martínez (20%) - A00825271
%Josephine Esposito (20%) - A00827145
%Fernando Nicolás Martínez Flores (20%) - A00825518
main()


function[angle, velocity, deltat, height]=askinput()
    prompt = 'Please give the angle of the projectile ';
    angle = input(prompt);
    prompt = 'Please give the exitvelocity of the projectile ';
    velocity = input(prompt);
    prompt = 'Please give the delta time you would like to see, we recommend using values under .5 seconds ';
    deltat = input(prompt);
    prompt = 'Please give the hieght of the mountain of the projectile ';
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

function[t, x, y]=generatearraysfric(deltat, height, velocityony, velocityonx, dragco, mass)
    t = [0];
    x = [0];
    y = [height];
    vx = [velocityonx];
    vy = [velocityony];
    while y(end) > 0
        t = [t, (t(end) + deltat)];
        vx = [vx, (vx(end) + ((-(dragco*vx(end)/mass))*deltat))];
        vy = [vy, (vy(end) + ((-9.8 -(dragco*vy(end)/mass))*deltat))];
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

function[]=plotgraphs(y1, y2, y3, x1, x2, x3)
    hold on

    i = 1;
    j = 1;
    k = 1;
    X1=text(0,3000,['X1 = ' num2str(x1(i))]);
    X2=text(0,2500,['X2 = ' num2str(x2(j))]);
    X3=text(0,2000,['X3 = ' num2str(x3(k))]);
    Y1=text(0,1500,['Y1 = ' num2str(y1(i))]);
    Y2=text(0,1000,['Y2 = ' num2str(y2(j))]);
    Y3=text(0,500,['Y3 = ' num2str(y3(k))]);
    delete(X1)
    delete(Y1)    
    delete(X2)
    delete(Y2)   
    delete(X3)
    delete(Y3)
    while (y1(i) > 0) || (y2(j) > 0) || (y3(k) > 0)
        if y1(i) > 0
            hold on
            plot(x1(i),y1(i),'--or')
            i = i +1;
            delete(X1)
            delete(Y1)
            X1=text(0,3000,['X = ' num2str(x1(i))]);
            Y1=text(0,2500,['Y1 = ' num2str(y1(i))]);
        end
        if y2(j) > 0
            hold on
            plot(x2(j),y2(j),'--ob')
            j = j + 1;
            delete(X2)
            delete(Y2)
            X2=text(0,2000,['X2 = ' num2str(x2(j))]);
            Y2=text(0,1500,['Y2 = ' num2str(y2(j))]);
        end
        if y3(k) > 0
            hold on
            plot(x3(k),y3(k),'--og')
            k = k + 1;
            delete(X3)
            delete(Y3)
            X3=text(0,1000,['X3 = ' num2str(x3(k))]);
            Y3=text(0,500,['Y3 = ' num2str(y3(k))]);
        end
        pause(0.05)
        
    end

end

function[]=plotgraphs1v1(y1, y2, x1, x2)
    hold on
    i = 1;
    j = 1;
    while (y1(i) > 0) || (y2(j) > 0)
        if y1(i) > 0
            hold on
            plot(x1(i),y1(i),'--*r')
            i = i +1; 
        end
        if y2(j) > 0
            hold on
            plot(x2(j),y2(j),'--ob')
            j = j + 1;
        end
        pause(0.05)
        
    end

end

function[x1, y1, matrix1, angle1, velocity1, deltat1, height1]=finalone()
    prompt = 'You will start by giving the values for the first projectile';
    disp(prompt);
    [angle1, velocity1, deltat1, height1]=askinput();
    [velocityonx, velocityony]=generatevelocities(velocity1,angle1);
    [totaltime]=generatetotaltime(velocityony, height1);
    [t, x, y]=generatearrays(deltat1, totaltime, height1, velocityony, velocityonx);
    t1 = t;
    x1 = x;
    y1 = y;
    [finalmatrix]=generatematrix(t, x, y);
    matrix1 = finalmatrix;
end

function[x2, y2, matrix2, angle2, velocity2, deltat2, height2] = finaltwo()
    prompt = 'Now you will give the values for the second projectile';
    disp(prompt);
    [angle2, velocity2, deltat2, height2]=askinput();
    [velocityonx, velocityony]=generatevelocities(velocity2,angle2);
    [totaltime]=generatetotaltime(velocityony, height2);
    [t, x, y]=generatearrays(deltat2, totaltime, height2, velocityony, velocityonx);
    t2 = t;
    x2 = x;
    y2 = y;
    [finalmatrix]=generatematrix(t, x, y);
    matrix2 = finalmatrix;
end

function[x3, y3, matrix3, angle3, velocity3, deltat3, height3]=finalthree()
    prompt = 'Now you will give the values for the third projectile';
    disp(prompt);
    [angle3, velocity3, deltat3, height3]=askinput();
    [velocityonx, velocityony]=generatevelocities(velocity3,angle3);
    [totaltime]=generatetotaltime(velocityony, height3);
    [t, x, y]=generatearrays(deltat3, totaltime, height3, velocityony, velocityonx);
    t3 = t;
    x3 = x;
    y3 = y;
    [finalmatrix]=generatematrix(t, x, y);
    matrix3 = finalmatrix;
end


function[x11, y11, matrix1]=finalonefric(angle1, velocity1, deltat1, height1, dragco, mass)
    prompt = 'You will start by giving the values for the first projectile accounting for friction';
    disp(prompt);
    
    [velocityonx, velocityony]=generatevelocities(velocity1,angle1);
    [t, x, y]=generatearraysfric(deltat1,height1, velocityony, velocityonx, dragco, mass);
    t11 = t;
    x11 = x;
    y11 = y;
    [finalmatrix]=generatematrix(t, x, y);
    matrix1 = finalmatrix;
end

function[x22, y22, matrix2] = finaltwofric(angle2, velocity2, deltat2, height2, dragco, mass)
    prompt = 'Now you will give the values for the second projectile accounting for friction';
    disp(prompt);
    
    [velocityonx, velocityony]=generatevelocities(velocity2,angle2);
    [t, x, y]=generatearraysfric(deltat2,  height2, velocityony, velocityonx, dragco, mass);
    t22 = t;
    x22 = x;
    y22 = y;
    [finalmatrix]=generatematrix(t, x, y);
    matrix2 = finalmatrix;
end

function[x33, y33, matrix3]=finalthreefric(angle3, velocity3, deltat3, height3, dragco, mass)
    prompt = 'Now you will give the values for the third projectile accounting for friction';
    disp(prompt);
    
    [velocityonx, velocityony]=generatevelocities(velocity3,angle3);
    [t, x, y]=generatearraysfric(deltat3,  height3, velocityony, velocityonx, dragco, mass);
    t33 = t;
    x33 = x;
    y33 = y;
    [finalmatrix]=generatematrix(t, x, y);
    matrix3 = finalmatrix;
end

function[]=main()
    disp('We will start with the case assuming there is no resistive force');
    [x1, y1, matrix1, angle1, velocity1, deltat1, height1]=finalone();
    [x2, y2, matrix2, angle2, velocity2, deltat2, height2] = finaltwo();
    [x3, y3, matrix3, angle3, velocity3, deltat3, height3]=finalthree();
    plotgraphs(y1, y2, y3, x1, x2, x3);
    disp('Now we will display each individual projectiles table with t, x and y');
    disp(matrix1);
    disp(matrix2);
    disp(matrix3);
    pause(5)
    hold off
    close all
    disp('Now we will make the case assuming there is a resistive force');
    disp('Due to the fact that in this special case the type of flow across the fluid is laminar (has a low Reynolds Number) we will use the -k(v) formula for the drag force, and since in this case k has no subcomponents, you will only need to input the drag coefficient and the mass')
    prompt = 'Give the drag coefficient for the projectiles ';
    dragco = input(prompt);
    prompt = 'Give the mass for the projectiles ';
    mass = input(prompt);
    [x11, y11, matrix11]=finalonefric(angle1, velocity1, deltat1, height1, dragco, mass);
    [x22, y22, matrix22] = finaltwofric(angle2, velocity2, deltat2, height2, dragco, mass);
    [x33, y33, matrix33]=finalthreefric(angle3, velocity3, deltat3, height3, dragco, mass);
    plotgraphs(y11, y22, y33, x11, x22, x33);
    disp('Now we will display each individual projectiles table with t, x and y');
    disp(matrix1);
    disp(matrix2);
    disp(matrix3);
    pause(5)
    hold off
    close all
    disp('Now we will see each proyectile against each other')
    plotgraphs1v1(y1, y11, x1, x11)
    pause(3)
    hold off
    close all
    plotgraphs1v1(y2, y22, x2, x22)
    pause(3)
    hold off
    close all
    plotgraphs1v1(y3, y33, x3, x33)
    pause(3)
    hold off
    close all
    disp('Now we will see all six projectiles against each other')
    plotgraphs(y11, y22, y33, x11, x22, x33);
    plotgraphs(y1, y2, y3, x1, x2, x3);
    
end






