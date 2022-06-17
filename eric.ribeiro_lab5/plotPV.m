function plotPV()
Kp = 7.0115;
Ktheta = Kp;
Kd = 0.28*Kp;
Kq = Kd;
s = tf('s');
Gq = returnGq();
sysPV = Ktheta*Gq/(s + (s*Kq + Ktheta)*Gq);
sysOpenLoop = Gq;
t = 0:1e-3:60;
thetaPV = step(sysPV, t);
thetaOpen = step(sysOpenLoop, t);
hold on
plot(t, thetaPV, 'g', LineWidth=2)
plot(t, thetaOpen, 'y', LineWidth=2)
legend("P + V", "Malha Aberta")
ylabel("\theta (rad)")
xlabel("Tempo (s)")
title("Resposta da Malha de Arfagem para Controlador P + V e Malha Aberta")

print -depsc2 'PVOpen.eps'
end
