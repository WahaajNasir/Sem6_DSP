function y= delay(x, delay_am)
    y = zeros(size(x));
    for n = delay_am+1:length(x)
        y(n) = x(n);
    end
end

function y = echo_sound(x, alpha, delay_am)
    y = zeros(size(x));
    for n=delay_am+1:length(x)
        y(n) = x(n) + alpha * x(n-delay_am);
    end
end

function y = reverbed_sound(x, alpha, delay_am)
    y = ones(size(x));
    y = upsample(y, 2);
    for n = delay_am+1:length(y)
        y(n) = x(n) + alpha * y(n-delay_am);
    end
    y = downsample(y, 2);
end

function y = chorus(x, delay_am)
delay_am1 = delay_am;
delay_am2 = delay_am1 + 2000;
delay_am3 = delay_am2 + 4000;

delay_x1 = delay(x, delay_am1);
delay_x2 = delay(x, delay_am2);
delay_x3 = delay(x, delay_am3);
y = zeros((size(x)));
    for n = 1:length(x)
        y(n) = x(n) + delay_x1(n) + delay_x2(n) + delay_x3(n);
    end
end
[drum_sound, fs] = audioread("LabMidAudio.mp3");
delay_amount = 5000;
%display(drum_sound)
%display(fs)

delayed_drum = delay(drum_sound, delay_amount);
echoed_drum = echo_sound(drum_sound, 0.5, delay_amount);
reverb_drum = reverbed_sound(drum_sound, 0.5, delay_amount);
chorus_drum = chorus(drum_sound, delay_amount);

%sound(delayed_drum, fs)
%pause(12)
%sound(echoed_drum, fs)
%pause(12)
%sound(reverb_drum, fs)
%pause(20)
sound(chorus_drum, fs)

subplot(5, 1, 1)
plot(drum_sound)
title("Original Sound")

subplot(5, 1, 2)
plot(delayed_drum)
title("Delayed Drum")

subplot(5, 1, 3)
plot(echoed_drum)
title("Echoed Drum")

subplot(5, 1, 4)
plot(reverb_drum)
title("Reverbed Drum")

subplot(5, 1, 5)
plot(chorus_drum)
title("Chorus Drum")