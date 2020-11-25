function wy = VFO_sciezka(we)

global J

F = we(1);
F_x = we(2);
F_y = we(3);
F_xx = we(4);
F_yy = we(5);
F_xy = we(6);
theta = we(7);
x = we(8);
y = we(9);

zeta_d = 1;
kp = 1;  %3 krzywa %1 elipsa %5 prosta
ka = 2*kp;
vd = zeta_d*0.2;

R = [0, 1; -1, 0];
grad_F =[F_x; F_y];
w = -grad_F;
w2 = R*w;

ve = w/norm(grad_F);
vex = ve(1);
vey = ve(2);
hp = (vd*R + kp*F*eye(2))*ve;
hx = hp(1);
hy = hp(2);
% theta_a = atan2(zeta_d*hy, zeta_d*hx);
theta_a = atan2c2([zeta_d*hy; zeta_d*hx]);
theta_d = atan2c2b([zeta_d*F_x; -zeta_d*F_y]);
e_a = theta_a - theta;
e_theta = theta_d - theta;
u2 = hx*cos(theta) + hy*sin(theta);
F_d = (F_x*cos(theta) + F_y*sin(theta))*u2;
ve_d = (u2/norm(grad_F)^3)*[F_y*((F_x*F_xy - F_y*F_xx)*cos(theta) + (F_x*F_yy - F_y*F_xy)*sin(theta)); 
                            F_x*((F_y*F_xx - F_x*F_xy)*cos(theta) + (F_y*F_xy - F_x*F_yy)*sin(theta))];
vex_d = ve_d(1);
vey_d = ve_d(2);
hp_d = [vd*vey_d + kp*(F_d*vex + F*vex_d); -vd*vex_d + kp*(F_d*vey + F*vey_d)];
hx_d = hp_d(1);
hy_d = hp_d(2);

theta_ad = (hy_d*hx - hy*hx_d)/(hx^2 + hy^2);
h_theta = ka*e_a + theta_ad;

u1 = h_theta;

u = [u1; u2];
omega = inv(J)*u;
w_p = omega(1);
w_l = omega(2);

% if isnan(w_p) == 1 || isnan(w_l) == 1
%     wy = [0; 0];
% else
   wy = [w_p; w_l; e_theta]; %dodac e_a do wyswietlenia wykresow

% end

end