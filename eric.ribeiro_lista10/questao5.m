function [GR, GN, GD] = questao5(L, R, Kp, Ki, a)
% Determine a resposta em funcao de L, R, Kp, Ki e a. Escreva as funcoes de
% transferencia com o s de Laplace definido logo abaixo.

s = tf('s');
GR = Ki*(s + a)/(L*s^3 + (a*L + R)*s^2 + a*(Kp + R)*s + a*Ki);
GN = -a*(Kp*s + Ki)/((s + a)*(L*s^2 + (Kp + R)*s + Ki));
GD = s*(s + a)/(L*s^3 + (a*L + R)*s^2 + a*(Kp + R)*s + a*Ki);
end
