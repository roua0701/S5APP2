m = 80; % masse du participant 80 kg
g = 9.81; % acceleration gravitationnelle
vmin = 10/3.6; % Vitesse minimale
vmax = 45/3.6; % Vitesse maximale
vfmin = 20/3.6; % Vitesse minimale finale
vfmax = 25/3.6; % Vitesse maximale finale
vfChoisie = 22.5/3.6; % Vitesse finale cible

hf = 12.27; % Hauteur choisie approximativement

Y=[30; 19; 20; 16; hf]; % Hauteur des points obligatoires (A, B, C, D et E)

X=[1 0 0 0 0; % Coordonées horizontales du point A
   1 8 8^2 8^3 8^4;                   % du point B
   1 15 15^2 15^3 15^4;               % du point C
   1 20 20^2 20^3 20^4;               % du point D
   1 25 25^2 25^3 25^4];              % du point E

X_inv=pinv(X);
A=X_inv*Y
A(5)
dx=1/1000;
x=0:dx:25;
gx=A(1,1) + A(2,1)*x + A(3,1)*x.^2 + A(4,1)*x.^3 + A(5,1)*x.^4;

figure;
produire_courbe(x, gx, "Position horizontale (m)", "Position verticale (m)", "Trajectoire");

% Pour x=25 et v=20km/h
gxf=A(1,1) + A(2,1)*25 + A(3,1)*25.^2 + A(4,1)*25.^3 + A(5,1)*25.^4;
mu1 = (1/25) * (30 - hf - vfmin^2 / (2 * g) )

% Pour x=25 et v=25km/h
mu2 = (1/25) * (30 - hf - vfmax^2 / (2 * g) )

% Pour x=25 et v=22.5km/h
mu = (1/25) * (30 - hf - vfChoisie^2 / (2 * g) )

vx = sqrt(2 * g * (30 - gx - mu * x));
vx1 = sqrt(2 * g * (30 - gx - mu1 * x));
vx2 = sqrt(2 * g * (30 - gx - mu2 * x));


figure;
xextremite = [0 25];


plot(x, vx, x, vx1, x, vx2, xextremite, [vmin vmin], xextremite, [vmax vmax]);
title("Vitesse selon la position");
xlabel("Position horizontale (m)")
ylabel("Vitesse (m/s)");
grid on;



vx(end)

% erreur rms sur la vitesse
vx1 = sqrt(2 * g * (30 - gx - mu1 * x));
vx2 = sqrt(2 * g * (30 - gx - mu2 * x));
(vx2(end) - vx1(end)) / 2;

deriv_coeffs = polyder([A(5,1) A(4,1) A(3,1) A(2,1) A(1,1)])
deriv_coeffs(1)*25^3 + deriv_coeffs(2)*25^2 + deriv_coeffs(3)*25 + deriv_coeffs(4)