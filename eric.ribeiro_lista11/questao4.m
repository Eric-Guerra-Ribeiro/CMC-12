function deltaPM = questao4()
% Calcule a perda de margem de fase provocada pelos atrasos na malha.
% Retorne um valor positivo.
m = 1000;
b = 50;
T = 1/10;
tau = 50e-3;
xi = 0.7;
wn = 1;
wcp = sqrt(2*xi*wn*(b/m - xi*wn) + sqrt(4*xi^2*wn^2*(xi*wn - b/m)^2 + wn^2));
deltaPM = rad2deg(wcp*(T/2 + tau));
end