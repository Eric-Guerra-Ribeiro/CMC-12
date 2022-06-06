function plotStepPlanta()
planta = obterPlantaLongitudinal();
tfinal= 60;
[simulation, time] = step(planta, tfinal);

t = tiledlayout(3,1);

nexttile
plot(time, simulation(:,1), '-g', LineWidth=2)
title("Velocidade Angular")
xlabel("Tempo (s)")
ylabel("q (crad/s)")

nexttile
plot(time, simulation(:,2), '-y', LineWidth=2)
title("Arfagem")
xlabel("Tempo (s)")
ylabel("\theta (crad)")

nexttile
plot(time, simulation(:,3), '-b', LineWidth=2)
title("Altitude")
xlabel("Tempo (s)")
ylabel("h (ft)")

print -depsc2 'stepPlanta.eps'
end
