function wy = trajektoriaa(we)

global J w_kmax

t = we(1);
wybor = we(2);
zeta_d = 1; %1 dla ruchu do przodu -1 dla ruchu do ty³u
X_1 = 0;
Y_1 = 0;

switch wybor
    case 0 
       %default
        X_k = 0;
        Y_k = 0;
        A_kx = 0;
        A_ky = 0;
        w_kx = 0;
        w_ky = 0;
        psi_dx = 0;
        psi_dy = 0; 
    case 1 
       %ko³owa
       X_k = 0;
       Y_k = 0;
       A_kx = 0.3;
       A_ky = 0.3;
       w_kx = 0.2;
       w_ky = 0.2;
       psi_dx = 0;
       psi_dy = 0; 
    case 2
        %eliptyczna
        X_k = 0;
        Y_k = 0;
        A_kx = 0.4;
        A_ky = 0.2;
        w_kx = 0.2;
        w_ky = 0.2;
        psi_dx = 0;
        psi_dy = 0;
    case 3
        %ósemkowa
        X_k = 0;
        Y_k = 0;
        A_kx = 0.3;
        A_ky = 0.3;
        w_kx = 0.4;
        w_ky = 0.2;
        psi_dx = -pi/2;
        psi_dy = 0;
    case 4
        %prostoiniowa
        X_k = 0;
        Y_k = 0;
        A_kx = 0;
        A_ky = 0;
        w_kx = 0.1;
        w_ky = 0.1;
        psi_dx = 0;
        psi_dy = 0;
        X_1 = 0.2/sqrt(2);
        Y_1 = 0.2/sqrt(2);
        
end

        
x_d = X_k + A_kx*cos(w_kx*t +psi_dx)+X_1*t;
y_d = Y_k + A_ky*sin(w_ky*t+psi_dy)+Y_1*t;
x_dd = -A_kx*w_kx*sin(w_kx*t+psi_dx)+X_1;
y_dd = A_ky*w_ky*cos(w_ky*t+psi_dy)+Y_1;
x_ddd = -A_kx*w_kx^2*cos(w_kx*t+psi_dx);
y_ddd = -A_ky*w_ky^2*sin(w_ky*t+psi_dy);

theta_d = atan2c([zeta_d*y_dd; zeta_d*x_dd]);
% theta_d = atan2(zeta_d*y_dd, zeta_d*x_dd);
v_d = zeta_d*sqrt(x_dd^2 + y_dd^2);
w_d = (y_ddd*x_dd - y_dd*x_ddd)/(x_dd^2 + y_dd^2);

% if abs(theta_d - theta) >= 0.01 && w_d == 0
%     w_d = w_kmax/2;
% end  

u_d = [w_d; v_d];

% omega_d = inv(J)*u_d;
% w_pd = omega_d(1);
% w_ld = omega_d(2);
% 
% wy = [w_pd; w_ld];

wy = [theta_d; x_d; y_d; u_d];

end