clc; close all; clear;

filename="../python/earthquake_data_parsed.txt";
logFile= fopen(filename,'r');

%get data
formatSpec='%f';
sizeData = [1 Inf];
Data=fscanf(logFile,formatSpec,sizeData);
Data=Data';

%% Q17 Plot the data both in time and frequency domain

%Time domain

t = 1:300;

figure(1)
subplot(2,1,1)
plot(t, Data)
title("Earthquake Data in Time Domain");
xlabel("Time");
ylabel("Accelerometer Values");


%Frequency domain

% Zero padding
N = 256;
% Adjust frequency axis
w = 2*pi * (0:(N-1)) / N;
w2 = fftshift(w);
w3 = unwrap(w2 - 2*pi);

Fs = 10; %Hz
X_n = fft(Data,N);
abs_X2 = abs(X_n);
fs = Fs*(-N/2:1:N/2-1)/N;

subplot(2,1,2)
plot(fs,fftshift(abs_X2))
grid on
hold on
xlabel('Frequency [Hz]')
ylabel('Amplitude')
title('FFT of Earthquake Data')

saveas(figure(1), "Q25_Earthquake_Data", "png");
