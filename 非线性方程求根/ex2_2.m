delta1 = 10^-5;
delta2 = 10^-3;
lambda0 = 0.5;

% f = @(x) x.^3 - x - 1;
% df = @(x) 3*x.^2 - 1;
% init_x0 = 0.6;
% fout = fopen('ex2_2_1.txt', 'w');

f = @(x) -x.^3 + 5*x;
df = @(x) -3*x.^2 - 5;
init_x0 = 1.35;
fout = fopen('ex2_2_2.txt', 'w');

first = true;
x0 = init_x0;
while first || abs(f(x0)) > delta1 || abs(x0 - x1) > delta2
    first = false;
    
    s = f(x0) / df(x0);
    
    x1 = x0;
    x0 = x1 - s;
    
    fprintf(fout, '==================\n');
    fprintf(fout, 'lambda = ');
    if abs(f(x1)) < abs(f(x0))
        fprintf(fout, '1\n');
    else
        lambda = lambda0;
        while abs(f(x1)) >= abs(f(x0))
            x1 = x0 - lambda * s;
            lambda = lambda / 2;
        end
        fprintf(fout, '%f\n', lambda * 2);
    end
    fprintf(fout, 'x = %f\n', x0);
end
fprintf(fout, 'Result = %f\n', x0);
fprintf(fout, 'Verification of fzero = %f\n', fzero(f, init_x0));

fclose(fout);