load('data.mat');
time = (0:0.1:100)';
[m, b_car] = identificarCruiseControl(data.f, data.t, data.v);
d = 0;
bc = b_car;
delta_b = 10;
tau = 10;
Kp = m/tau - b_car;
vr = 10;
% Normal
b = b_car;
out1 = sim('cruise_control_fechada.slx');
% Less aeordynamic
b = b_car + delta_b;
out2 = sim('cruise_control_fechada.slx');

hold on
plot(out1.v.time, out1.v.signals.values, '-y', LineWidth=2)
plot(out2.v.time, out2.v.signals.values, '-b', LineWidth=2)
plot([0, max(time)], [vr, vr], '--g', LineWidth=2)
title("Erro de Modelo - Malha Aberta")
xlabel("Tempo (s)")
ylabel("Velocidade (m/s)")
legend('Sem erro em b', 'Com erro em b')
hold off

print -depsc2 'vel_q3d.eps'
