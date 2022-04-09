function [F, C] = questao4()
% Determinar as funcoes de transferencia F(s) e C(s) para que o sistema se
% comporte como um sistema de 2a ordem padrao com wn = 2 * pi * 2 rad/s e
% xi = 0.6.

m = 1000;
b = 50;
wn = 2 * pi * 2;
xi = 0.6;
s = tf('s');

F = 1/(((2*xi*wn - b/m)/wn^2)*s + 1);
C = (2*m*xi*wn - b)*s + m*wn^2;
end
