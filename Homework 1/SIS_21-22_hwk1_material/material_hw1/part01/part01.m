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
 stem(n,s, '.')
 title('Signal s');
 xlabel('n');
 ylabel('s[n]');
 ylim([-1.5,1.5]);
 saveas(figure(1), "Q1_SignalS", "png");

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
 stem(n,h, '.')
 title('Signal h');
 xlabel('n');
 ylabel('h[n]');
 ylim([-1.5,1.5]);
 saveas(figure(2), "Q1_SignalH", "png");
 
%% b)
first_signal = h;
second_signal = s;

result = take_conv(first_signal,second_signal);
x = -length(n)+1:length(n)-1;
figure(3)
stem(x, result, '.')
title('Discrete Convolution (h*s)');
ylim([-1.5,1.5]);
saveas(figure(3), "Q1_conv", "png");