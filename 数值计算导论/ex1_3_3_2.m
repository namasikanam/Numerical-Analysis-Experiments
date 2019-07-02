presum = 0;
sum = 1;
n = 1;
while sum ~= presum && n < 10^7
    n = n + 1;
    presum = sum;
    sum = sum + 1/n;
end
