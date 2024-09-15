m = 80; % masse du participant 80 kg
g = 9.81; % acceleration gravitationnelle

Y=[30; 19; 20; 16; 13]; % Hauteur des points obligatoires (A, B, C, D et E)

X=[1 0 0 0 0; % Coordonées horizontales du point A
   1 8 8^2 8^3 8^4;                   % du point B
   1 15 15^2 15^3 15^4;               % du point C
   1 20 20^2 20^3 20^4;               % du point D
   1 25 25^2 25^3 25^4];              % du point E

X_inv=pinv(X);
A=X_inv*Y;
dx=1/1000;
x=0:dx:25;
gx=A(1,1) + A(2,1)*x + A(3,1)*x.^2 + A(4,1)*x.^3 + A(5,1)*x.^4;

figure;
produire_courbe(x, gx, "Position horizontale (x)", "Position verticale (y)", "Trajectoire");

for i = 1:length(A)
    %disp(A(i)*10000);
end

% Pour x=25 et v=5.55m/s
gxf=A(1,1) + A(2,1)*25 + A(3,1)*25.^2 + A(4,1)*25.^3 + A(5,1)*25.^4;
mu1 = (1/25) * (30 - 13 - (5.55)^2 / (2 * g) )

% Pour x=25 et v=6.94m/s
mu2 = (1/25) * (30 - 13 - (6.94)^2 / (2 * g) )

mu = (mu1 + mu2) / 2

vx = sqrt(2 * g * (30 - gx - mu * x));

figure;
plot(x, vx);
