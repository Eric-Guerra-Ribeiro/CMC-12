function [p1, p2] = questao1(tr, Mp)
% Determinar os polos de um sistema de 2a ordem a partir do tempo de 
% subida de 0 a 100% tr e sobressinal Mp. Convencao:
% p1 = -sigma + wd * j,
% p2 = -sigma - wd * j,
% em que sigma > 0 e wd > 0.
xi = 1/(1 + (pi/log(Mp))^2);
wd = (pi - acos(xi))/tr;
sigma = xi*wd/sqrt(1 - xi^2);
p1 = -sigma + wd*1j;
p2 = -sigma - wd*1j;
end
