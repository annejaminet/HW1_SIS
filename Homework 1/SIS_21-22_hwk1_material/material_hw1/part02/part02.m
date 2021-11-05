%% part02: Fourier transform, signal reconstruction and filtering
% Wanting Jin, wanting.jin@epfl.ch, Oct 2021
clear all
% load the data
acc_with_timestamp = load('ArduinoData.mat');
t = acc_with_timestamp.measure.t;
acc = acc_with_timestamp.measure.data;


%% Q2 Plot the signal in both time domain and frequency domain (by using fft)
subplot(2,1,1);
% TODO: plot in time domain
subplot(2,1,2);
% TODO: plot in frequency domain (fft)

%% Q5 (Use filter_data() function)

% TODO: filter the signal with the output coff from the filter Designer
% acc_filtered = filter_data(acc, Num);

%% Q6 Sampling the signal
% TODO: Sample the signal at 10 * freq
% Fs = 
% [ts, acc_sampled]=sample_data(t,acc_filtered,Fs); 

%% Q7 (Use reconstruct_signal() function)
% TODO: reconstrut signal with different interpolation method
% reconstruct_freq = 200;
%[tr_zero, acc_r_zerohold] = reconstruct_signal(reconstruct_freq, ts, acc_sampled,'zero_order_interp');
%[tr_first, acc_r_firsthold] = reconstruct_signal(reconstruct_freq, ts, acc_sampled,'first_order_interp');
%[tr_ws, acc_r_ws] = reconstruct_signal(reconstruct_freq, ts, acc_sampled,'ws_interp');


