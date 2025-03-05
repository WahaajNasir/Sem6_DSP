%Task 1%
%Sampling frequency Fs is no of samples per second

recorder = audiorecorder(8000, 8, 1);
fs = 8000 %Adding fs as variable becoz mei har jagah use kar raha

disp("Start Recording");
recordblocking(recorder, 5);
disp("Stop Recording");
play(recorder)

myVoice = getaudiodata(recorder);
reverse_audio = flipud(myVoice);
pause(7)
sound(reverse_audio, 8000)
pause(7);

subplot(3, 1, 1)
plot(myVoice)
xlabel("Samples");
ylabel("Amplitude");
title("Original Sound")

subplot(3, 1, 2)
plot(reverse_audio)
xlabel("Samples");
ylabel("Amplitude");
title("Reverse Sound")

%%
%Task2
f1 = 1000;
f2 = 1500;

%Determine length of the signal
N = length(myVoice);
t = (0:N-1)/fs; %Goes to 5 seconds

cos_sig_1 = cos(2 *pi * f1 *t)';
cos_sig_2 = cos(2 *pi *f2 *t)';

cos_added_voice = myVoice + cos_sig_1 + cos_sig_2;

sound(cos_added_voice, 8000)

plot(cos_added_voice)
xlabel("Samples");
ylabel("Amplitude");
title("Cos Added")

%%
%Task 3

partA = myVoice(1:20000, 1);
partB = myVoice(20001:end, 1);

sound(partA, 8000)
pause(4)

sound(partB, 8000)
pause(4)

reconstruct = partA+partB;
sound(reconstruct, fs)

subplot(4, 1, 1)
plot(partA);
title("Part A")
xlabel("Samples")
ylabel("Amplitude")

subplot(4, 1, 2)
plot(partB);
title("Part B")
xlabel("Samples")
ylabel("Amplitude")

subplot(4, 1, 3)
plot(reconstruct);
title("Reconstruct")
xlabel("Samples")
ylabel("Amplitude")

subplot(4, 1, 4)
plot(myVoice);
title("Original Signal")
xlabel("Samples")
ylabel("Amplitude")

%%
%Task 4
partA_2 = partA .* 2;
partB_0_5 = partB .* 0.5;

recon = partA_2 + partB_0_5;

sound(recon, fs)

subplot(4, 1, 1)
plot(partA_2);
title("Part A_2")
xlabel("Samples")
ylabel("Amplitude")

subplot(4, 1, 2)
plot(partB_0_5);
title("Part B_0_5")
xlabel("Samples")
ylabel("Amplitude")

subplot(4, 1, 3)
plot(recon);
title("Reconstruct")
xlabel("Samples")
ylabel("Amplitude")

%%
%Task 5
f1 = 5;
f2 = 200;
f3 = 1000;
f4 = 2500;

%Determine length of the signal
N = length(myVoice);
t = (0:N-1)/fs; %Goes to 5 seconds

cos_sig_1 = cos(2 *pi * f1 *t)';
cos_sig_2 = cos(2 *pi *f2 *t)';
cos_sig_3 = cos(2 *pi *f3 *t)';
cos_sig_4 = cos(2 *pi *f4 *t)';

new_sound = myVoice + cos_sig_1 + cos_sig_2 + cos_sig_3 + cos_sig_4;

subplot(2, 1, 1)
plot(myVoice)
title("Original Sound")
xlabel("Sample")
ylabel("Amplitude")

subplot(2, 1, 2)
plot(new_sound)
title("Cos Added Sound")
xlabel("Sample")
ylabel("Amplitude")

%%
%Task 6

downsampleVoice_1 = downsample(myVoice, 2); %Divide by 2
downsampleVoice_2 = downsample(downsampleVoice_1, 2); %Divide by 2
downsampleVoice_3 = downsample(downsampleVoice_2, 2); %Divide by 2
downsampleVoice_4 = downsample(downsampleVoice_3, 2); %Divide by 2
downsampleVoice_5 = downsample(downsampleVoice_4, 2); %Divide by 2

subplot(6, 1, 1)
plot(myVoice)
title("Original Sound")
xlabel("Sample")
ylabel("Amplitude")

subplot(6, 1, 2)
plot(downsampleVoice_1)
title("Downsample Once")
xlabel("Sample")
ylabel("Amplitude")

subplot(6, 1, 3)
plot(downsampleVoice_2)
title("Downsample Twice")
xlabel("Sample")
ylabel("Amplitude")

subplot(6, 1, 4)
plot(downsampleVoice_3)
title("Downsample Thrice")
xlabel("Sample")
ylabel("Amplitude")

subplot(6, 1, 5)
plot(downsampleVoice_4)
title("Downsample Four Times")
xlabel("Sample")
ylabel("Amplitude")

subplot(6, 1, 6)
plot(downsampleVoice_5)
title("Downsample Five Times")
xlabel("Sample")
ylabel("Amplitude")

%%
