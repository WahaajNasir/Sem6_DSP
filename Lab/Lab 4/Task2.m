%
recorder = audiorecorder(8000, 8, 1);
fs = 8000

disp("Start Recording");
recordblocking(recorder, 2);
disp("Stop Recording");
pause(5)
play(recorder)

myVoice = getaudiodata(recorder);

Fc = fs/2;

eq = Fc * 2;
less = 0.5 * Fc;
more = 4 * Fc;

Fs_equal = resample(myVoice, eq, fs)
Fs_less = resample(myVoice, less, fs)
Fs_more = resample(myVoice, more, fs)

subplot(4, 1, 1)
plot(myVoice)
title('Original')

subplot(4, 1, 2)
plot(Fs_equal)
title('Fs = 2Fm')

subplot(4, 1, 3)
plot(Fs_less)
title('Fs < 2Fm')

subplot(4, 1, 4)
plot(Fs_more)
title('Fs > 2Fm')

sound(Fs_equal)
pause(3)
sound(Fs_less)
pause(3)
sound(Fs_more)