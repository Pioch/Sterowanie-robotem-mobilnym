function u_d = VFO_punkt2(we)

% % % % % % % % % % % % % % % % % 
% przypisanie zmiennych
% % % % % % % % % % % % % % % % %
global J
theta_d = we(1);
xd = we(2);
yd = we(3);
xd_prim = we(4);
yd_prim = we(5);
xd_bis = we(6);
yd_bis = we(7);
theta = we(8);
x = we(9);
y = we(10);

e_xy = [xd - x; yd - y];

%------------------------------------------------------------------------------
Kp_VFO = 1;
Ka_VFO = 2*Kp_VFO;
sigma_d_VFO = 1;
eta = 0.5;

v_xy = -eta * sigma_d_VFO * sqrt(e_xy(1)^2+e_xy(2)^2) * [cos(theta_d); sin(theta_d)];
h_xy = Kp_VFO * e_xy + v_xy;
u2 = h_xy(1) * cos(theta) + h_xy(2) * sin(theta);
h_xy_prim = [Kp_VFO*(xd_prim - u2*cos(theta)) + xd_bis;
             Kp_VFO*(yd_prim - u2*sin(theta)) + yd_bis];

theta_a = atan2c2([sigma_d_VFO * h_xy(2); sigma_d_VFO * h_xy(1)]);
theta_a_prim = (h_xy_prim(2)*h_xy(1) - h_xy(2)*h_xy_prim(1)) / (h_xy(1)^2 + h_xy(2)^2);
ea = theta_a - theta;
h_th = Ka_VFO * ea + theta_a_prim;

u1 = h_th;

omega = inv(J)*[u1; u2];
w_p = omega(1);
w_l = omega(2);

u_d = [w_p; w_l] ;    %sygnal sterujacy
end


