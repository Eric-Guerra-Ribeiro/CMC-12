function dinamica = obterMalhaHorizontal(controladorX, controladorTheta, planta)
% dinamica = obterMalhaHorizontal(controladorX, controladorTheta, planta)
% obtem a dinamica da malha horizontal. As structs controladorX e 
% controladorTheta possuem a seguinte estrutura:
% controlador.Kp: ganho proporcional.
% controlador.Ki: ganho integrativo.
% controlador.Kd: ganho derivativo.
% A struct planta tem os seguintes parametros:
% planta.m: massa.
% planta.J: inercia.
% planta.l: distancia entre os rotores.
% planta.g: aceleracao da gravidade.
% A saida dinamica eh a dinamica da malha horizontal na forma de funcao de
% transferencia.

sysGfTheta = obterMalhaArfagem(controladorTheta, planta);

s = tf('s');

%prefiltro = controladorX.Ki/(controladorX.Kd*s^2 + controladorX.Kp*s + controladorX.Ki);
dinamica = controladorX.Ki/((1/planta.g)*s^3 + sysGfTheta*(controladorX.Kd*s^2 + controladorX.Kp*s + controladorX.Ki));

end