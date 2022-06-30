function [K, z, p] = questao3()
% Projetar controlador com funcao de transferencia
% C(s) = K * (s - z) / (s * (s - p)).
wcp = 5*sqrt(2*(sqrt(17)-1));
PMproj = 60;
PM0 = atand(10/wcp);
phi = PMproj - PM0;
alpha = (1 - sind(phi))/(1 + sind(phi));
K = 20/alpha;
T = 1/(wcp*sqrt(alpha));
z = -1/T;
p = -1/(alpha*T);
end