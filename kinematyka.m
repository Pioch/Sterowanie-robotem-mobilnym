function wy = kinematyka(in)
global J

%q=[theta; x; y]
u = [in(1); in(2)];
theta = in(3);

% u = J * [wp; wl];
q_prim = [1 0; 0 cos(theta); 0 sin(theta)] * u;

wy = q_prim;

end