function [Kp, Kpsi] = questao5()
% Calcule os valores de Kp e Kpsi para que o sistema atenda aos requisitos
% no dominio da frequencia.
Mr = 0.3546;
v = 1;
wb = 6;
xi = sqrt((1 - sqrt(1 - 10^(-Mr/10)))/2);
wn = wb/sqrt(1-2*xi^2*sqrt(2 - 4*xi^2 + 4*xi^4));
Kp = wn/(2*xi*v);
Kpsi = 2*xi*wn;
end
