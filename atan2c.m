function wy = atan2c(we)

global phi_c
y = we(1);
x = we(2);

phi_i = atan2(y,x);

if isnan(phi_i) == 1
    wy = phi_c;
    
else
    
  phi_i1 = atan2(sin(phi_c),cos(phi_c));
delta = phi_i - phi_i1;
if (delta > pi)
    deltap = delta - 2*pi;
elseif (delta < -pi) 
    deltap = delta + 2*pi;
else
    deltap = delta;
end
phi_c = phi_c + deltap;

wy = phi_c;  
    
end

end