function theta = questao4(m, l, b, g, theta0, dtheta0, t)
% Realiza a simulacao de um pendulo simples amortecido que possui a
% seguinte EDO: m l theta'' + b theta' + m g sin theta = 0. theta0 e
% dtheta0 representam angulo e velocidade angular iniciais do pendulo.
% t representa o vetor de tempos [t0, t1, t2, ..., tf] em que se deseja
% fazer as simulacoes. A saida theta contem angulo e velocidade angular
% para cada instante de tempo conforme no seguinte formato:
% theta = [theta(t0), dtheta(t0);
%          theta(t1), dtheta(t1);
%          theta(t2), dtheta(t2);
%          ...      , ...       ;
%          theta(tf), dtheta(tf)];
f = @(t, thetas) [thetas(2); -sin(thetas(1))*g/l-thetas(2)*b/(m*l)];
ivp = [theta0; dtheta0];
% resolver EDO numericamente
[~, theta] = ode45(f, t, ivp);
end