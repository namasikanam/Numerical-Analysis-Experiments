disp('==========Practical result============');
presum = single(0);
sum = single(1);
n = 1;
while sum ~= presum
    n = n + 1;
    presum = sum;
    sum = sum + single(1/n);
end
disp('n =');
disp(n);
disp('sum =');
disp(sum);

% disp('==========Theoretical result===========');
% n = 1;
% gamma = 0.5772156649015328606065120;
% while n*(log(n)+gamma) < 2^25
%     n = n + 1;
% end
% disp('n =');
% disp(n);