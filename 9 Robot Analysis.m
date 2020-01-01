%From analyzing robpos.mat
%x = robpos(t,2)
%y = robpos(t,3)
load("robpos.mat")
%Part a) plotting robot's position
t=robpos(:,1);
robposx=robpos(:,2);
robposy=robpos(:,3);
figure
plot(robpos(:,2),robpos(:,3))
title("Robot's Position in 2D Space")
xlabel("Robot's x-coordinate (m)")
ylabel("Robot's y-coordinate (m)")
%Part b) plotting a line of best fit for the posotion
coefsxpos=polyfit(t,robposx,5);
ybestfitposx=polyval(coefsxpos,t);
coefsypos=polyfit(t,robposy,5);
ybestfitposy=polyval(coefsypos,t);
hold on
plot(ybestfitposx,ybestfitposy)
legend("Position","Best fit")
%Part a) calculating velocity and acceleration
v=[];
a=[];
for t=1:60
    v(t,1) = sqrt((robpos(t + 1,2) - robpos(t,2))^2 + (robpos(t + 1,3) - robpos(t,3))^2);
    v(t,2) = robpos(t + 1,2) - robpos(t,2);
    v(t,3) = robpos(t + 1,3) - robpos(t,3);
    if t>1 %at t=0 there is no exisiting acceleration because (t-1) would be negative time
        a(t,1) = v(t,1)-v(t-1,1);
    end
end
%Part a) plotting velocity
linspacev = linspace(0,60,60);
figure
plot(linspacev,v(:,1))
title("Robot's Velocity")
xlabel("Time (s)")
ylabel("Velocity (m/s)")
%Part b) calculating line of best fit for velocity
vx=(v(:,2));
vy=(v(:,3));
coefsxv=polyfit(linspacev',vx,5);
ybestfitvx=polyval(coefsxv,linspacev');
coefsyv=polyfit(linspacev',vy,5);
ybestfitvy=polyval(coefsyv,linspacev');
ybestfitvall = sqrt(ybestfitvx.^2 + ybestfitvy.^2);
%plotting velocity line of best fit
hold on
plot(linspacev,ybestfitvall)
legend("Velocity", "Best fit")
%Part a) plotting acceleration
linspacea = linspace(1,60,60);
figure
plot(linspacea,a(:,1))
title("Robot's Acceleration")
xlabel("Time (s)")
ylabel("Acceleration (m/s^2)")
%Part b) calculating line of best fit for acceleration (using velocity's line of best fit)
for t=2:60
     a(t,2) = ybestfitvall(t) - ybestfitvall(t-1);
end
%Plotting acceleration line of best fit
hold on
plot(linspacea,a(:,2))
legend("Acceleration", "Best fit")
%Part c) motion of robot travelling in circle
t=linspace(0,60,61);
xcircle=1.2*sin(pi/30*(t-15))+1.2;
ycircle=1.2*sin(pi/30*(t));
figure
plot(xcircle,ycircle)
axis([0,1.2*2,-1.2,1.2])
title("Robot's Position in 2D Space")
xlabel("Robot's x-coordinate (m)")
ylabel("Robot's y-coordinate (m)")
%Calculating velocity and acceleration
circleposition=[xcircle;ycircle];
vcircle=[];
acircle=[];
for t=1:60
    vcircle(t) = sqrt((circleposition(1,t + 1) - circleposition(1,t))^2 + (circleposition(2,t + 1) - circleposition(2,t))^2);
    if t>1
        acircle(t) = vcircle(1,t)-vcircle(1,t-1);
    end
end
time=linspace(0,60,60)
%Plotting velocity and acceleration
figure
plot(time,vcircle)
title("Robot's Circular Motion Velocity")
xlabel("Time (s)")
ylabel("Velocity (m/s)")
figure
plot(time,acircle)
title("Robot's Circular Motion Acceleration")
xlabel("Time (s)")
ylabel("Acceleration (m/s^2)")
