function [Kp, Ki] = questao4()
% Projetar um controlador PI para alocar polos complexo-conjugados em
% posicoes tais que wn = 6 rad/s e xi = 0.7.
wn = 6;
m = 1000;
b = 50;
z = -(m*wn^2)/(m*wn*sqrt(2) - b);
R = sqrt((z + b/m)*z);
l = sqrt((b/m)^2 + wn^2 - wn*b*sqrt(2)/m);
K = m*wn*l/R;
Kp = K;
Ki = -K*z;
end
