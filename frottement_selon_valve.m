%xn = [2.3 14.7 29.7 31.9 45.7 58.6];
%yn = [184 860 1345 1385 1360 965];
%N = 6;

xn = [0 10 20 30 40 50 60 70 80 90 100];
yn = [0.87 0.78 0.71 0.61 0.62 0.51 0.51 0.49 0.46 0.48 0.46];
N = 11;

figure;
plot(xn, yn);


X = [N          sum(xn)    sum(xn.^2);
     sum(xn)    sum(xn.^2) sum(xn.^3);
     sum(xn.^2) sum(xn.^3) sum(xn.^4)];
Y = [sum(yn);
     sum(yn.*xn);
     sum(yn.*xn.^2)];

A = X \ Y


c = A(1); % Terme constant
b = A(2); % Coefficient du terme linéaire
a = A(3); % Coefficient du terme quadratique
gxn = a .* (xn.^2) + b .* xn + c;

E = sum((gxn-yn).^2);

RMSE = sqrt((1/N)*E)

figure;
plot(xn, gxn);
