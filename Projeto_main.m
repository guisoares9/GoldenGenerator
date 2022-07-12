clc
close all
clear all


%Exercçio 2 (das 6h às 6h do outro dia)
%t = linspace(6*3600, 30*3600, 1000)

t = linspace(6*3600, 30*3600, 24000);

global m_sen m_g cp_bat cp_sen cp_g tau A_mot cp_mot m_mot eps ...
    sigma UA_rad m_ar m_dot_mot m_dot_res h_par A_par A_g A_bat h_mot ...
    h_g h_bat m_bat A_res m_res cp_res h_nat_v h_nat_h F_mot ...
    T_ceu A_par_LOTC_res alfa m_par_mot m_par_res cp_par R_cont_res_chao...
    k_la_roc x_la_roc A_par_res At_l At_f h1 h2 F_res_m_rc F_res_m_cr ...
    F_res_M_rc F_res_M_cr tau_res S_res S_mot k_chao T_chao IsOn;

%Exercício 4) IsOn = 1;
T_chao = 23+273;
k_chao = 1;
S_res = 6.8;
S_mot = 6.14;
h_nat_h = 3.67;
x_la_roc = 0.1;
k_la_roc = 0.03;
R_cont_res_chao = 100;
alfa = 0.7;
h_nat_v = 3.8;
T_ceu = 273;
A_g = 0.8;
A_par_LOTC_res = 8.5;
A_bat = 0.3;
A_par = 6.25*6;
A_res = 24;
h_par = 4.19;
m_ar = 17;
m_dot_mot = 20;
m_dot_res = 20;
%Ex 3c) m_dot_res = 2e-3
A_mot = 2;
cp_mot = 600;
m_mot = 400;
m_res = 7200;
cp_res = 1800;
eps = 0.9;
sigma = 5.67e-8;
UA_rad = 1000;
%Exercício 4 UA = 2000;
h_bat = 13.9;
h_g = 11.19;
h_mot = 8.92;
m_sen = 1e-2;
cp_sen =500;
tau = 10; %[s]
tau_res = 5*60;
m_bat = 40;
m_g = 100;
cp_g = 500;
cp_bat = 800;
F_mot = (A_g + A_bat + A_mot)/A_par;
F_res_m_rc = 0.8;
F_res_m_cr = 0.415;
F_res_M_rc = 0.9;
F_res_M_cr = 0.476;
m_par_mot = 100;
m_par_res = 130;
cp_par = 460;
A_par_res = 46.5;
h1 = 4.94;
h2 = 4.19;
At_l = 4.5*4;
At_f = 3.24*2;

[t, T] = ode45('mainSystem', t, 296*ones(1, 20));

%Passando para °C
T = T - 273;

%% Plot and subplot of the temperatures 

t_hours = t/(60*60); 

figure

% Plot 
subplot(5,4,1)
plot(t_hours,T(:,1),'LineWidth',1.5)
grid on
xlabel('Time[h]')
%ylabel('Engine Temperature')
title('Temperatura do motor')

subplot(5,4,2)
plot(t_hours,T(:,2),'LineWidth',1.5)
grid on
xlabel('Time[h]')
%ylabel('Air Engine Temperature')
title('Temperatura do ar do motor')

subplot(5,4,3)
plot(t_hours,T(:,3),'LineWidth',1.5)
grid on
xlabel('Time[h]')
%ylabel('Sensor Temperature')
title('Sensor de temperatura do motor')

subplot(5,4,4)
plot(t_hours,T(:,4),'LineWidth',1.5)
grid on
xlabel('Time[h]')
%ylabel('Battery Temperature')
title('Temperatura da bateria')

subplot(5,4,5)
plot(t_hours,T(:,5),'LineWidth',1.5)
grid on
xlabel('Time[h]')
%ylabel('Generator Temperature')
title('Temperatura do gerador')

subplot(5,4,6)
plot(t_hours,T(:,6),'LineWidth',1.5)
grid on
title('Temperatura da parede norte')

subplot(5,4,7)
plot(t_hours,T(:,7),'LineWidth',1.5)
grid on
xlabel('Time[h]')
title('Temperatura da parede norte')

subplot(5,4,8)
plot(t_hours,T(:,8),'LineWidth',1.5)
grid on
xlabel('Time[h]')
title('Temperatura da parede leste-Motor')

subplot(5,4,9)
plot(t_hours,T(:,9),'LineWidth',1.5)
grid on
xlabel('Time[h]')
title('WTemperatura da parede oeste-Motor')

subplot(5,4,10)
plot(t_hours,T(:,10),'LineWidth',1.5)
grid on
xlabel('Time[h]')
title('Temperatura do teto-Motor')

subplot(5,4,11)
plot(t_hours,T(:,11),'LineWidth',1.5)
grid on
xlabel('Time[h]')
title('Temperatura da parede leste-Reservatorio')

subplot(5,4,12)
plot(t_hours,T(:,12),'LineWidth',1.5)
grid on
xlabel('Time[h]')
title('Temperatura da parede oeste-Reservatorio')

subplot(5,4,13)
plot(t_hours,T(:,13),'LineWidth',1.5)
grid on
xlabel('Time[h]')
title('Temperatura do teto-Reservatorio')

subplot(5,4,14)
plot(t_hours,T(:,14),'LineWidth',1.5)
grid on
xlabel('Time[h]')
title('Temperatura da Corta Fogo-Motor')

subplot(5,4,15)
plot(t_hours,T(:,15),'LineWidth',1.5)
grid on
xlabel('Time[h]')
title('Temperatura da Corta Fogo-Reservatorio')

subplot(5,4,16)
plot(t_hours,T(:,16),'LineWidth',1.5)
grid on
xlabel('Time[h]')
title('Temperatura do Reservatorio')

subplot(5,4,17)
plot(t_hours,T(:,17),'LineWidth',1.5)
grid on
xlabel('Time[h]')
title('Temperatura do chao do motor')

subplot(5,4,18)
plot(t_hours,T(:,18),'LineWidth',1.5)
grid on
xlabel('Time[h]')
title('Temperatura do chao do reservatorio')

subplot(5,4,19)
plot(t_hours,T(:,19),'LineWidth',1.5)
grid on
xlabel('Time[h]')
title('Temperatura do ar do reservatorio')

subplot(5,4,20)
plot(t_hours,T(:,20),'LineWidth',1.5)
grid on
xlabel('Time[h]')
title('Temperatura do sensor do reservatorio')