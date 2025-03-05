% Load FastICA
addpath('C:\Users\wahaa\AppData\Roaming\MathWorks\MATLAB Add-Ons\Collections\fastACI toolbox'); % Update with actual path

% Generate synthetic mixed signals
Fs = 1000;
t = 0:1/Fs:2;
s1 = sin(2 * pi * 3 * t); % First source signal
s2 = sawtooth(2 * pi * 5 * t); % Second source signal
A = [1 0.5; 0.5 1]; % Mixing matrix
X = A * [s1; s2]; % Mixed signals

% Apply FastICA
[~, S_est, ~] = fastica(X);

% Plot separated signals
figure;
subplot(2,1,1);
plot(S_est(1, :));
title('Recovered Signal 1');

subplot(2,1,2);
plot(S_est(2, :));
title('Recovered Signal 2');