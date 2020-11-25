function wy = Pomet_sterownik(we)
global J
thetad = we(1);
xd = we(2);
yd = we(3);
theta = we(4);
x = we(5);
y = we(6);
t = we(7);
qd = [we(1); we(2); we(3)];
q = [we(4); we(5); we(6)];

%dla punktu x=0.5 y=0.5 theta = 0.5 oraz x poczatkowego = 0.1 
k1 = 1;
k2 = 2;
k3 = 3;
k4 = 4;
omega = 0.3; %0.3
sigma_p = 0.03;



e = qd - q;
R = [1 0 0; 0 cos(thetad) sin(thetad); 0 -sin(thetad) cos(thetad)];

e_falka = -R*e; %5.1



% e1_falka = theta - thetad;
% e2_falka = cos(thetad)*(x - xd) + sin(thetad)*(y - yd);
% e3_falka = -sin(thetad)*(x - xd) + cos(thetad)*(y -yd);


%1 wersja
% h = k4*(e_falka(2)^2 + e_falka(3)^2)*cos(omega*t);
% dhdt = -k4*omega*sin(omega*t)*(e_falka(2)^2 + e_falka(3)^2);
% dhde2 = 2*e_falka(2)*k4*cos(omega*t);
% dhde3 = 2*e_falka(3)*k4*cos(omega*t);
%2 wersja
h = k4*((e_falka(2)^2 + e_falka(3)^2)/(e_falka(2)^2 + e_falka(3)^2 + sigma_p))*cos(omega*t);
dhdt = -(k4*omega*sin(omega*t)*(e_falka(2)^2 + e_falka(3)^2))/(e_falka(2)^2 + e_falka(3)^2 + sigma_p);
dhde2 = (2*e_falka(2)*k4*cos(omega*t))/(e_falka(2)^2 + e_falka(3)^2 + sigma_p) - (2*e_falka(2)*k4*cos(omega*t)*(e_falka(2)^2 + e_falka(3)^2))/(e_falka(2)^2 + e_falka(3)^2 + sigma_p)^2;
dhde3 = (2*e_falka(3)*k4*cos(omega*t))/(e_falka(2)^2 + e_falka(3)^2 + sigma_p) - (2*e_falka(3)*k4*cos(omega*t)*(e_falka(2)^2 + e_falka(3)^2))/(e_falka(2)^2 + e_falka(3)^2 + sigma_p)^2;

u1 = -(k1*(e_falka(1)+h)) - dhdt;
u2 = -((k2*e_falka(2) + k1*(e_falka(1)+h)*dhde2)*cos(e_falka(1))+(k3*e_falka(3)+k1*(e_falka(1)+h)*dhde3)*sin(e_falka(1)));

omega = inv(J)*[u1; u2];
w_p = omega(1);
w_l = omega(2);

wy = [w_p;w_l];
% wy = [u1;u2];
end