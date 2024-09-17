h1 = 10; % Hauteur de tombée par rapport à la surface de l'eau
vf = 1; % Vitesse finale (de frappe)
m = 80; % Masse du participant
g = 9.81;
kf = 0.95;
b = 47;

%% Calcul de la vitesse avant impact
vi = sqrt(2*g*h1)

%% Calcul de la profondeur du bassin
vo = sqrt(m*g*(1-kf)/b)
z = (log(vi-vo)-log(vf-vo)) / (-g*(1-kf)/vo^2-b/m)