load('data.mat');
time = (0:0.1:100)';
[m, b] = identificarCruiseControl(data.f, data.t, data.v);
bc = b;
tau = 10;
Kp = m/tau - b;
vr = 10;

% d = 100 N
d = 100;
out1 = sim('cruise_control_fechada.slx');
% d = 200 N
d = 200;
out2 = sim('cruise_control_fechada.slx');
% d = 300 N
d = 300;
out3 = sim('cruise_control_fechada.slx');

hold on
plot(out1.v.time, out1.v.signals.values, '-b', LineWidth=2)
plot(out2.v.time, out2.v.signals.values, '-y', LineWidth=2)
plot(out3.v.time, out3.v.signals.values, '-g', LineWidth=2)
plot([0, max(time)], [vr, vr], '--k', LineWidth=2)
title("Perturbação - Malha Fechada")
xlabel("Tempo (s)")
ylabel("Velocidade (m/s)")
legend('d = 100 N', 'd = 200 N', 'd = 300 N')
hold off

print -depsc2 'vel_q3c.eps'
