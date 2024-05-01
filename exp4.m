%SNR:
clc; clear all; close all;

n = 100;
x = rand(1, n);
vmin = min(x);
vmax = max(x);
xpow = sum(x.^2) / n;

for i = 1:1:14
    L(i) = 2^i;
    d = (vmax - vmin) / L(i);
    
    for j = 1:length(x)
        start = min(x);
        while (start < x(j))
            start = start + d;
        end
        xq(j) = start - d;
        if (start == x(j))
            xq(j) = start;
        end
    end
    
    err = x - xq;
    noisepow(i) = sum(err.^2) / n;
end

sqnr = xpow ./ noisepow;
sqnrdb = 10 .* log10(sqnr);

% Plotting SQNR in decibels against the logarithm of the number of quantization levels
figure;
semilogx(L, sqnrdb, 'o-', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('Number of Quantization Levels (L)');
ylabel('SQNR (dB)');
title('Uniform Quantization');
grid on;