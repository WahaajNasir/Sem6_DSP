%%
n = -50:0.1:50
sinusoid =2.5.* sin((2.*pi .* 0.08 .* n) + (pi/2))

stem(n, sinusoid)
xlabel('Samples')
ylabel('Amplitude')
title('Sin')