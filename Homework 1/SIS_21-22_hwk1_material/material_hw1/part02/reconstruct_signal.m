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


end


% TODO: Reconstruct signal by using Whittaker-Shannon interpolation
function yr=wsSignalReconstruction(tr,ts,ys)


end

% TODO: Reconstruct signal by using first order hold interpolation
function yr=FirstOrderHoldReconstruction(tr,ts,ys)

end

% TODO: Reconstruct signal by using zero order hold interpolation
function yr=ZeroOrderHoldReconstruction(tr,ts,ys)

end
