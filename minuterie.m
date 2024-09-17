mb = 8; % Masse du ballon
mp = 80; % Masse du participant
vb = -1; % Vitesse du ballon (vers les x négatifs)
Lt = 3; % Longueur de la trappe
vp = 6.250; % Vitesse du participant (22,5km/h)
e = 0.8; % Coefficient de restitution

vbp = (mb*vb + mp*vp) / (mb+mp)

tmin = Lt/vbp + 0.02

vp_prime = ((1+e)*mb*vb + (mp-mb*e)*vp) / (mb+mp)

tmax = Lt/vp_prime + 0.02

t = (tmax+tmin) / 2

marge = t - tmin + 0.02
