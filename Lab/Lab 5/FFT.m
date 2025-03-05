%%
recorder = audiorecorder(8000, 8, 1);
fs = 8000;

disp("Start Recording");
recordblocking(recorder, 2);
disp("Stop Recording");

voice = getaudiodata(recorder);

fourier = abs(fft(voice));

subplot(2, 1, 1)
plot(voice)
xlabel('Time')
ylabel('Amplitude')
title('Time Domain')

subplot(2, 1, 2)
plot(fourier)
xlabel('Frequency')
ylabel('Amplitude')
title('Fourier')

%%
function y = self_down(x, D)
    y = x(1:D:length(x));
end

factor = 50

fs_new = 8000/factor
downsampled_voice = self_down(voice, factor);
downsampled_voice = downsampled_voice.';

downsample_function = downsample(voice, factor);

fourier = abs(fft(downsampled_voice));
fourier_fun = abs(fft(downsample_function));
subplot(2, 2, 1)
plot(downsampled_voice)
xlabel('Time')
ylabel('Amplitude')
title('Time Domain (Downsample Own)')

subplot(2, 2, 2)
plot(fourier)
xlabel('Frequency')
ylabel('Amplitude')
title('Fourier (Downsample Own)')

subplot(2, 2, 3)
plot(downsample_function)
xlabel('Time')
ylabel('Amplitude')
title('Time Domain (Downsample Function)')

subplot(2, 2, 4)
plot(fourier_fun)
xlabel('Frequency')
ylabel('Amplitude')
title('Fourier (Downsample Function)')

sound(downsampled_voice, fs_new)


%%
function y = self_up(x, U)
    y = zeros(1, U * length(x)); 
    y(1:U:end) = x; 
end

factor = 50; 

fs_new = 8000 * factor; 

upsampled_voice = self_up(voice, factor);
upsampled_voice = upsampled_voice.';

upsample_function = upsample(voice, factor);

fourier = abs(fft(upsampled_voice));
fourier_fun = abs(fft(upsample_function));

subplot(2, 2, 1)
plot(upsampled_voice)
xlabel('Time')
ylabel('Amplitude')
title('Time Domain (Upsample Own)')

subplot(2, 2, 2)
plot(fourier)
xlabel('Frequency')
ylabel('Amplitude')
title('Fourier (Upsample Own)')

subplot(2, 2, 3)
plot(upsample_function)
xlabel('Time')
ylabel('Amplitude')
title('Time Domain (Upsample Function)')

subplot(2, 2, 4)
plot(fourier_fun)
xlabel('Frequency')
ylabel('Amplitude')
title('Fourier (Upsample Function)')

sound(upsampled_voice, fs_new)

%% Resampling 3/5
down_factor = 3;
up_factor = 5;

fs_3_5 = 8000 * (3/5);

downsampled_voice_3 = downsample(voice, down_factor);

upsampled_voice_5 = upsample(downsampled_voice_3, up_factor);

fourier_3_5 = abs(fft(upsampled_voice_5));

figure;
subplot(2,1,1)
plot(upsampled_voice_5)
xlabel('Samples')
ylabel('Amplitude')
title('Time Domain (3/5)')

subplot(2,1,2)
plot(fourier_3_5)
xlabel('Frequency')
ylabel('Magnitude')
title('Fourier (3/5)')

sound(upsampled_voice_5, fs_3_5)

%% Resampling 5/3
up_factor = 3;
down_factor = 5;

fs_5_3 = 8000 * (5/3);

downsampled_voice_5 = downsample(voice, down_factor);

upsampled_voice_3 = upsample(downsampled_voice_5, up_factor);

fourier_5_3 = abs(fft(upsampled_voice_3));

figure;
subplot(2,1,1)
plot(upsampled_voice_3)
xlabel('Samples')
ylabel('Amplitude')
title('Time Domain (5/3)')

subplot(2,1,2)
plot(fourier_5_3)
xlabel('Frequency')
ylabel('Magnitude')
title('Fourier (5/3)')

sound(upsampled_voice_3, fs_5_3)