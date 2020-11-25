function wy = trajektoria_sciezka_param2(we)

global J wybor_s A 

wybor = we(1);
theta = we(2);
x = we(3);
y = we(4);
zeta_d = 1;

switch wybor
    case 1
        %prostoliniowa

Ax = 1;
Ay = 1;

p1 = (Ax*Ay/(Ax^2+Ay^2))*y + (Ax^2/(Ax^2+Ay^2))*x;
p2 = (Ay^2/(Ax^2+Ay^2))*y + (Ax*Ay/(Ax^2+Ay^2))*x;
s = p1*sqrt(Ax^2 + Ay^2)/Ax;

xd = p1;
yd = p2;
% xd=Ax*s/sqrt(Ax^2+Ay^2);
% yd=Ay*s/sqrt(Ax^2+Ay^2);
xd_d = Ax/sqrt(Ax^2 + Ay^2);
yd_d = Ay/sqrt(Ax^2 + Ay^2);
xd_dd = 0;
yd_dd = 0;

    case 2
        %kolowa
        A = 0.3;
        mi = 1;
        
        p1 = abs(A)*x/sqrt(x^2+y^2);
        p2 = abs(A)*y/sqrt(x^2+y^2);
         s = abs(A*mi)*atan2(p2, p1)/mi;
        
       xd = A*cos((mi*s)/abs(A*mi));
       yd = A*sin((mi*s)/abs(A*mi));

     
    xd_d=-sign(A*mi)*sin(mi*s/abs(A*mi));
    yd_d=sign(A*mi)*cos(mi*s/abs(A*mi));

    xd_dd=-1/A*cos(mi*s/abs(A*mi));
    yd_dd=-1/A*sin(mi*s/abs(A*mi));
%     w_ds = 1/A;    
end

theta_ds = atan2c([zeta_d*yd_d; zeta_d*xd_d]);
v_ds = zeta_d*sqrt(xd_d^2+yd_d^2);
w_ds = (yd_dd*xd_d-yd_d*xd_dd)/(xd_d^2+yd_d^2);

js = [cos(theta_ds+pi/2); sin(theta_ds+pi/2)]; 

e_l = sign([x-xd; y-yd]'*js)*norm([x - xd, y - yd]);
e_theta = theta - theta_ds;

u_d = [w_ds; v_ds];

% omega_d = inv(J)*u_d;
% w_pd = omega_d(1);
% w_ld = omega_d(2);
% 
% wy = [w_pd; w_ld; xd; yd; xd_d; yd_d];
wy = [e_l; e_theta; u_d; xd; yd];

end