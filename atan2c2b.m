function [ wy ] = atan2c2b( we )
%ATAN2C Summary of this function goes here
%   Detailed explanation goes here
global phi_c3b
y = we(1);
x = we(2);

phi_i = atan2(y,x);
if isnan(phi_i) == 1
    wy = phi_c3b;
else
    phi_i1 = atan2(sin(phi_c3b),cos(phi_c3b));
delta = phi_i - phi_i1;
if (delta > pi)
    deltap = delta - 2*pi;
elseif (delta < -pi) 
    deltap = delta + 2*pi;
else
    deltap = delta;
end
phi_c3b = phi_c3b + deltap;

wy = phi_c3b;
    
end


end