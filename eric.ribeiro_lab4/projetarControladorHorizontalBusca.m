function controlador = projetarControladorHorizontalBusca(requisitosX,...
    requisitosTheta, planta)
% controlador = projetarControladorHorizontalBusca(requisitosX,
% requisitosTheta, planta) projeta o controlador horizontal com um 
% refinamento atraves de busca em grade para um melhor atendimento aos 
% requisitos. As entradas da funcao sao as structs requisitosX, 
% requisitosTheta e planta, que contem os requisitos da malha horizontal,
% os requisitos da malha de arfagem e os parametros da planta, 
% respectivamente. requisitosX e requisitosTheta sao da forma:
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
trs = linspace(0.8 * requisitosX.tr, 1.2 * requisitosX.tr, N);
Mps = linspace(0.8 * requisitosX.Mp, 1.2 * requisitosX.Mp, N);

% Iterar sobre a grade de trs e Mps para determinar o par tr e Mp que
% melhor atende aos requisitos

J = inf;
for i=1:N
    for j=1:N
        requisitoX.tr = trs(i);
        requisitoX.Mp = Mps(j);
        sys = obterMalhaHorizontal(projetarControladorHorizontalAnalitico(requisitoX, planta), projetarControladorArfagem(requisitosTheta, planta), planta);
        simInfo = stepinfo(sys, 'RiseTimeLimits', [0, 1]);
        Jij = (abs((requisitosX.tr - simInfo.RiseTime)/requisitosX.tr) ...
               + abs((requisitosX.Mp - simInfo.Overshoot/100)/requisitosX.Mp));
        if J > Jij
            J = Jij;
            tr = requisitoX.tr;
            Mp = requisitoX.Mp;
        end
    end
end

requisitoX.tr = tr;
requisitoX.Mp = Mp;

controlador = projetarControladorHorizontalAnalitico(requisitoX, planta);

end