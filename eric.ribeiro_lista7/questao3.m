function K = questao3()
% Determinar K para se ter Mp = 0.0432.
l = 2*(3*sqrt(2) - sqrt(13));
l1 = sqrt(80 + 2*sqrt(2)*l);
l2 = sqrt(10*sqrt(2)*l - 16);
K = l*l1*l2/5;
end
