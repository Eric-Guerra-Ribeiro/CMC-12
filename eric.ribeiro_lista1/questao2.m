x = @(t) 1 - exp(-0.7*t).*(cos(t*sqrt(51)/10) + 7*sqrt(51)/51*sin(t*sqrt(51)/10));
t = linspace(0, 10, 1000);
hold on
plot(t, x(t))
title('Sistema Massa-Mola-Amortecedor', 'FontSize', 25)
xlabel('Tempo (s)', 'FontSize', 20)
ylabel('Deformação da mola (m)', 'FontSize', 20)
hold off
