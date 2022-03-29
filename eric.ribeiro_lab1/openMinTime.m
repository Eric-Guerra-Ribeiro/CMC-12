load('data.mat');
time = (0:0.1:100)';
[m, b] = identificarCruiseControl(data.f, data.t, data.v);
d = 0;
fMax = 2000;
vr = 10;
minTime = (m/b)*log(fMax/(fMax - b*vr));
% Normal
u = zeros(length(time), 2);
u(:, 1) = time;
u(:, 2) = b*vr;
out1 = sim('cruise_control_aberta.slx');
% Minimum Time
u = zeros(length(time), 2);
u(:, 1) = time;
u(:, 2) = b*vr;
u(time <= minTime, 2) = fMax;
out2 = sim('cruise_control_aberta.slx');

hold on
plot(out1.v.time, out1.v.signals.values, '-b', LineWidth=2)
plot(out2.v.time, out2.v.signals.values, '-y', LineWidth=2)
plot([0, max(time)], [vr, vr], '--g', LineWidth=2)
title("Tempo Mínimo - Cruise Control")
xlabel("Tempo (s)")
ylabel("Velocidade (m/s)")
legend('Normal', 'Tempo Mínimo')
hold off

print -depsc2 'vel_q2b.eps'
