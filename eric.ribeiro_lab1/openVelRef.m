load('data.mat');
time = (0:0.1:100)';
[m, b] = identificarCruiseControl(data.f, data.t, data.v);
d = 0;
% vr = 10 m/s
vr1 = 10;
u = zeros(length(time), 2);
u(:, 1) = time;
u(:, 2) = b*vr1;
out1 = sim('cruise_control_aberta.slx');
% vr = 20 m/s
vr2 = 20;
u = zeros(length(time), 2);
u(:, 1) = time;
u(:, 2) = b*vr2;
out2 = sim('cruise_control_aberta.slx');
% vr = 30 m/s
vr3 = 30;
u = zeros(length(time), 2);
u(:, 1) = time;
u(:, 2) = b*vr3;
out3 = sim('cruise_control_aberta.slx');

hold on
plot(out1.v.time, out1.v.signals.values, '-b', LineWidth=2)
plot(out2.v.time, out2.v.signals.values, '-y', LineWidth=2)
plot(out3.v.time, out3.v.signals.values, '-g', LineWidth=2)
plot([0, max(time)], [vr1, vr1], '--b', LineWidth=2)
plot([0, max(time)], [vr2, vr2], '--y', LineWidth=2)
plot([0, max(time)], [vr3, vr3], '--g', LineWidth=2)
title("Velocidade pelo Tempo - Malha Aberta")
xlabel("Tempo (s)")
ylabel("Velocidade (m/s)")
legend('v_r = 10 m/s', 'v_r = 20 m/s', 'v_r = 30 m/s')
hold off

print -depsc2 'vel_q2a.eps'
