function controlador = projetarControladorArfagem(requisitos, planta)
% controlador = projetarControladorArfagem(requisitos, planta) projeta o
% controlador de arfagem. As entradas da funcao sao as structs requisitos e
% planta, que contem os requisitos e os parametros da planta,
% respectivamente. Os requisitos sao:
% requisitos.tr: tempo de subidade de 0 a 100%.
% requisitos.Mp: sobressinal.
% A planta eh dada por:
% planta.m: massa.
% planta.J: inercia.
% planta.l: distancia entre os rotores.
% planta.g: aceleracao da gravidade.
% A saida da funcao eh a struct controlador com:
% controlador.Kp: ganho proporcional.
% controlador.Kv: ganho de velocidade.

xi = 1/sqrt((pi/log(requisitos.Mp))^2+1);
wn = (pi - acos(xi))/(requisitos.tr*sqrt(1 - xi^2));

controlador.Kv = 2*planta.J*xi*wn;
controlador.Kp = wn/(2*xi);

end