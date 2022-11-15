function [x, y, x2, y2, x3, y3]  =  missle_trajectory( v0, theta0)




  g = 9.81; 

  m =.745; 

  cal = .35;

  A=pi*(cal)^2/8; 

  C=.30;

  rho= 1.3; 

  D=rho*C*A/2;
  
  

    v = v0;


    delta_t= .001
      x(1)=0
    x2(1)=0
    x3(1)=1;
    y(1)=0;
    y2(1)=0;
    y3(1)=0;
      vx=v*cosd(theta0);
    vx2=v*cosd(theta0);
    vx3=v*cosd(theta0);
     vy=v*sind(theta0);
    vy2=v*sind(theta0);
    vy3=v*sind(theta0);
     latitude = 60;
    azimut = 30;
    t(1)=0; 
    t2(1)=0; 
    t3(1)=0;
    i=1;
     
        i=1
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
    i=1
    while min(y)> -.001      
        ax=-(D/m)*(vx*vx+vy*vy)^0.5*vx;
        ay=-g-(D/m)*(vx*vx+vy*vy)^0.5*vy;
        vx=vx+ax*delta_t;
        vy=vy+ay*delta_t;
        x(i+1)=x(i)+vx*delta_t+.5*ax*delta_t^2;
        y(i+1)=y(i)+vy*delta_t+.5*ay*delta_t^2;
        t(i+1)=t(i)+delta_t;
        i=i+1;
    end
  
            i=1
    while min(y3)> -.001
  
        ay3=-g+(vx*cosd(latitude)*sind(azimut));
        ax3=-2*(vy*cosd(latitude)*sind(azimut));
        vx3=vx3;
        vy3=vy3+ay3*delta_t;
        x3(i+1)=x3(i)+vx3*delta_t+.5*ax3*delta_t^2;
         
        y3(i+1)=y3(i)+vy3*delta_t+.5*ay3*delta_t^2;
        t3(i+1)=t3(i)+delta_t;
        i=i+1;
    end

   
end