%%

function y = shift_5(n)
    y = n-5;
end

function y = shift_6(n)
    y = n+6;
end

x1 = [11 -13 15 7 -9];
n1 = -2:2;

x2 = [-12 14 6 -8 5];
n2 = 0:4;

n1_shifted = shift_5(n1);
n2_shifted = shift_6(n2);

subplot(4, 1, 1)
stem(n1, x1)
xlabel('Samples')
ylabel('Amplitude')
title('X1[n]')

subplot(4, 1, 2)
stem(n1_shifted, x1)
xlabel('Samples')
ylabel('Amplitude')
title('X1[n-5]')

subplot(4, 1, 3)
stem(n2, x2)
xlabel('Samples')
ylabel('Amplitude')
title('X2[n]')

subplot(4, 1, 4)
stem(n2_shifted, x2)
xlabel('Samples')
ylabel('Amplitude')
title('X1[n+6]')

%%
function y = flip(n)
    y = -n;
end

n1_flipped = flip(n1);
n2_flipped = flip(n2);


subplot(4, 1, 1)
stem(n1, x1)
xlabel('Samples')
ylabel('Amplitude')
title('X1[n]')

subplot(4, 1, 2)
stem(n1_flipped, x1)
xlabel('Samples')
ylabel('Amplitude')
title('X1[-n]')

subplot(4, 1, 3)
stem(n2, x2)
xlabel('Samples')
ylabel('Amplitude')
title('X2[n]')

subplot(4, 1, 4)
stem(n2_flipped, x2)
xlabel('Samples')
ylabel('Amplitude')
title('X1[-n]')

%%
function y = u(x)
    y = zeros(size(x));
    y(x>=0) = 1;
end

function y = delta(x)
    y = zeros(size(x));
    y(x==0) = 1;
end

n1 = -15:15;
n2 = -30:30;
x1 = 3 .* delta(n1-10) + 15 .* delta(n1+7);
x2 = n2 .* u(n2) + u(n2-10) + u(n2-20) + (10 .* 2 .*(-0.8 .^ (n2-5))).* (u(u(n2-20)-u(n2-30)));

subplot(2, 1, 1)
stem(n1, x1)
xlabel('Samples')
ylabel('Amplitude')
title('X1')

subplot(2, 1, 2)
stem(n2, x2)
xlabel('Samples')
ylabel('Amplitude')
title('X2')
