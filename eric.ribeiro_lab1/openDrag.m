load('data.mat');
time = (0:0.1:100)';
[m, b_car] = identificarCruiseControl(data.f, data.t, data.v);
d = 0;
delta_b = 10;
vr = 10;
u = zeros(length(time), 2);
u(:, 1) = time;
u(:, 2) = b_car*vr;
% Normal
b = b_car;
out1 = sim('cruise_control_aberta.slx');
% Less aereodynamic
b = b_car + delta_b;
out2 = sim('cruise_control_aberta.slx');

hold on
plot(out1.v.time, out1.v.signals.values, '-y', LineWidth=2)
plot(out2.v.time, out2.v.signals.values, '-b', LineWidth=2)
plot([0, max(time)], [vr, vr], '--g', LineWidth=2)
title("Erro de Modelo - Malha Aberta")
xlabel("Tempo (s)")
ylabel("Velocidade (m/s)")
legend('Sem erro em b', 'Com erro em b')
hold off

print -depsc2 'vel_q2e.eps'
