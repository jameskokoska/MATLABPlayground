t = linspace(0,4,101);
h = -2.*(t-2).^3 + 3.*(t-2) + 1;
plot(t,h)
grid
xlabel('time (t)')
ylabel('height (h)')
title('Analysis of Drone Flight Data')
legend()
hold on
p = [-2,12,-21,11];
r = roots(p)
plot(r,0,'o');