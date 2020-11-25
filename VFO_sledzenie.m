function wy = VFO_sledzenie(we)

global J zeta_d 
thetad = we(1);
xd = we(2);
yd = we(3);
dxd = we(4);
dyd = we(5);
ddxd = we(6);
ddyd = we(7);
%ud1 = we(8);
%ud2 = we(9);
theta = we(10);
x = we(11);
y = we(12);

Kp = 1;
Ka = Kp*2;

sigma = 1;
e_x = xd-x;
e_y = yd-y;

h_x = Kp*e_x+dxd;
h_y = Kp*e_y+dyd;
u2 = h_x*cos(theta)+h_y*sin(theta);



de_x = dxd-u2*cos(theta);
de_y = dyd-u2*sin(theta);

% dh_x = Kp*de_x+ddxd;
% dh_y = Kp*de_y+ddyd;
dh_x = Kp*(dxd - u2*cos(theta))+ddxd;
dh_y = Kp*(dyd - u2*sin(theta))+ddyd;

theta_a = atan2c2([sigma*h_y; sigma*h_x]);
dtheta_a = (dh_y*h_x-h_y*dh_x)/((h_x)^2+(h_y)^2);

h_theta = Ka*(theta_a-theta)+dtheta_a;

u1 = h_theta;

omega = inv(J)*[u1; u2];
w_p = omega(1);
w_l = omega(2);

wy = [w_p; w_l];


end