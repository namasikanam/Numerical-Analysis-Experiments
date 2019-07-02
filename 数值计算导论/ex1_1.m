M = 1;
epsilon = 10^-16;

n = 16;

x = 0: n;
y = 0: n;
y1 = 0: n;
yt = 0: n;
yr = 0: n;
for i = 0: n
    h = 10 ^ -i;
    x(i+1) = h;
    y(i+1) = abs((sin(1 + h) - sin (1)) / h - cos(1));
    y1(i+1) = M*h/2 + 2*epsilon/h;
    yt(i+1) = M*h/2;
    yr(i+1) = 2*epsilon/h;
end
plot(x, y)
loglog(x, y)

hold on

plot(x, y1)
loglog(x, y1)

plot(x, yt)
loglog(x, yt)

plot(x, yr)
loglog(x, yr)

legend('actual total error', 'total error boundary', 'truncation error boundary', 'rounding error boundary')
xlabel('step size h')
ylabel('error')

hold off