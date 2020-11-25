function wy = sterownik_sledzenie(we)
global J

thetad = we(1);
xd = we(2);
yd = we(3);
ud1 = we(4);
ud2 = we(5);

theta = we(6);
x = we(7);
y = we(8);


e1_falka = thetad - theta;
e2_falka = cos(theta)*(xd - x) + sin(theta)*(yd - y);
e3_falka = -sin(theta)*(xd - x) + cos(theta)*(yd - y);

e_falka = [e1_falka; e2_falka; e3_falka];

zeta = 1;
alfa = 20; %2 do kolowej 20 do elipsy 100 do osemki
wn = sqrt(ud1^2 + alfa*ud2^2);
k11 = -2*zeta*wn;
k22 = k11;
k13 = -alfa*ud2;
% k13 = (ud1^2-wn^2)/ud2;
k12 = 0;
k21 = 0;
k23 = 0;

K = [k11 k12 k13; k21 k22 k23];
w = K*e_falka;
u = [1 0; 0 cos(e1_falka)]*[ud1; ud2] - w;

omega = inv(J)*u;
w_p = omega(1);
w_l = omega(2);

wy = [w_p; w_l];

end