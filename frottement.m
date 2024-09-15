xn = [0 10 20 30 40 50 60 70 80 90 100];
yn = [0.87 0.78 0.71 0.61 0.62 0.51 0.51 0.49 0.46 0.48 0.46];
N = 11;

figure;
scatter(xn, yn);
title("Coefficient de friction dynamique en fonction de l'ouverture de la valve");
xlabel("Ouverture (%)")
ylabel("Coefficient");
grid on;
hold on; 



X = [N          sum(xn)    sum(xn.^2);
     sum(xn)    sum(xn.^2) sum(xn.^3);
     sum(xn.^2) sum(xn.^3) sum(xn.^4)];
Y = [sum(yn);
     sum(yn.*xn);
     sum(yn.*xn.^2)];

A = X \ Y


c = A(1) % Terme constant
b = A(2) % Coefficient du terme linéaire
a = A(3) % Coefficient du terme quadratique
gxn = a .* (xn.^2) + b .* xn + c;

E = sum((gxn-yn).^2);

RMSE = sqrt((1/N)*E)

plot(xn, gxn);

roots([a, b, c-0.5995])
