presum = 0;
sum = 1;
maxn = 2097152;
for n = 1: maxn
    presum = sum;
    sum = sum + 1 / n;
end
disp('n =');
disp(n);
disp('sum =');
disp(sum);