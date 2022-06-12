function [phi, sAst, K] = questao2()
% Determinar:
% - O angulo de saida phi (em graus) do ramo do lugar geometrico das raizes
% (LGR) que comeca no polo -1 + j.
% - O ponto de chegada sAst do mesmo ramo no eixo real.
% - O ganho K assocado a este ponto de chegada.
phi = 90 + atand(1/9);
sAst = -10 - sqrt(82);
K = 20*(sqrt(82) + 9);
end
