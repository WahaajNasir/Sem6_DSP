%%
t = 0:0.01:1;

y1 = cos(2 .* pi .* 10 .* t);

% For y1
fs_1_1 = 20;
fs_1_2 = 5;
fs_1_3 = 40;

t1_1 = 0:1/fs_1_1:1;
t1_2 = 0:1/fs_1_2:1;
t1_3 = 0:1/fs_1_3:1;

y1_1 = cos(2 .* pi .* 10 .* t1_1);
y1_2 = cos(2 .* pi .* 10 .* t1_2);
y1_3 = cos(2 .* pi .* 10 .* t1_3);

subplot(4, 1, 1)
stem(t, y1)
xlabel('Samples')
ylabel('Amplitude')
title('Original Function')

subplot(4, 1, 2)
stem(t1_1, y1_1)
xlabel('Samples')
ylabel('Amplitude')
title('Fs = 2Fm')

subplot(4, 1, 3)
stem(t1_2, y1_2)
xlabel('Samples')
ylabel('Amplitude')
title('Fs < 2Fm')

subplot(4, 1, 4)
stem(t1_3, y1_3)
xlabel('Samples')
ylabel('Amplitude')
title('Fs > 2Fm')

%%

t = 0:0.001:1;
y2 = sin(2 .* pi .* 50 .* t) + cos(2 .* pi .* 200 .* t);

% For y2
fs_2_1 = 400;
fs_2_2 = 200;
fs_2_3 = 800;

t2_1 = 0:1/fs_2_1:1;
t2_2 = 0:1/fs_2_2:1;
t2_3 = 0:1/fs_2_3:1;

y2_1 = cos(2 .* pi .* 200 .* t2_1);
y2_2 = cos(2 .* pi .* 200 .* t2_2);
y2_3 = cos(2 .* pi .* 200 .* t2_3);

subplot(4, 1, 1)
plot(t, y2)
xlabel('Samples')
ylabel('Amplitude')
title('Original Function')

subplot(4, 1, 2)
plot(t2_1, y2_1)
xlabel('Samples')
ylabel('Amplitude')
title('Fs = 2Fm')

subplot(4, 1, 3)
plot(t2_2, y2_2)
xlabel('Samples')
ylabel('Amplitude')
title('Fs < 2Fm')

subplot(4, 1, 4)
plot(t2_3, y2_3)
xlabel('Samples')
ylabel('Amplitude')
title('Fs > 2Fm')