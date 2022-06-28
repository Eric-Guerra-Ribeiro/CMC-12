function [Kp, Kv] = questao2()
% Projetar Kp e Kv para que o carro autonomo tenha banda passante de 1 Hz e
% margem de fase de 60 graus. Usar formulas exatas, i.e. sem aproximacoes.
m = 1000;
b = 50;
PM = 60;
wb = 2*pi*1;
xi = tand(PM)*sqrt(cosd(PM))/2;
wn = wb/sqrt(1 - 2*xi^2 + sqrt(2 - 4*xi^2 + 4*xi^4));
Kv = 2*m*xi*wn - b;
Kp = m*wn^2/Kv;
end
