m = 80; % masse du participant 80 kg
g = 9.81; % acceleration gravitationnelle

Y=[30; 19; 20; 16; 13];
C=[1 0 0 0 0; 
   1 8 8^2 8^3 8^4;
   1 15 15^2 15^3 15^4;
   1 20 20^2 20^3 20^4;
   1 25 25^2 25^3 25^4];
C_inv=pinv(C);
A=C_inv*Y;
dx=1/1000;
x=0:dx:25;
gx=A(1,1) + A(2,1)*x + A(3,1)*x.^2 + A(4,1)*x.^3 + A(5,1)*x.^4;

figure;
plot(x, gx);

%for i = 1:length(A)
    %disp(A(i)*10000);
%end

%disp(A);

Ux = gx * m * g; % Énergie potentielle gravitationnelle

mu1 = 0.582;

mu2 = 0.618;
vx = sqrt(2 * g * (30 - gx - mu2 * x));

figure;
plot(x, vx);

