% function avaliarMalhaVerticalPreFiltro()
% avaliarMalhaVertical() avalia o projeto da malha vertical.

requisitos.tr = 1.0;
requisitos.Mp = 0.1;

planta = obterPlantaMulticoptero();

controlador = projetarControladorVerticalAnalitico(requisitos, planta);

malhaComPreFiltro = obterMalhaVertical(controlador, planta);
malhaSemPreFiltro = obterMalhaVerticalSemPreFiltro(controlador, planta);

t = 0:1e-3:5;

zComPreFiltro = step(malhaComPreFiltro, t);
zSemPreFiltro = step(malhaSemPreFiltro, t);

figure;
hold on;
plot(t, zComPreFiltro, 'LineWidth', 2);
plot(t, zSemPreFiltro, 'LineWidth', 2);
grid on;
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Z (m)', 'FontSize', 14);
set(gca, 'FontSize', 14);
legend('Com Pré-Filtro', 'Sem Pré-Filtro', 'FontSize', 14, 'Location', 'Southeast');

print -depsc2 malha_vertical_prefiltro.eps

% end