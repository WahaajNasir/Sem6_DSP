%% Task 1
T= 2;
fs = 100;
t = 0:1/fs:T;
sinosoid = sin(2*pi*80*t);

X_f = fft(sinosoid);
N = length(X_f);
frequencies = (0:N-1) * (fs / N);

magnitude = abs(X_f);
phase = angle(X_f);

subplot(2, 1, 1)
plot(frequencies, fftshift(magnitude))
ylabel("Amplitude")
xlabel("Samples")
title("Magnitude Plot")

subplot(2, 1, 2)
plot(frequencies, phase)
ylabel("Angle")
xlabel("Samples")
title("Phase Plot")

%% Task 2
T= 2;
fs = 1000;
t = 0:1/fs:T;

f1 = 5;
f2 = 50;
f3 = 100;

sin_f1 = sin(2*pi*f1*t);
sin_f2 = sin(2*pi*f2*t);
sin_f3 = sin(2*pi*f3*t);

composite_signal = sin_f1 + sin_f2 + sin_f3;
X_cf = fft(composite_signal);
N = length(X_cf);
frequencies = (0:N-1) * (fs / N);

magnitude = abs(X_cf);
phase = angle(X_cf);

subplot(2, 1, 1)
plot(frequencies, fftshift(magnitude))
ylabel("Amplitude")
xlabel("Samples")
title("Magnitude Plot")

subplot(2, 1, 2)
plot(frequencies, phase)
ylabel("Angle")
xlabel("Samples")
title("Phase Plot")

%% Task 3
f = 5;
fs = 5000;
A = 5;
t = 0:1/fs:T;

cos_sig = A * cos((2*pi*f*t)-pi/2);

X_cos = fft(cos_sig);
magnitude = abs(fftshift(X_cos));
N = length(X_cf);

noisy_signal = awgn(cos_sig, 10, 'measured');

order = 4;
cut_off = 1000/(fs/2);
[b, a] = butter(order, cut_off);
filtered = filter(b, a, noisy_signal);

subplot(3, 1, 1)
plot(magnitude)
ylabel("Amplitude")
xlabel("Samples")
title("Fourier Magnitude Of COS")

subplot(3, 1, 2)
plot(noisy_signal)
ylabel("Amplitude")
xlabel("Time")
title("Noisy Signal")

subplot(3, 1, 3)
plot(filtered)
ylabel("Amplitude")
xlabel("Time")
title("Filtered Signal")

%% Task 4
n = -8:8;
h_n = [0 0 0 0 0 0 1 2 3 2 1 0 0 0 0 0 0];

[h, w] = freqz(h_n);


