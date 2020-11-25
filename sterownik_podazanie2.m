function wy = sterownik_podazanie2(we)
global J A 

e_l = we(1);
e_theta = we(2);
w_d = we(3);
v_d = we(4);
zeta_d = 1; %1 przodem -1 tylem

es_falka = [e_l; e_theta];

wn = 5; %5 do okregu 8 do prostej
zeta = 1;
k1 = wn^2;
k2 = 2*zeta*wn;

% k1 = 9;
% k2 = 6;
% u = -k1*e_l - k2*e_theta;

u2 = zeta_d*v_d;
u = -k1*u2*e_l - k2*abs(u2)*e_theta;

k_ds = w_d;


% u1 = u + zeta_d*v_d*k_ds*cos(e_theta)/(1 - e_l*k_ds);
u1 = u + u2*k_ds*cos(e_theta)/(1 - e_l*k_ds);

omega = inv(J)*[u1; u2];
w_p = omega(1);
w_l = omega(2);

wy = [w_p; w_l];

end