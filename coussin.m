h0 = 5; % Hauteur de tombée par rapport à la surface non déformée
kc = 6000; % Constante de ressort du coussin
m = 88;
g = 9.81;


hc = roots([-kc/2 m*g m*g*h0])