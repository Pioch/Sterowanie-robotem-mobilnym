function wy = sterownik_pkt(we)

global J

xd = we(1);
yd = we(2);
xd_d = we(3);
yd_d = we(4);
theta = we(5);
x = we(6);
y = we(7);

Lz = 0.03;
beta = atan2(yd, xd);
z1_l = Lz*cos(beta);
z2_l = Lz*sin(beta);

qz = [x; y] + [cos(theta) -sin(theta); sin(theta) cos(theta)]*[z1_l; z2_l];
qzd = [xd; yd];
ez_falka = qzd - qz;
qzd_d = [xd_d; yd_d];
D = [-Lz*sin(theta) cos(theta); Lz*cos(theta) sin(theta)];

T1 = 2;
T2 = 2;

k11 = 1/T1;
k22 = 1/T2;
k12 = 0;
k21 = 0;


K = [k11 k12; k21 k22];

u = inv(D)*(K*ez_falka + qzd_d);

omega = inv(J)*u;
w_p = omega(1);
w_l = omega(2);

wy = [w_p; w_l];

end