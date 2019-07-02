l = 1;
r = 10^20;
gamma = 0.5772156649015328606065120;
while r - l > 1
    m = (l + r) / 2;
    if m*(log(m)+gamma) < 2^54
        l = m;
    else
        r = m;
    end
end
disp('r =');
disp(r);