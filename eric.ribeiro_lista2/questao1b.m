function q = questao1b()
% Retorne o valor da carga do capacitor no tempo t = 0.02 s. Use SI.
V = 5;
R = 10e3;
C = 1e-6;
Q = @(t) C*V*(1-exp(-t/(R*C)));
t1 = 0.02;
% q = ...
q = Q(t1);
end