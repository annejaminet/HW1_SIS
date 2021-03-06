

%% part02: Fourier transform, signal reconstruction and filtering
% Wanting Jin, wanting.jin@epfl.ch, Oct 2021
clear all
% load the data
acc_with_timestamp = load('ArduinoData.mat');
t = acc_with_timestamp.measure.t;
acc = acc_with_timestamp.measure.data;
load hw1_part2.mat


%% Q2 Plot the signal in both time domain and frequency domain (by using fft)
dataFrequency = 5000;
limit = 1/5; %limit_freq = 1/total_seconds
t1=-limit/2:1/dataFrequency:limit/2;

figure(1)
subplot(2,1,1);
% Plot in time domain
scatter(t, acc, 5, '.')
xlabel("Time [s]");

subplot(2,1,2);

% Plot in frequency domain (fft)
ACC = fft(acc);
Fmax = 200; 
fty=abs(ACC/length(acc));
f=dataFrequency/2*linspace(0,1,round(length(acc)/2));
fty=fty(1:length(f));
maxIndex=find(f>Fmax,1);
plot([-f(maxIndex:-1:2) f(1:maxIndex)], [fty(maxIndex:-1:2) fty(1:maxIndex)]); grid on;
xlabel("Frequency [Hz]")
sgtitle("Signal in Time Domain and Frequency Domain");
saveas(figure(1), "Signal_tdomain_fdomain", "png");



%% Q5 (Use filter_data() function)

% Filter the signal with the output coeff from the filter Designer
acc_filtered = filter_data(acc, low_pass);

figure(2)
% Plot in time domain
subplot(2,1,1);
scatter(t,acc_filtered', 5, '.')
xlabel("Time [s]")


% Plot in frequency domain (fft)
subplot(2,1,2);
F_ACC = fft(acc_filtered);
Fmax = 200;
fty=abs(F_ACC'/length(acc_filtered));
f=dataFrequency/2*linspace(0,1,round(length(acc_filtered)/2));
fty=fty(1:length(f));
maxIndex=find(f>Fmax,1);
plot([-f(maxIndex:-1:2) f(1:maxIndex)], [fty(maxIndex:-1:2) fty(1:maxIndex)]); grid on;
xlabel("Frequency [Hz]")
sgtitle("Filtered Signal in Time Domain and Frequency Domain");
saveas(figure(2), "Filtered_Signal_tdomain_fdomain", "png");
 
%save('hw1_part2.mat','low_pass');

%% Q6 Sampling the signal
% Sample the signal at 10 * freq_max

[val, index] = max(fty);
freq_max = f(index);
Fs = 10*freq_max;

[ts, acc_sampled]=sample_data(t,acc_filtered,Fs); 

%% Q7 (Use reconstruct_signal() function)
% TODO: reconstrut signal with different interpolation method
reconstruct_freq = 200;
figure(3)
[tr_zero, acc_r_zerohold] = reconstruct_signal(reconstruct_freq, ts, acc_sampled,'zero_order_interp');
saveas(figure(3), "ZOH", "png");
figure(4)
[tr_first, acc_r_firsthold] = reconstruct_signal(reconstruct_freq, ts, acc_sampled,'first_order_interp');
saveas(figure(4), "FOH", "png");
figure(5)
[tr_ws, acc_r_ws] = reconstruct_signal(reconstruct_freq, ts, acc_sampled,'ws_interp');
saveas(figure(5), "WS", "png");
