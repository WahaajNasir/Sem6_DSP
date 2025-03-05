%%

n = -10:0.1:10;
A = 2;

% 2(-4^n)
exp_1 = A .* (-4 .^ n);

% 2(-0.5^n)
exp_2 = A .* (-0.5 .^ n);

% 2(0.5^n)
exp_3 = A .* (0.5 .^ n);

% 2(4^n)
exp_4 = A .* (4 .^ n);

subplot(4, 1, 1)
stem(n,exp_1)
xlabel('Samples')
ylabel('Amplitude')
title('Alpha = -4')

subplot(4, 1, 2)
stem(n, exp_2)
xlabel('Samples')
ylabel('Amplitude')
title('Alpha = -0.5')

subplot(4, 1, 3)
stem(n, exp_3)
xlabel('Samples')
ylabel('Amplitude')
title('Alpha = 0.5')

subplot(4, 1, 4)
stem(n, exp_4)
xlabel('Samples')
ylabel('Amplitude')
title('Alpha = 4')