function wy = BSP(we)

global w_kmax
wdcP = we(1);
wdcL = we(2);
omega_dc = [wdcP; wdcL];
ks = max(1,max((abs(wdcP)/w_kmax), (abs(wdcL)/w_kmax)));
omega_ds = (1/ks)*omega_dc;

wy = omega_ds;

end