syms(t)
h(t)=-2*(t-2)^3+3*(t-2)+1
fplot(h(t),[0,4],'b')
grid on
xlabel('time (t)')
ylabel('height (h)')
title('Analysis of Drone Flight Data')
v(t)=diff(h(t))
hold on
fplot(v(t),[0,4],'r--')
legend('h(t)','v(t)')
