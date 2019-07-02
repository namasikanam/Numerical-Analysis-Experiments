epsilon = 1;
a = 1/2;
n = 100;

% ????????????2-norm??
epsilon1 = 1e-7; % ????
epsilon2 = 1e-7; % ????
omega = 0.9;

h = 1 / n;

A = zeros(n-1, n-1);
for i = 1: n-1
    if i - 1 >= 1
        A(i, i - 1) = epsilon;
    end
    A(i, i) = -(2 * epsilon + h);
    if i + 1 <= n-1
        A(i, i + 1) = epsilon + h;
    end
end

b = ones(n - 1, 1) * a * h * h;
b(n - 1) = a * h * h - (epsilon + h);
y = zeros(n - 1, 1);
for i = 1: n - 1
    y(i) = (1 - a) / (1 - exp(-1 / epsilon)) * (1 - exp(- i * h / epsilon)) + a * i * h / epsilon;
end

% Jacobi
y0 = zeros(n-1, 1);
r = zeros(n-1, 1);
counter = 0;
while counter == 0 || norm(y0 - y1, 2) / norm(y0, 2) > epsilon1 || norm(r, 2) / norm(b, 2) > epsilon2
    counter = counter + 1;
    
    y1 = y0;
    for i = 1: n - 1
        y0(i) = b(i);
        if i - 1 >= 1
            y0(i) = y0(i) - A(i, i-1) * y1(i-1);
        end
        if i + 1 <= n - 1
            y0(i) = y0(i) - A(i, i+1) * y1(i+1);
        end
        y0(i) = y0(i) / A(i, i);
    end
    
    r = zeros(n - 1, 0);
    for i = 1: n - 1
        r(i) = b(i);
        if i - 1 >= 1
            r(i) = r(i) - A(i, i-1) * y0(i - 1);
        end
        r(i) = r(i) - A(i, i) * y0(i);
        if i + 1 <= n - 1
            r(i) = r(i) - A(i, i+1) * y0(i + 1);
        end
    end
end
disp('-------Jacobi------------')
disp('counter =');
disp(counter);
disp('norm-2 error =');
disp(norm(y - y0, 2) / norm(y, 2));

% G-S
y0 = zeros(n-1, 1);
r = zeros(n-1, 1);
counter = 0;
while counter == 0 || norm(y0 - y1, 2) / norm(y0, 2) > epsilon1 || norm(r, 2) / norm(b, 2) > epsilon2
    counter = counter + 1;
    
    y1 = y0;
    for i = 1: n-1
        y0(i) = b(i);
        if i > 1
            y0(i) = y0(i) - A(i, i-1) * y0(i-1);
        end
        if i + 1 < n
            y0(i) = y0(i) - A(i, i+1) * y0(i+1);
        end
        y0(i) = y0(i) / A(i, i);
    end
    
    r = zeros(n-1, 0);
    for i = 1: n-1
        r(i) = b(i);
        if i > 1
            r(i) = r(i) - A(i, i-1) * y0(i - 1);
        end
        r(i) = r(i) - A(i, i) * y0(i);
        if i < n-1
            r(i) = r(i) - A(i, i+1) * y0(i + 1);
        end
    end
end
disp('-------G-S----------')
disp('counter =');
disp(counter);
disp('norm-2 error =');
disp(norm(y - y0, 2) / norm(y, 2));

% SOR
y0 = zeros(n-1, 1);
r = zeros(n-1, 1);
counter = 0;
while counter == 0 || norm(y0 - y1, 2) / norm(y0, 2) > epsilon1 || norm(r, 2) / norm(b, 2) > epsilon2
    counter = counter + 1;
    
    y1 = y0;
    for i = 1: n-1
        t = b(i);
        if i > 1
            t = t - A(i, i-1) * y0(i-1);
        end
        if i + 1 < n
            t = t - A(i, i+1) * y0(i+1);
        end
        t = t / A(i, i);
        
        y0(i) = (1 - omega) * y0(i) + omega * t;
    end
    
    r = zeros(n-1, 0);
    for i = 1: n-1
        r(i) = b(i);
        if i > 1
            r(i) = r(i) - A(i, i-1) * y0(i - 1);
        end
        r(i) = r(i) - A(i, i) * y0(i);
        if i < n-1
            r(i) = r(i) - A(i, i+1) * y0(i + 1);
        end
    end
end
disp('-------SOR----------')
disp('counter =');
disp(counter);
disp('norm-2 error =');
disp(norm(y - y0, 2) / norm(y, 2));