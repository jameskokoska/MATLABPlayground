syms h
syms r
h=solve(0.002==pi*r^2*h,h)
f=8*r^2+2*pi*r*h
diff(f,r)
roots=solve(0==diff(f,r),r)

fplot(f,[0,10])
xlabel("r")
ylabel("area")
title("area vs r")