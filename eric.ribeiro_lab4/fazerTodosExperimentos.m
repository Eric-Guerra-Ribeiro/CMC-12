function fazerTodosExperimentos()
planta = obterPlantaMulticoptero();
req = obterRequisitos();
controlador = projetarControladorMulticoptero(req, planta);
experimentos = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];
for i=1:length(experimentos)
    simulacao = simularExperimentoMulticoptero(controlador, planta, experimentos(i));
    tracarGraficosSimulacao(simulacao);
    fazerAnimacaoMulticoptero(simulacao, planta);
end
end
