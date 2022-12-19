function [x, y, x2, y2, x3, y3]  =  missle_trajectory( v0, theta0, ma, ca, rh, szer, azym, wysk)




  g = 9.81; 

  m =ma; 

  cal = ca;

  A=pi*(cal)^2/8; 

  C=.30;

  rho= rh; 

  D=rho*C*A/2;
  
  R = 6371e3; % m
  omega = 7.2921e-5; % rad/s

    v = v0;


    delta_t= .001
    x(1)=0
    x2(1)=0
    x3(1)=1;
    y(1)=wysk;
    y2(1)=wysk;
    y3(1)=wysk;
    vx=v*cosd(theta0);
    vx2=v*cosd(theta0);
    vx3(1)=v*cosd(theta0);
    vy=v*sind(theta0);
    vy2=v*sind(theta0);
    vy3(1)=v*sind(theta0);
    latitude = szer;
    azimut = azym;
    t(1)=0; 
    t2(1)=0; 
    t3(1)=0;
    i=1;
     
   
    while min(y2)> -.001
        ay2=-g;
        ax2=0.0;
        vx2=vx2;
        vy2=vy2+ay2*delta_t;
        x2(i+1)=x2(i)+vx2*delta_t+.5*ax2*delta_t^2;
        y2(i+1)=y2(i)+vy2*delta_t+.5*ay2*delta_t^2;
        t2(i+1)=t2(i)+delta_t;
        i=i+1;
    end
    i=1;
    while min(y)> -.001      

          Fdrag = 0.5 * rho * C * A * sqrt(vx^2 + vy^2); %N  
    %Calculate acceleration
    ax = -Fdrag / m; %m/s^2
    ay = -g; %m/s^2
    
    %Update velocity
    vx = vx + ax * delta_t; %m/s
    vy = vy + ay * delta_t; %m/s
    
    %Update position
    x(i+1) = x(i) + vx * delta_t; %m
    y(i+1) = y(i) + vy * delta_t; %m
    t(i+1) = t(i)+delta_t;
    i = i+1;
    end
  
            i=1;
    while min(y3)> -.001

           ax3 = -2 * omega * vy3(i);
           ay3 = -2 * omega * vx3(i);
           ay3_grav = -g;

             vx3(i+1) = vx3(i) + ax3*delta_t;
             vy3(i+1) = vy3(i) + (ay3 + ay3_grav)*delta_t;


            x3(i+1) = x3(i) + vx3(i+1) * delta_t;
            y3(i+1) = y3(i) + vy3(i+1) * delta_t;

        i=i+1;
    end
    i = 1;
   
end