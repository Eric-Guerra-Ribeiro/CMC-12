function y = questao1(w, Au, phiu, Kp, Kd, m, b)
% Determinar a saida em regime permanente senoidal assumindo referencia
% nula e perturbacao senoidal na forma d(t) = Ad * sin(w * t + phid).

modulusGjw = 1/sqrt((Kp - m*w^2)^2 + ((b + Kd)*w)^2);
phaseGjw = -atan((b + Kd)*w/(Kp - m*w^2));
y = @(t) Au*modulusGjw*sin(w*t + phiu + phaseGjw);
end
