function [wcp, ganhoPM] = questao4()
% Determinar analiticamente a frequencia de cruzamento wcp e o ganho (aumento) de
% margem de fase (em graus) ganhoPM devido a troca do sensor.
wcp = 7.29958172596711;
tau1 = 100*1e-3;
tau2 = 30*1e-3;
ganhoPM = rad2deg((tau1 - tau2)*wcp);
end
