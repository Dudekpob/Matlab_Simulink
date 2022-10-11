%tetha d offset(a) alfa r/p
L(1) = Link([0 25 0 -pi/2 1]); 
L(2) = Link([0 6 0 pi/2 0]); 
L(3) = Link([0 0 3 0 0]);


L(1).qlim = [0 25];
r = SerialLink(L);

%p r1 r2

q0=[0 1.5 0.9];
q1=[15 -1.200 -0.9];
q2=[10 1.400 1];
q3=[5 -1.400 -1];
q4=[20 1.500 0];
q5=[1 -1.500 1];

%path
t=0:.03:2;%Time vector & steps
traj1=jtraj(q0,q1,t); 
traj2=jtraj(q1,q2,t);
traj3=jtraj(q2,q3,t);
traj4=jtraj(q3,q4,t);
traj5=jtraj(q4,q5,t);
traj6=jtraj(q5,q0,t);

%write trajectory
r.plot(traj1)
r.plot(traj2)
r.plot(traj3)
r.plot(traj4)
r.plot(traj5)
r.plot(traj6)
