inicializarFrontal

x_theory = @(t) xr*(1-exp(-Kx*t));

out = sim("frontal.slx");

hold on
plot(out.x.time, out.x.signals.values, "-g", LineWidth=2)
plot(out.x.time, x_theory(out.x.time), "--y", LineWidth=2)
plot([min(out.x.time), max(out.x.time)], [xr, xr], "--b", LineWidth=2)
title("Posição X - Controle Frontal")
xlabel("Tempo (s)")
ylabel("Posição (m)")
legend("Resultado Simulação", "Curva Teórica", "x_r")
hold off

print -depsc2 'q1_x.eps'
