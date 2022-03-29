load('data.mat');
[m, b] = identificarCruiseControl(data.f, data.t, data.v);
v = @(t) data.f/b*(1-exp(-b*t/m));

hold on
fig = plot(data.t, v(data.t), '-y', LineWidth=2);
plot(data.t, data.v, '--g', LineWidth=2)
title("Velocidade pelo Tempo - Cruise Control")
xlabel("Tempo (s)")
ylabel("Velocidade (m/s)")
legend('Simulação', 'Experimento')
hold off
print -depsc2 'vel_t.eps'
