clc;
clear all;
close all;

N = 10^6; % number of bits or symbols
% Transmitter
a = rand(1,N)>0.5; % generating 0 and 1
s = 2*a-1; % BPSK modulation 0 -> -1; 1 -> 1
snr_dB = 1:1:10; % multiple Eb/N0 values
snr_ratio = 10.^snr_dB/10;
n = 1/sqrt(2).*(randn(1,N)+1i*randn(1,N)); % mean=0; variance=1;
for i = 1:length(snr_dB)
y = 10^(snr_dB(i)/20).*s + n;
a_dec = real(y)>0; % receiver - decision decoding
nErr(i) = size(find(a- a_dec),2); % counting the errors
end
simBer = nErr/N; % simulated ber
theoryBer = 0.5*erfc(sqrt(10.^(snr_dB/10))); % theoretical ber
figure
semilogy(snr_dB,theoryBer,'b-','Linewidth',1.5);
hold on
semilogy(snr_dB,simBer,'x','MarkerSize',8);
%axis([-3 20 10^-6 0.5])
grid on
legend('theory', 'simulation');
xlabel('snr dB-->');
ylabel('Bit Error Rate-->');
title('Bit error probability curve for BPSK modulation');