m = 1;
l = 1;
b = 0.25;
g = 1;
theta0 = pi/2;
dtheta0 = 0;
t = linspace(0,30,1000);
theta = questao4(m, l, b, g, theta0, dtheta0, t);
hold on
plot(t, 180*theta(:,1)/pi)
title('Pêndulo Simples', 'FontSize', 25)
xlabel('Tempo (s)', 'FontSize', 20)
ylabel('Ângulo (º)', 'FontSize', 20)
hold off
