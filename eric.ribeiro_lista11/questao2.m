function [alpha, T] = questao2()
% Projete a compensacao lag para reduzir o erro em regime pela metade.
% Considere a compensacao lag na seguinte forma:
% Clag = alpha * (T * s + 1) / (alpha * T * s + 1)
K = 9;
alpha = 19/K;
wcp = sqrt((sqrt(11689) - 13)/2);
T = 10/wcp;
end
