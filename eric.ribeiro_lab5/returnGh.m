function Gh = returnGh()
Kp = 7.0115;
Ktheta = Kp;
Kd = 0.28*Kp;
Kq = Kd;
A = [-0.00643, 0.0263, 0, -32.2, 0;
     -0.0941, -0.624, 820, 0, 0;
     -0.000222, -0.00153, -0.668, 0, 0;
     0, 0, 1, 0, 0;
     0, -1, 0, 830, 0];
B = [0; -32.7; -2.08; 0; 0];
C = [0 0 0 0 1];
D = [0];
Atheta = A;
Atheta(:, 3) = A(:, 3) + B*Kq;
Atheta(:, 4) = A(:, 4) + B*Ktheta;
Btheta = -Ktheta*B;
[NUM, DEN] = ss2tf(Atheta, Btheta, C, D);
Gh = tf(NUM, DEN);
end
