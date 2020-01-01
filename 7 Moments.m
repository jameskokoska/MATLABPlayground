M=[]
x=linspace(0,10,501);
angle = linspace(0,180,401)

for i_x=1:length(x)
    for i_angle=1:length(angle)
        M(i_x,i_angle)=400*sind(angle(i_angle))*3+400*cosd(angle(i_angle))*x(i_x);
    end
end

plot(x,M(:,1));
hold on
plot(x,M(:,201));
plot(x,M(:,301));
plot(x,M(:,401));

grid on
legend("\theta = 0\circ","\theta = 90\circ","\theta = 135\circ","\theta = 180\circ", "Location", "southwest")
xlabel("x(m)")
ylabel("Moment at A (N m)")
title("Moment for Varrying Values of x Relative to Theta")

figure
plot(angle,M(1,:));
hold on
plot(angle,M(201,:));
plot(angle,M(301,:));
plot(angle,M(401,:));
plot(angle,M(501,:));

legend("x = 0m","x = 4m","x = 6m","x = 8m","x=10m", "Location", "southwest")
xlabel("angle(degrees)")
ylabel("Moment at A (N m)")
title("Moment for Varrying Values of Theta Relative to x")
grid on