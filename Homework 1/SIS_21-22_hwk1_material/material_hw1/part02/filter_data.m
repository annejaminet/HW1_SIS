function yf = filter_data(y,coeff)
% FILTER_DATA: Filter a signal y by using a FIR filter with coff
% yf: filtered signal
% y: original signal
% coeff: coefficient of the FIR filter
yf=zeros(length(y),1);
for(n=1:1:length(y))
    if(n>length(coeff))
        for(k=1:1:length(coeff))
            yf(n,1)=yf(n,1)+coeff(k)*y(n-k);
        end
    else
        for(k=1:1:(n-1))
            yf(n,1)=yf(n,1)+coeff(k)*y(n-k);
        end
    end
end




