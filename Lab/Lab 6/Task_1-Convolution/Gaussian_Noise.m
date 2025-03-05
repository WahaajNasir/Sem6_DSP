fs = 1000;
T = 2;
t = 0:1/fs:T;
clean_signal = sin(2*pi*10*t);

noise = 0.5 * randn(size(t));
noisy_signal = clean_signal + noise;

subplot(2, 1, 1)
plot(clean_signal)
xlabel("Time")
ylabel("Amplitude")
title("Original Signal")

subplot(2, 1, 2)
plot(noisy_signal)
xlabel("Time")
ylabel("Amplitude")
title("Noisy Signal")

%% Task 4

function y = av_filter(x, M)

y = zeros(length(x));

    for i = 1:length(x)
        start = max(1, i - floor(M/2));
        edge = min(length(x), i+floor(M/2));
        y(i) = 1/M * mean(x(start:edge));
    end
end

y_filtered_3 = av_filter(noisy_signal, 3);
y_filtered_5 = av_filter(noisy_signal, 5);
y_filtered_10 = av_filter(noisy_signal, 10);

subplot(5, 1, 1)
plot(clean_signal)
xlabel("Time")
ylabel("Amplitude")
title("Original Signal")

subplot(5, 1, 2)
plot(noisy_signal)
xlabel("Time")
ylabel("Amplitude")
title("Noisy Signal")

subplot(5, 1, 3)
plot(y_filtered_3)
xlabel("Time")
ylabel("Amplitude")
title("Filtered Signal by 3")

subplot(5, 1, 4)
plot(y_filtered_5)
xlabel("Time")
ylabel("Amplitude")
title("Filtered Signal by 5")

subplot(5, 1, 5)
plot(y_filtered_10)
xlabel("Time")
ylabel("Amplitude")
title("Filtered Signal by 10")