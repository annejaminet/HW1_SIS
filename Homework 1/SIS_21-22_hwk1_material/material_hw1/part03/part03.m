%% part03 (System theory)
% Kagan Erunsal, kagan.erunsal@epfl.ch, Oct 2021

%% Q11 (use ilaplace())
syms C_sym R_sym s_sym t_sym u_sym
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
assume(s_sym, 'clear')
assume(t_sym > 0);
h1 = (1/C)*(exp(-t_sym/(C*R))*u_sym);
H1_int = int(h1, t_sym, -inf, inf);
simplify(h1);
simplify(H1_int);

subplot(2,1,2)
fplot(H1_int)
saveas(figure(1), "Q12_Step_response", "png");
assume(t_sym, 'clear')
%% Q13


%% Q14 (use c2d())


%% Q15 (use iztrans())


%% Q16 (use fft())


%% Q17 (use lsim())
