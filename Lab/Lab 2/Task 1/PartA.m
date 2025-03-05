%%

function y = u(x)
    y = zeros(size(x));
    y(x>=0) = 1;
end

function y = delta(x)
    y = zeros(size(x));
    y(x==0) = 1;
end

n = -10:10
impulse = u(n);
del = delta(n);

subplot(2, 1, 1);
stem(n, impulse)
xlabel('Samples')
ylabel('Amplitude')
title('Impulse Function')

subplot(2, 1, 2);
stem(n, del)
xlabel('Samples')
ylabel('Amplitude')
title('Delta Function')