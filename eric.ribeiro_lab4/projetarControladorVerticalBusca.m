function controlador = projetarControladorVerticalBusca(requisitos, planta)
% controlador = projetarControladorVerticalBusca(requisitos, planta) 
% projeta o controlador vertical com um refinamento atraves de busca em 
% grade para um melhor atendimento aos requisitos. As entradas da funcao 
% sao as structs requisitos e planta, que contem os requisitos e os 
% parametros da planta, respectivamente. Os requisitos sao:
% requisitos.tr: tempo de subidade de 0 a 100%.
% requisitos.Mp: sobressinal.
% A planta eh dada por:
% planta.m: massa.
% planta.J: inercia.
% planta.l: distancia entre os rotores.
% planta.g: aceleracao da gravidade.
% A saida da funcao eh a struct controlador com:
% controlador.Kp: ganho proporcional.
% controlador.Ki: ganho integrativo.
% controlador.Kd: ganho derivativo.

% Numero de valores de cada parametro usados na grade
N = 20;

% Gerando os valores na grade
trs = linspace(0.8 * requisitos.tr, 1.2 * requisitos.tr, N);
Mps = linspace(0.8 * requisitos.Mp, 1.2 * requisitos.Mp, N);

% Iterar sobre a grade de trs e Mps para determinar o par tr e Mp que
% melhor atende aos requisitos

J = inf;
for i=1:N
    for j=1:N
        requisito.tr = trs(i);
        requisito.Mp = Mps(j);
        sys = obterMalhaVertical(projetarControladorVerticalAnalitico(requisito, planta), planta);
        simInfo = stepinfo(sys, 'RiseTimeLimits', [0, 1]);
        Jij = (abs((requisitos.tr - simInfo.RiseTime)/requisitos.tr) ...
               + abs((requisitos.Mp - simInfo.Overshoot/100)/requisitos.Mp));
        if J > Jij
            J = Jij;
            tr = requisito.tr;
            Mp = requisito.Mp;
        end
    end
end

requisito.tr = tr;
requisito.Mp = Mp;

controlador = projetarControladorVerticalAnalitico(requisito, planta);

end