function wy = gsr_pkt(we)

wybor  = we(1);
t = we(2);

switch wybor
    case 1
        thetad = 0;
        xd = 0.6;
        yd = 0.6;
        xd_d = 0;
        yd_d = 0;
        xd_dd = 0;
        yd_dd = 0;
        
    case 2
        X_1 = 0;
        Y_1 = 0;
        X_k = 0;
        Y_k = 0;
        A_kx = 0.3;
        A_ky = 0.3;
        w_kx = 0.4;
        w_ky = 0.2;
        psi_dx = -pi/2;
        psi_dy = 0;
        xd = X_k + A_kx*cos(w_kx*t +psi_dx)+X_1*t;
        yd = Y_k + A_ky*sin(w_ky*t+psi_dy)+Y_1*t;
        xd_d = -A_kx*w_kx*sin(w_kx*t+psi_dx)+X_1;
        yd_d = A_ky*w_ky*cos(w_ky*t+psi_dy)+Y_1;
        
    case 3
       X_k = 0;
       Y_k = 0;
       A_kx = 0.3;
       A_ky = 0.3;
       w_kx = 0.2;
       w_ky = 0.2;
       psi_dx = 0;
       psi_dy = 0; 
       xd = X_k + A_kx*cos(w_kx*t +psi_dx)+X_1*t;
       yd = Y_k + A_ky*sin(w_ky*t+psi_dy)+Y_1*t;
       xd_d = -A_kx*w_kx*sin(w_kx*t+psi_dx)+X_1;
       yd_d = A_ky*w_ky*cos(w_ky*t+psi_dy)+Y_1;
       
end



wy = [xd; yd; xd_d; yd_d];

end