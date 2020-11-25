global  r b J M Daw Dav Cr zeta Ik m a c Ic g wsp_stromosci ksi N ng Im ksi_m Km Rm zeta_m im ik N_1 J_1 Rm_1 U_max kp ki kc T_f
global w_kmax fi_1 phi_c3 phi_c wybor_s
r = 0.026;
b = 0.033;
a = 0.078;
c = 0.078;
m = 0.6;
Ic = m*(a^2+c^2)/12;
M = [Ic 0 0; 0 m 0; 0 0 m];
g = 9.81;

%str 93 wspolczynniki oporow powietrza  
Daw = 0.0005;
Dav = 0.005;
%str 93 wspolczynnik oporow powietrza
Cr = 0.0005;
%str 93 wspolczynnik tlumienia wiskotycznego
zeta = 0.0001;
%moment bezwladnosci 
ik = 0.00001014;
Ik = [ik 0; 0 ik];
ksi = [zeta 0; 0 zeta];
ng = 1/12;
N = [ng 0; 0 ng];
N_1 = inv(N);
zeta_m = 0.0000000185;

ksi_m = [zeta_m 0; 0 zeta_m];
km = 0.00855; 
Km = [km 0; 0 km];


rm = 3.78;
Rm = [rm 0; 0 rm];
Rm_1 = inv(Rm);
im = 0.000000422;
Im = [im 0; 0 im];
wsp_stromosci = 5;
J = [r/(2*b) -r/(2*b); r/2 r/2];
J_1 = inv(J);
U_max = 9; %maks napiêcie (bloczek saturacji)

%aproksymacja obiektu
K = 9.4;
T = 0.094;
%zachowanie ukladu zamknietego
zeta_0 = 1; %zeta uk³adu zamkniêtego 
%T_ust = 0.1; % 0.1 dla robota kh coœ tam 
T_ust = 0.05; %0.05 dla robota mttracker
omega_0 = 2*pi/(zeta_0*T_ust); %omega_0 = 125.6637 (ma byæ wiêksze ni¿ 125.6637)
%omega_0 = 200;
%parametry PI
kp = (2*T*zeta_0*omega_0 - 1)/K; %kp = 2.23
ki = (T*omega_0^2)/(K*kp); %ki = 61.3
kc = 2*ki; %kc wspó³czynnik antywindup
%kc = 0;
T_f = 1/ki; %0.16 %filtry wstêpne
w_kmax = 9;
fi_1 = 0;
phi_c = 0;
phi_c3 = 0;
wybor_s = 1;