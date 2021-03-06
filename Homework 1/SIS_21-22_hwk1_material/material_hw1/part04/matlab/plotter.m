clc; close all; clear;

filename="../python/earthquake_data_parsed.txt";
logFile= fopen(filename,'r');

%2nd set of data collected with different vibration settings
filename2="../python/earthquake_data_parsed2.txt";
logFile2= fopen(filename2,'r');

%get data
formatSpec='%f';
sizeData = [1 Inf];
Data=fscanf(logFile,formatSpec,sizeData);
Data2 = fscanf(logFile2,formatSpec,sizeData);
Data=Data';
Data2 = Data2';

%% Q17 Plot the data both in time and frequency domain

%Time domain for first dataset

t = 1:300;

figure(1)
subplot(2,1,1)
plot(t, Data)
title("Earthquake Data in Time Domain");
xlabel("Time");
ylabel("Accelerometer Values");


%Frequency domain for first dataset

% Zero padding
N = 256;
% Adjust frequency axis
w = 2*pi * (0:(N-1)) / N;
w2 = fftshift(w);
unwrap(w2 - 2*pi);

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

%Time domain for second dataset

t = 1:299;

figure(2)
subplot(2,1,1)
plot(t, Data2)
title("Earthquake Data2 in Time Domain");
xlabel("Time");
ylabel("Accelerometer Values");


%Frequency domain for second dataset

% Zero padding
N = 256;
% Adjust frequency axis
w = 2*pi * (0:(N-1)) / N;
w2 = fftshift(w);
w3 = unwrap(w2 - 2*pi);

Fs = 10; %Hz
X_n = fft(Data2,N);
abs_X2 = abs(X_n);
fs = Fs*(-N/2:1:N/2-1)/N;

subplot(2,1,2)
plot(fs,fftshift(abs_X2))
grid on
hold on
xlabel('Frequency [Hz]')
ylabel('Amplitude')
title('FFT of Earthquake Data2')

saveas(figure(2), "Q25_Earthquake_Data2", "png");
