
r = 1/32;
R = 10;
X = @(x, y) ((x + 1).*(x.^2 - y.^2 + 4) - 2.*x.*y.^2) ...
    ./(((x + 1).^2 + y.^2).*((x.^2 - y.^2 + 4).^2 + 4.*x.^2.*y.^2));
Y = @(x, y) -(y.*(x.^2 - y.^2 + 4) + 2.*x.*y.*(x + 1)) ...
    ./(((x + 1).^2 + y.^2).*((x.^2 - y.^2 + 4).^2 + 4.*x.^2.*y.^2));
%C1
w1 = 2+r:1e-3:R;
ReG1 = X(zeros("like", w1), w1);
ImG1 = Y(zeros("like", w1), w1);
%C2
w2 = -R:1e-3:-2-r;
ReG2 = X(zeros("like", w2), w2);
ImG2 = Y(zeros("like", w2), w2);
%C3
theta = [pi/2:-1e-3:-pi/2];
x3 = R*cos(theta);
y3 = R*sin(theta);
ReG3 = X(x3, y3);
ImG3 = Y(x3, y3);
%C4
theta = -pi/2:1e-4:pi/2;
x4 = r*cos(theta);
y4 = 2 + r*sin(theta);
ReG4 = X(x4, y4);
ImG4 = Y(x4, y4);
%C5
theta = -pi/2:1e-4:pi/2;
x5 = r*cos(theta);
y5 = -2 + r*sin(theta);
ReG5 = X(x5, y5);
ImG5 = Y(x5, y5);
%C6
w6 = -2 + r:1e-3:2 - r;
ReG6 = X(zeros("like", w6), w6);
ImG6 = Y(zeros("like", w6), w6);

hold on
axis([-5 5 -5 5])
xlabel("Re\{G(s)\}")
ylabel("Im\{G(s)\}")
plot(ReG1, ImG1, 'b', 'LineWidth', 2)
plot(ReG2, ImG2, 'r', 'LineWidth', 2)
plot(ReG3, ImG3, 'g', 'LineWidth', 2)
plot(ReG4, ImG4, 'm', 'LineWidth', 2)
plot(ReG5, ImG5, 'k', 'LineWidth', 2)
plot(ReG6, ImG6, 'c', 'LineWidth', 2)
legend("G(C_1)", "G(C_2)", "G(C_3)", ...
       "G(C_4)", "G(C_5)", "G(C_6)")

