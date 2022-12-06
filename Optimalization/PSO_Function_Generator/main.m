
global randomowa_funkcja;
randomowa_funkcja = randi([1, 8], 1); 

lb = 0;
ub = 0;
dim = 0;
fmin = 0;

[lb, ub, dim, fmin] = zmienne(randomowa_funkcja);

   switch randomowa_funkcja
    case 1
fun = @(x) randi([1, 8], 1) +100* sqrt(abs(x(2)-0.01*x(1)^2))+0.01*abs(x(1)+10);
    case 2
fun = @(x) randi([1, 8], 1) -(1+cos(12*sqrt(x(1)^2+x(2)^2)))/(0.5*(x(1)^2+x(2)^2)+2);
    case 3
fun = @(x) randi([1, 8], 1) -(x(2)+47)*sin(sqrt(abs(x(2)+0.5*x(1)+47)));
    case 4
fun = @(x) randi([1, 8], 1) + (sin(10*pi*x)/(2*x)) * (x-1)^4;
    case 5
fun = @(x) randi([1, 8], 1) -abs(sin(x(1)*cos(x(2)*exp(abs(1-sqrt(x(1)^2+x(2)^2)/pi)))));
    case 6
fun = @(x) randi([1, 8], 1) + 0.5+(((sin(abs(x(1)^2-x(2)^2))^2)-0.5))/abs(1+0.001*(x(1)^2+x(2)^2))^2;
    case 7
fun = @(x) randi([1, 8], 1) -0.5 - (cos(sin(abs(x(1)^2-x(2)^2))))-0.5/abs(1+0.001*(x(1)^2+x(2)^2))^2;
    case 8
fun = @(x) randi([1, 8], 1) + x(1)^2+2*x(2)^2-0.3*cos(3*pi*x(1))-0.4*cos(4*pi*x(2))+0.7;
    otherwise
        disp('zla wartosc')
      end

options = psooptimset('Generations',50,'PopulationSize',40,'SocialAttraction',2,'ConstrBoundary','soft')
[x, fval,exitflag,output,population,scores]  = pso(fun, dim,[],[],[],[],lb,ub,[],options);



h = plot(x,fval,'gO','MarkerFaceColor','g','MarkerSize',14);
legend(h,'Global Minimum');
xlabel('x');
ylabel('y');
title('PSO Global Minimum');


%funkcja zwraca wymiary wartosc griniczne randomowej funkcji wymiary oraz
%wartosc minimalna
function [lb,ub,dim,fmin] = zmienne(randomowa_funkcja)
      switch randomowa_funkcja
    case 1
lb=[-15 -5]; ub=[-3 3];
dim = 2;
fmin = 0;
    case 2
lb=[-5.12]; ub=[5.12];
dim = 2;
fmin = -1;
    case 3
lb=[-512]; ub=[512];
dim = 2;
fmin = -959.64;
    case 4
lb=[0.5]; ub=[2.5];
dim = 1;
fmin = -0.869;
    case 5
lb=[-10]; ub=[10];
dim = 2;
fmin = -19.208
    case 6
lb=[-100]; ub=[100];
dim = 2;
fmin = 0;
    case 7
lb=[-100]; ub=[100];
dim = 2;
fmin = -1;
    case 8
lb=[-100]; ub=[100];
dim = 2;
fmin = 0;
    otherwise
        disp('zla wartosc')
      end
end



