function [GM, PM, wcg, wcp] = questao1(mag, fase, w)
% [GM, PM, wcg, wcp] = questao1(mag, fase, w) determina as margens de ganho
% e de fase a partir da resposta em frequencia de um sistema. mag (dB) e
% fase (graus) representam as magnitudes e fase da resposta em frequencia
% considerando as frequencias dadas por w (rad/s). GM e PM sao as margens
% de ganho e de fase, respectivamente, que sao medidas em wcg e wcp,
% respectivamente.
wcp = interp1(mag, w, 0);
wcg = interp1(fase, w, -180);
GM = -interp1(w, mag, wcg);
PM = 180 + interp1(w, fase, wcp);
end
