load('data.mat');
time = (0:0.1:100)';
[m, b] = identificarCruiseControl(data.f, data.t, data.v);
d = 0;
bc = b;
tau = 10;
Kp = m/tau - b;
vr = 10;

out = sim('cruise_control_fechada.slx');

hold on
plot(out.u.time, out.u.signals.values, '-b', LineWidth=2)
title("Esforço de Controle - Malha Fechada")
xlabel("Tempo (s)")
ylabel("Força (N)")
hold off

print -depsc2 'u_q3e.eps'
