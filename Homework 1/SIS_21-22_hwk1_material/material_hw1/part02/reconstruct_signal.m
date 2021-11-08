function [tr, yr] = reconstruct_signal(reconstruct_freq, ts, ys,interp_method)
% RECONSTRUCT_SIGNAL: reconstruct signal yr from ys by using different interpolation method 
% tr: resulting timeline
% yr: reconstructed signal
% reconstruct_freq: reconstruction frequency
% ts: sampled timeline
% ys: sampled signal
% interp_method: interpolation method
tr=0:1/reconstruct_freq:max(ts);
switch interp_method
    case 'zero_order_interp' 
        yr = ZeroOrderHoldReconstruction(tr,ts,ys);
    case 'first_order_interp'
        yr = FirstOrderHoldReconstruction(tr,ts,ys);
    case 'ws_interp'
        yr = wsSignalReconstruction(tr,ts,ys);
    otherwise
        yr = 0;
        warning('Unexpected interpolation type')
end

% TODO: plot the fft of reconstructed signal 
figure(3)
dataFrequency = 5000;
subplot(2,1,1);
plot(tr,yr)
xlabel("Time [s]")
ylim([-2 2]);

% Plot in frequency domain (fft)
subplot(2,1,2);
YR = fft(yr);
Fmax = 200;
fty=abs(YR/length(yr));
f=dataFrequency/2*linspace(0,1,round(length(yr)/2));
fty=fty(1:length(f));
maxIndex=find(f>Fmax,1);
plot([-f(maxIndex:-1:2) f(1:maxIndex)], [fty(maxIndex:-1:2) fty(1:maxIndex)]); grid on;
xlabel("Frequency [Hz]")
sgtitle("Signal in Frequency Domain");
saveas(figure(3), "Filtered_Signal_fdomain", "png");




end


% TODO: Reconstruct signal by using Whittaker-Shannon interpolation
function yr=wsSignalReconstruction(tr,ts,ys)
 if(length(tr)<5*length(ts))
        error('Reconstructed signal must have a frequency 5 times bigger than the sampling frequency');
 end
    Ts=(ts(2)-ts(1));
    yr=zeros(1,length(tr));
    %Shift from sampled signal to reconstructed signal
    for j=1:length(tr)
        for k=1:length(ys)        
            shift=tr(j)-ts(k);
            yr(j)=yr(j)+sinc(shift/Ts)*ys(k);
        end
    end

end

% TODO: Reconstruct signal by using first order hold interpolation
function yr=FirstOrderHoldReconstruction(tr,ts,ys)
    if(length(tr)<5*length(ts))
     error('Reconstructed signal must have a frequency 5 times bigger than the sampling frequency');
     end
    k=0;
    Ts=(ts(2)-ts(1));
    Tr=(tr(2)-tr(1));
    yr=zeros(1,length(tr));
    for j=1:length(ts)-1
        for k=k+1:k+round(Ts/Tr)
            yr(k)=ys(j)+(ys(j+1)-ys(j))*(tr(k)-ts(j))/Ts;
        end
    end
end

% TODO: Reconstruct signal by using zero order hold interpolation
function yr=ZeroOrderHoldReconstruction(tr,ts,ys)
    if(length(tr)<5*length(ts))
     error('Reconstructed signal must have a frequency 5 times bigger than the sampling frequency');
    end
    k=0;
    Ts=(ts(2)-ts(1));
    Tr=(tr(2)-tr(1));
    yr=zeros(1,length(tr));
    for j=1:length(ts)-1
        for k=k+1:k+round(Ts/Tr)
            yr(k)=ys(j);
        end
    end
    

end
