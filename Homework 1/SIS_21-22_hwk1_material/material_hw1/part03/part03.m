%% part03 (System theory)
% Kagan Erunsal, kagan.erunsal@epfl.ch, Oct 2021

%% Q11 (use ilaplace())
syms C_sym R_sym s_sym  
sympref('HeavisideAtOrigin',1);
assume(s_sym >0);
H2 = 1/(s_sym*C_sym*R_sym+ 1);
h2 = ilaplace(H2, s_sym); 
simplify(h2);

%% Q12
R = 1;
C = 1; 
H1 = R/(s_sym*C*R + 1);

% a (use tf() and step())
figure(1)
subplot(2,1,1)
H1_tf = tf(R, [C*R, 1]);
step(H1_tf)

% b (use int())
syms t_sym u_sym
assume(s_sym, 'clear');
%assume(t_sym > 0);
step_fct = heaviside(t_sym);

h1 = (1/C)*(exp(-t_sym/(C*R))*u_sym);
f = step_fct *h1;
H1_int = int(f, t_sym, -inf, inf); %%%%%%%%%%%%%%%% QUESTION %%%%%%%%%%%%%%
% simplify(h1);
% simplify(H1_int);

subplot(2,1,2)
fplot(H1_int)
saveas(figure(1), "Q12_Step_response", "png");
%assume(t_sym, 'clear')
%% Q13
% System 1
R = 1;
C = 5; 
H1_tf2 = tf(R, [C*R, 1]);

figure(2)
subplot(2,1,1)
step(H1_tf2)
title('Step Response System 1');

% System 2
R = 5;
C = 1;
H1_tf3 = tf(R, [C*R, 1]);
subplot(2,1,2)
step(H1_tf3)
title('Step Response System 2');


%% Q14 (use c2d())
ts = 0.1; % sampling time 
R = 1; 
C = 1; 
H1_tf4 = tf(R, [C*R, 1]);

H1_tf4_z = c2d(H1_tf4, ts, 'zoh');
figure(3)
subplot(2,1,1)
step(H1_tf4_z)
title('Discrete Step Reponse')

subplot(2,1,2)
step(H1_tf4)
title('Continuous Step Reponse')




%% Q15 (use iztrans())
syms z_sym

assume(z_sym > 0);
assume(t_sym > 0);
%Define H1
H1_sym = simplify(0.09516/(z_sym - 0.9048),'Steps',2);

% Z-Transform of step function (frequency domain)
S = ztrans(step_fct, t_sym, z_sym);

x_z_sym = S*H1_sym ; 

% Back to time domain
x_sym = iztrans(x_z_sym, z_sym, t_sym); 

simplify(x_sym);

figure(4)
fplot(x_sym, [0, 60])



%% Q16 (use fft())
n = 0:1:100; 

x_n = 10.5042-9.5042*(0.9048).^n ; 
 

figure(5)

% Plot fft
% Zero padding
N = 256;
% Adjust frequency axis
w = 2*pi * (0:(N-1)) / N;
w2 = fftshift(w);
w3 = unwrap(w2 - 2*pi);

%Assume Fs = 100 Hz %%%%%%%%%%%%%%%%%%%%%%% QUESTION %%%%%%%%%%%%%%%%%%%%
Fs = 100; %Hz
X_n = fft(x_n,N);
abs_X2 = abs(X_n);
fs = Fs*(-N/2:1:N/2-1)/N;

%Plot FFT 
stem(fs,fftshift(abs_X2))
grid on
hold on
xlabel('Frequency [Hz]')
ylabel('Amplitude')
legend('FFT');
title('FFT of Step Response')


saveas(figure(5), "Q16_FFT", "png");


%% Q17 (use lsim())

load('heaterData.mat')

figure(6)
plot(heater_n, heater_u)
ylim([0 1.2]);
xlim([0 11]);
title('Heater Input')
xlabel('Time-stamps')
ylabel('Heater Data')
saveas(figure(6), "Q17_HeaterData", "png");


x_n_heat = tf(0.09516, [1, -0.9048]);
H1_sym = simplify(0.09516/(z_sym - 0.9048),'Steps',2);

figure(7)
lsim(x_n_heat, heater_u, heater_n) %%%%%%%%%%%%%%%%%%%%%%% QUESTION %%%%%%%%%%%%%%%%%%%%