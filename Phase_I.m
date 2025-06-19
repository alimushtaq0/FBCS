% Open-Loop Transfer Function G(s)
s = tf('s');
sys_ol = (1.151*s + 0.1774)/(s^3 + 0.739*s^2 + 0.921*s);

%% Part a) Open-Loop Poles and PZ Map
disp('Open-loop poles:');
poles_ol = pole(sys_ol);
disp(poles_ol)

figure;
pzmap(sys_ol);
title('Pole-Zero Map of Open-Loop System');
grid on;

%% Part b) Root Locus of Open-Loop System
figure;
rlocus(sys_ol);
title('Root Locus of Open-Loop System');
grid on;

%% Part c) Open-Loop Step Response (0.2 units input)
figure;
step(0.2 * sys_ol);
title('Open-Loop Step Response (Input = 0.2 units)');
xlabel('Time');
ylabel('Output');
grid on;

sys_info = stepinfo(0.2 * sys_ol);
disp('Open-Loop Step Response Characteristics:');
disp(sys_info)

%% Part d) Closed-Loop System with Unity Feedback
sys_cl = feedback(sys_ol, 1);

figure;
step(0.2*sys_cl);
title('Closed-Loop Step Response');
xlabel('Time');
ylabel('Output');
grid on;

info_cl = stepinfo(0.2*sys_cl);
disp('Closed-Loop Step Response Characteristics:');
disp(info_cl);

%% Part e) Closed-Loop Poles and PZ Map
disp('Closed-loop poles:');
poles_cl = pole(sys_cl);
disp(poles_cl);

figure;
pzmap(sys_cl);
title('Pole-Zero Map of Closed-Loop System');
grid on;

%% Part f) Root Locus of Closed-Loop System
figure;
rlocus(sys_cl);
title('Root Locus of Closed-Loop System');
grid on;

%% Part g) Bode Plot of the Open-Loop System
figure;
margin(sys_ol);
title('Bode Plot with Gain and Phase Margins (Open-Loop)');
grid on;

[Gm, Pm] = margin(sys_ol);
disp('Gain Margin:');
disp(20*log10(Gm));
disp('Phase Margin:');
disp(Pm);
