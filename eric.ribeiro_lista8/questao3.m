function [magnitude, fase] = questao3(sys, w)
% Calcula valores de magnitude e fase de uma aproximacao para tracado
% manual do diagrama de Bode da funcao de transferencia sys nas frequencias
% das por w. Os valores de magnitude e fase sao dados em dB e graus,
% respectivamente. Note que
% magnitude(i) = |sys(j * w(i))|,
% fase(i) = fase(sys(j * w(i)).
zerosSys = abs(zero(sys));
poleSys = abs(pole(sys));
magnitude = 20*log10(dcgain(sys))*ones(1, length(w));
fase = zeros(1, length(w));
for i=1:length(zerosSys)
    magnitude = magnitude + (zerosSys(i) <= w).*(20*log10(w/zerosSys(i)));
    fase = fase + (0.1*zerosSys(i) <= w).*(45*log10(w/(0.1*zerosSys(i)))) ...
         + (10*zerosSys(i) <= w).*(-45*log10(w/(10*zerosSys(i))));
end

for i=1:length(poleSys)
    magnitude = magnitude + (poleSys(i) <= w).*(-20*log10(w/poleSys(i)));
    fase = fase + (0.1*poleSys(i) <= w).*(-45*log10(w/(0.1*poleSys(i)))) ...
         + (10*poleSys(i) <= w).*(45*log10(w/(10*poleSys(i))));
end

end
