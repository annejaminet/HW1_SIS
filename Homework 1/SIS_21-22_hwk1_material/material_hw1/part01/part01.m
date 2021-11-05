%% part01: Convolution
% Kagan Erunsal, kagan.erunsal@epfl.ch, Oct 2021

%% Q1

n = -50:1:50;

s = zeros(length(n),1);

% a)
%Signal s
for i=1:length(n)
    if (n(i) >= -5) && (n(i) <= 5)
        s(i)= cos(0.5*n(i));
    else 
        s(i) = 0;
    end 
end 

 figure(1)
 scatter(n,s)
 title('Signal s');
 xlabel('n');
 ylabel('s[n]')

 %Signal h 
 h = zeros(length(n),1);
for i=1:length(n)
    if (n(i) == -25) || (n(i) == 0) || (n(i) == 25)
        h(i)= 1;
    else 
        h(i) = 0;
    end 
end 

 figure(2)
 scatter(n,h)
 title('Signal h');
 xlabel('n');
 ylabel('h[n]')
 
%% b)
first_signal = h;
second_signal = s;

result = take_conv(first_signal,second_signal);
x = -length(n)+1:length(n)-1;
figure(3)
stem(x, result)
title('Discrete Convolution (h*s)')