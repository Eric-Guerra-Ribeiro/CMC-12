function ts = questao2(sys)
% Determinar numericamente o tempo de acomodacao de 2% ts do sistema
% dinamico sys
perc = 0.02;
[~, T_0] = step(sys);
T = (0:1e-3:10*T_0(end));
Y = step(sys, T);

y_s = Y(end);
for i=length(T):-1:1
    if abs((Y(i) - y_s)/y_s) > perc
        ts = T(i);
        break
    end
end
end
