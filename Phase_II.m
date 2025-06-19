clc, close all, clearvars
s = tf('s');
G = (1.151*s + 0.1774)/(s^3 + 0.739*s^2 + 0.921*s);
%K = 272.7; % From calculations done in part b)
K = 45;
margin(K*G)
[~, Pm,~,w_c] = margin(K*G);
figure;
%w_c = 17.7; % From Bode plot of KG
Phi_max = 65-Pm;
alpha = (1-sin(deg2rad(Phi_max)))/(1+sin(deg2rad(Phi_max)));
w_d = w_c*(sqrt(alpha)); % Zero
pole_loc = w_d/alpha; % Pole
Dc = sqrt(alpha)*(s/w_d + 1)/(s/pole_loc + 1);
system = K*G*Dc;
KGDc = feedback(system,1);
margin(system);
figure;
step(0.2*KGDc);
stepinfo(0.2*KGDc)
