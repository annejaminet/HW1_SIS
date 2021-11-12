%% Convolution function
% Kagan Erunsal, kagan.erunsal@epfl.ch, Oct 2021

% first_signal: first signal as vector or function
% second_signal: second signal as vector or function
% aux_var: Any auxillary variable you might need
% result: convolution result as vector

function  result = take_conv(first_signal,second_signal)

n = length(first_signal);
m = length(second_signal);
N = n+m-1;
result= zeros(1, N);

for i = 1:n
    for j=1:m
        result(i+j-1) =result(i+j-1) + first_signal(i)*second_signal(j);
    end 
end 


end

