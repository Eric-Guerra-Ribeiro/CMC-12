function [Kp, Kv] = questao2(R, Kt, J, b, wn, xi)
% Use as variaveis R, Kt, J, b, wn e xi para definir a sua resposta.
% Talvez voce nao precise de todas as variaveis para definir sua resposta.
% Definir Kp e Kv, que sao retornados pela funcao.

% Kp = ...
% Kv = ...
Kp = J*R*wn^2/(2*J*R*xi*wn - Kt^2 - R*b);
Kv = (2*J*R*xi*wn - R*b)/Kt - Kt;
end
