function [Kmin, Kmax] = questao4()
% Calcule os valores minimo e maximo de K para que o sistema atenda aos
% requisitos.
b = 50;
m = 1000;
w = 10;
Kmax = (b + sqrt(99*m^2*w^2 + 100*b^2))/99;
Kmin = max(10*b/9, (b - sqrt(99*m^2*w^2 + 100*b^2))/99);
end
