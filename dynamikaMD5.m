function wy = dynamikaMD5(we)

global M b r Daw Dav Cr m g wsp_stromosci J Ik ksi N ng Im ksi_m Km Rm zeta zeta_m Ic im ik

Tp = we(1);
Tl = we(2);
u = [we(3); we(4)];
w = we(3);
v = we(4);
theta = we(8);
theta_prim = we(5);
%u_prim= [ we(11); we(12)]


%przeliczenie u = [w;v] na wp i wl omega = [wp;wl] jest potrzebne do wzoru 2.46 
omega = inv(J)*u;
w_p = omega(1);
w_l = omega(2);
%omega_prim = inv(J)*u_prim;
T = [Tp; Tl];

G = [1 0; 0 cos(theta); 0 sin(theta)];
G_prim = [0 0; 0 -sin(theta)*theta_prim; 0 cos(theta)*theta_prim];
M_ = G'*M*G;
V_ = G'*M*G_prim;
B = [b/r -b/r; (1/r)*cos(theta) (1/r)*cos(theta); (1/r)*sin(theta) (1/r)*sin(theta)];
B_ = G'*B;

%str 58 wzor przed 2.41 do MD2
Na = Daw * abs(w)*w;
Faa = Dav * abs(v)* v;
Fa = [Na;Faa];
%str 59 wzory 2.46 do Md2
Nr = b/2*m*g*Cr*(tanh(wsp_stromosci*r*w_p)-tanh(wsp_stromosci*r*w_l));
Frr = 1/2*m*g*Cr*(tanh(wsp_stromosci*r*w_p) + tanh(wsp_stromosci*r*w_l));
Fr = [Nr;Frr];
%str 60 wzory 2.52 2.53 do MD3
M__ = M_ + B_*Ik*inv(J);
H = V_ + B_*ksi * inv(J);

% str 62 2.62 - 2.65
M_falka = M__ +B_*inv(N)*Im*inv(N)*inv(J);
H_falka = H+B_*inv(N)*ksi_m* inv(N)*inv(J);
B_falka = B_*inv(N);

%H_falkag = H_falka + B_falka *Km*inv(Rm)*Km*inv(N)*inv(J);
%B_falkag = B_falka *Km*inv(Rm);
%u_prim = inv(M_)*(B_*T - V_* u);
%M_falka = [Ic + ((2*b^2)/r^2)*ik+((2*b^2)/(r^2*ng^2))*im 0; 0 m+(2/r^2)*ik+(2/r^2*ng^2)*im]
%H_falka = [((2*b^2)/r^2)*(zeta+(1/ng^2)*zeta_m) 0; 0 (2/r^2)*(zeta+(1/ng^2)*zeta_m)]
%B_falka = [b/(r*ng) -b/(r*ng); 1/(r*ng) 1/(r*ng)];
u_pr = M_falka\(B_falka*T - H_falka*u - Fa - Fr);
wy = u_pr;




end