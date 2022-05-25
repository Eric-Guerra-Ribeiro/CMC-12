function dinamica = obterMalhaVerticalSemPreFiltro(controlador, planta)
% dinamica = obterMalhaVertical(controlador, planta) obtem a dinamica da
% malha vertical. A struct controlador possui os seguintes parametros:
% controlador.Kp: ganho proporcional.
% controlador.Ki: ganho integrativo.
% controlador.Kd: ganho derivativo.
% A struct planta tem os seguintes parametros:
% planta.m: massa.
% planta.J: inercia.
% planta.l: distancia entre os rotores.
% planta.g: aceleracao da gravidade.
% A saida dinamica eh a dinamica da malha vertical na forma de funcao de
% transferencia.
s = tf('s');

dinamica = (controlador.Kd*s^2 + controlador.Kp*s + controlador.Ki)...
           /(planta.m*s^3 + controlador.Kd*s^2 + controlador.Kp*s + controlador.Ki);

end