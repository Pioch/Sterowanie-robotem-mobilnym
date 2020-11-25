%function wy = CartPlot(we)
%% funkcja rysuje kontur robota (2,0) w konfiguracji [x0 y0 teta0]
for i = 1:6:length(q)
    

x0 = q(i,2);
y0 = q(i,3);
fi0 = q(i,1);

P0 = [x0; y0];

skala = 1;

a = skala*0.13*0.1;
b = skala*0.07*0.1;
c = skala*0.05*0.1;

PL1 = [a; 0];
PL2 = [-b; c];
PL3 = [-b; -c];

R = [cos(fi0) -sin(fi0); sin(fi0) cos(fi0)];

PG1 = R*PL1 + P0;
PG2 = R*PL2 + P0;
PG3 = R*PL3 + P0;

PG = [PG1'; PG2'; PG3';PG1'];

plot(PG(:,1),PG(:,2),'black','LineWidth',0.2);
hold on;
plot(x0,y0, 'black','LineWidth',0.2);
end