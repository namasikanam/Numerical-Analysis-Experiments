J = @(x) besselj(0, x);

fout = fopen('ex2_3.txt', 'w');
cnt = 0;
for x = 0: 0.1: 40
    if sign(J(x)) ~= sign(J(x+0.1))
        fprintf(fout, "%f ", fzerotx(J, [x, x+0.1]));
        cnt = cnt + 1;
        if cnt == 10
            break;
        end
    end
end

X = 0:0.1:40;
Y = J(X);
plot(X, Y);
grid on;