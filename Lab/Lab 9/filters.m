%% Task 1
fs = 2000;
t = 0:1/fs:1-1/fs;
f1 = 10;
f2 = 50;
f3 = 300;
f4 = 500;

sin_wave = sin(2 * pi * f1 *t) + sin(2 * pi * f2*t) + sin(2 * pi * f3 *t) + sin(2 * pi * f4 *t);
square_wave = square(2 * pi * f1 * t);
noisy_signal = sin_wave + 0.5 * randn(size(t));

fft_sin = fft(sin_wave);
fft_sq = fft(square_wave);
fft_noise = fft(noisy_signal);

figure()
subplot(2, 1, 1)
plot(t,sin_wave)
ylabel("Amplitude")
xlabel("Time")
title("Original Signal")

subplot(2, 1, 2)
plot(t,abs(fft_sin))
ylabel("Magnitude")
xlabel("Frequency")
title("Magnitude Plot")

figure()
subplot(2, 1, 1)
plot(t,square_wave)
ylabel("Amplitude")
xlabel("Time")
title("Original Signal")

subplot(2, 1, 2)
plot(t,abs(fft_sq))
ylabel("Magnitude")
xlabel("Frequency")
title("Magnitude Plot")

figure()
subplot(2, 1, 1)
plot(t,noisy_signal)
ylabel("Amplitude")
xlabel("Time")
title("Original Signal")

subplot(2, 1, 2)
plot(t,abs(fft_noise))
ylabel("Magnitude")
xlabel("Frequency")
title("Magnitude Plot")

%% Task 2
filtered_sin = filter(Lowpass_filt, 1, noisy_signal);
fft_filtered_sin = fft(filtered_sin);

filtered_sin_high = filter(Highpass_filt, 1, noisy_signal);
fft_filtered_sin_high = fft(filtered_sin_high);

filtered_sin_bandpass = filter(Bandpass_filt, 1, noisy_signal);
fft_filtered_sin_bandpass = fft(filtered_sin_bandpass);

filtered_sin_bandstop = filter(Bandstop_filt, 1, noisy_signal);
fft_filtered_sin_bandstop = fft(filtered_sin_bandstop);
figure()
subplot(4, 1, 1)
plot(t,noisy_signal)
ylabel("Amplitude")
xlabel("Time")
title("Original Signal")

subplot(4, 1, 2)
plot(t,abs(fft_noise))
ylabel("Magnitude")
xlabel("Frequency")
title("Original Magnitude Plot")

subplot(4, 1, 3)
plot(t,filtered_sin)
ylabel("Magnitude")
xlabel("Frequency")
title("Filtered Signal")

subplot(4, 1, 4)
plot(t,abs(fft_filtered_sin))
ylabel("Magnitude")
xlabel("Frequency")
title("Filtered Magnitude Plot")



figure()
subplot(4, 1, 1)
plot(t,noisy_signal)
ylabel("Amplitude")
xlabel("Time")
title("Original Signal")

subplot(4, 1, 2)
plot(t,abs(fft_noise))
ylabel("Magnitude")
xlabel("Frequency")
title("Original Magnitude Plot")

subplot(4, 1, 3)
plot(t,filtered_sin_high)
ylabel("Magnitude")
xlabel("Frequency")
title("Filtered Signal")

subplot(4, 1, 4)
plot(t,abs(fft_filtered_sin_high))
ylabel("Magnitude")
xlabel("Frequency")
title("Filtered Magnitude Plot")



figure()
subplot(4, 1, 1)
plot(t,noisy_signal)
ylabel("Amplitude")
xlabel("Time")
title("Original Signal")

subplot(4, 1, 2)
plot(abs(fft_noise))
ylabel("Magnitude")
xlabel("Frequency")
title("Original Magnitude Plot")

subplot(4, 1, 3)
plot(filtered_sin_bandpass)
ylabel("Magnitude")
xlabel("Frequency")
title("Filtered Signal")

subplot(4, 1, 4)
plot(abs(fft_filtered_sin_bandpass))
ylabel("Magnitude")
xlabel("Frequency")
title("Filtered Magnitude Plot")


figure()
subplot(4, 1, 1)
plot(t,noisy_signal)
ylabel("Amplitude")
xlabel("Time")
title("Original Signal")

subplot(4, 1, 2)
plot(abs(fft_noise))
ylabel("Magnitude")
xlabel("Frequency")
title("Original Magnitude Plot")

subplot(4, 1, 3)
plot(filtered_sin_bandstop)
ylabel("Magnitude")
xlabel("Frequency")
title("Filtered Signal")

subplot(4, 1, 4)
plot(abs(fft_filtered_sin_bandstop))
ylabel("Magnitude")
xlabel("Frequency")
title("Filtered Magnitude Plot")

%% Task 3
recorder = audiorecorder(8000, 8, 1);
fs = 8000;

disp("Start Recording");
recordblocking(recorder, 2);
disp("Stop Recording");

voice = getaudiodata(recorder);

fourier_voice = abs(fft(voice));

%%
fs = 8000;
t = (0:length(voice)-1)/fs;  
f_high =3000;

noisy_voice = voice + (sin(2*pi*f_high*t))';

sound(voice)
pause(length(voice)/fs + 1);

sound(noisy_voice, fs)
pause(length(noisy_voice)/fs + 1);

filtered_voice = filter(Lowpass_filt_voice, 1, noisy_voice);
sound(filtered_voice)
