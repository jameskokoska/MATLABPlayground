M=[]
a=linspace(0,10,101);
angle = linspace(0,180,101)

for i_a=1:length(a)
    for i_angle=1:length(angle)
        M(i_a,i_angle)=500*(a(i_a)*sind(angle(i_angle))-5*cosd(angle(i_angle)));
    end
end

surfc(angle,a,M)
grid on
xlabel("\theta (\circ)")
ylabel("a (m)")
zlabel("moment (N/m)")
title("Moment at O changing with respect to \theta and a")

plot(a,M(:,1)) %2 i)
xlabel(a)
ylabel(M)
title("M (a,0\circ)")
plot(a,M(51,:)) %2 ii)
xlabel(a)
ylabel(M)
title("M (5m, \theta)")
plot(a,M(101,:)) %2 iii)
xlabel(a)
ylabel(M)
title("M (10m, \theta)")

max(transpose(max(transpose(M))))
[maxM,maxA] = max(M(:))
[max_a, max_b] = ind2sub(size(M),maxA)

min(transpose(min(transpose(M))))
[minM,minA] = min(M(:))
[min_a, min_b] = ind2sub(size(M),minA)

