load('data.mat');
time = (0:0.1:100)';
[m_car, b] = identificarCruiseControl(data.f, data.t, data.v);
d = 0;
m_pass = 100;
vr = 10;
u = zeros(length(time), 2);
u(:, 1) = time;
u(:, 2) = b*vr;
% Normal
m = m_car;
out1 = sim('cruise_control_aberta.slx');
% With Passager
m = m_car + m_pass;
out2 = sim('cruise_control_aberta.slx');

hold on
plot(out1.v.time, out1.v.signals.values, '-y', LineWidth=2)
plot(out2.v.time, out2.v.signals.values, '-b', LineWidth=2)
plot([0, max(time)], [vr, vr], '--g', LineWidth=2)
title("Aumento de Massa - Cruise Control")
xlabel("Tempo (s)")
ylabel("Velocidade (m/s)")
legend('Sem Passageiro', 'Com Passageiro')
hold off

print -depsc2 'vel_q2d.eps'
