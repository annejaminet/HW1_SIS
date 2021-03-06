function [ts,ys]=sample_data(t,y,Fs)
% SAMPLE_DATA: sample signal y at frequency Fs
% ts: sampled timeline
% ys: sampled data
% t: original timeline
% y: original data
% Fs: sampling frequency

% ts = zeros(round(length(y)/20),1);
% ys = zeros(round(length(y)/20),1);
% 
% for i=1:1:round(length(y)/20)
%     ts(i) = t(i+20);
%     ys(i) = y(i+20);
% end
originalFrequency=1/(t(2)-t(1));
if(5*Fs>originalFrequency)
    error('Sampling frequency must be at least 5 times smaller than the original frequency');
end
step=round(originalFrequency/Fs);
ts=t(1:step:end);
ys=y(1:step:end);

end