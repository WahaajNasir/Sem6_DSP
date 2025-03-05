%%
function y = man_conv(x, h)
    y = zeros(length(x) + length(h) -1);

    for i = 1:length(x)
        for j = 1:length(h)
            y(i+j-1) = y(i+j-1) + x(i) * h(j);
        end
    end
end

x_n = [1 2 3 4];
h_n = [1 1 1];

y_man = man_conv(x_n, h_n);

stem(y_man)
xlabel("Samples")
ylabel("Value")
title("Manual Convolution")
%% Task 2

y_mat = conv(x_n, h_n);

subplot(2, 1, 1)
stem(y_man)
xlabel("Samples")
ylabel("Value")
title("Manual Convolution")

subplot(2, 1, 2)
stem(y_mat)
xlabel("Samples")
ylabel("Value")
title("Matlab Convolution")
