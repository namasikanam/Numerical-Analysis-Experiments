n = 12;

H = hilb(n);
x = ones(n, 1);
b = H * x;

A = H;
for i = 1: n
    for j = i+1: n
        A(i, j) = 0;
    end
end
for j = 1: n
    for k = 1: j-1
        A(j, j) = A(j, j) - A(j, k) * A(j, k);
    end
    A(j, j) = sqrt(A(j, j));
    for i = j+1: n
        for k = 1: j-1
            A(i, j) = A(i, j) - A(i, k) * A(j, k);
        end
        A(i, j) = A(i, j) / A(j, j);
    end
end

for deltab = 0: 1
    xhat  = A.' \ ( A \ b);

    r = b - H * xhat;
    deltax = xhat - x;

    norm(r, inf)
    norm(deltax, inf)
    
    b = b + 1e-7;
end