inicializarFrontal

out = sim("frontal.slx");

hold on
plot(out.x.time, out.x.signals.values, "-g", LineWidth=2)
plot([min(out.x.time), max(out.x.time)], [xr, xr], "--y", LineWidth=2)
title("Posição X - Controle Frontal")
xlabel("Tempo (s)")
ylabel("Posição (m)")
hold off

print -depsc2 'q1_x.eps'
