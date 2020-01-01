xpoints=[0,5,10,15,20];
ypoints=[200,152,118,93,74];
plot(xpoints,ypoints,"o");
hold on;
coefs=polyfit(xpoints,ypoints,4);
x=linspace(0,60,101);
y=polyval(coefs,x);
plot(x,y);
xlabel('Time (min)');
ylabel('Penicillin Concentration  (\mug/ml)');
title('Penicillin Clearance Extrapolation');
grid on;
hold on;
xe=linspace(0,60,101);
ye=200*exp(xe*(log(37/100))/20); 
%using the first and second point a=200 and b=(ln(37/100))/20
plot(xe,ye)
hold on;
xextrapolate=linspace(0,60,101);
yextrapolate=40+0*xextrapolate;
plot(xextrapolate,yextrapolate);
hold on;
xextrapolate=linspace(0,60,101);
yextrapolate=20+0*xextrapolate;
plot(xextrapolate,yextrapolate);
legend('points','polynomial','bestfit','y=40','y=20')
