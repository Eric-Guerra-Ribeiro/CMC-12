function G = questao3(J, b, R, L, Kt)
% Defina a funcao de transferencia G do motor eletrico usando tf ou zpk.
% Caso queira, pode usar o truque de definir s: s = tf('s');
s = tf('s');
% G = ...
G = Kt/(s*(L*J*s^2 + (b*L + R*J)*s + b*R + Kt^2));
end
