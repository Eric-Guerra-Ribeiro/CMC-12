load('data.mat');
time = (0:0.1:100)';
[m, b] = identificarCruiseControl(data.f, data.t, data.v);
vr = 10;
% d = 100 N
d = 100;
u = zeros(length(time), 2);
u(:, 1) = time;
u(:, 2) = b*vr;
out1 = sim('cruise_control_aberta.slx');
% d = 200 N
d = 200;
u = zeros(length(time), 2);
u(:, 1) = time;
u(:, 2) = b*vr;
out2 = sim('cruise_control_aberta.slx');
% d = 300 N
d = 300;
u = zeros(length(time), 2);
u(:, 1) = time;
u(:, 2) = b*vr;
out3 = sim('cruise_control_aberta.slx');

hold on
plot(out1.v.time, out1.v.signals.values, '-b', LineWidth=2)
plot(out2.v.time, out2.v.signals.values, '-y', LineWidth=2)
plot(out3.v.time, out3.v.signals.values, '-g', LineWidth=2)
plot([0, max(time)], [vr1, vr1], '--k', LineWidth=2)
title("Perturbação - Cruise Control")
xlabel("Tempo (s)")
ylabel("Velocidade (m/s)")
legend('d = 100 N', 'd = 200 N', 'd = 300 N')
hold off

print -depsc2 'vel_q2c.eps'
