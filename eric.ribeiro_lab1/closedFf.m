load('data.mat');
time = (0:0.1:100)';
[m, b] = identificarCruiseControl(data.f, data.t, data.v);
d = 0;
bc = 0;
tau = 10;
Kp = m/tau - b;
vr = 10;
out = sim('cruise_control_fechada.slx');

hold on
plot(out.v.time, out.v.signals.values, '-b', LineWidth=2)
plot([0, max(time)], [vr, vr], '--g', LineWidth=2)
title("Sem Feedforward - Malha Fechada")
xlabel("Tempo (s)")
ylabel("Velocidade (m/s)")
hold off

print -depsc2 'vel_q3b.eps'
