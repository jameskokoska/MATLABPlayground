P=90000;
A=0.0004;
distance=0:0.1:16;
E1=75000000000; %Al
E2=209000000000; %Ni
E3=197000000000; %Ag
L=[4,5,2];
for d=distance
  Matrix=[1 1 1; 0 10 16; 6*(4/(E1*A)) -16*(5/(E1*A)) 10*(2/E1*A))];
  b=[P; d*P; 0];
  F=Matrix\b;
  for i=(1:1:3)
    plot(d,(F(i)/(E1*A))*100,'r.')
    hold on
  end
end
title("Aluminum Alloy")
xlabel("Distance (m)")
ylabel("Elongation %")
grid on
hold off
figure;

for d=distance
  Matrix=[1 1 1; 0 10 16; 6*(4/(E2*A)) -16*(5/(E2*A)) 10*(2/E2*A))];
  b=[P; d*P; 0];
  F=Matrix\b;
  for i=(1:1:3)
    plot(d,(F(i)/(E2*A))*100,'b.')
    hold on
  end
end
title("Nickel Alloy")
xlabel("Distance (m)")
ylabel("Elongation %")
grid on
hold off
figure

for d=distance
  Matrix=[1 1 1; 0 10 16; 6*(4/(E3*A)) -16*(5/(E3*A)) 10*(2/E3*A))];
  b=[P; d*P; 0];
  F=Matrix\b;
  for i=(1:1:3)
    plot(d,(F(i)/(E3*A))*100,'g.')
    hold on
  end
end
title("Steel Alloy")
xlabel("Distance (m)")
ylabel("Elongation %")
grid on
hold off
figure
