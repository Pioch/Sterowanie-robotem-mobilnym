% Glowny program sterowania w petli zamknietej dla robota Khepera III
% KSIS 2011: M. Michalek, D. Pazderski
% wejscie: brak
% wyjscie: ustawione zmienne globalne opisuj¹ce m. in. ruch robota

global q_old enk_old enk_const
global com r b Kspeed 
global theta J

N = 100; % liczba probek
Tp = 0.1165;



% poczatkowa konfiguracja robota
q_old = [0; 0; 0];  %ustawienie polozenia poczatkowego 
% przygotowanie tablic
q = zeros(N, 3);
t = zeros(N, 1);
wk = zeros(N, 2);
zadana = zeros(N, 3);

if (strcmp(com.Status, 'closed'))
    fopen(com);                 % otwarcie portu komunikacyjnego
end

% odczyt warunku poczatkowego licznikow kol
Kh3UstawPredkosciKol([0 0]');
Kh3EnkoderyZapytanie;
enk_old = Kh3EnkoderyOdczyt;

disp('Start');
wk_i = [0 0]';
q_i = q_old;
t_i = 0;
theta = q_i(1);
x = q_i(2);
y = q_i(3);

wybor_sterownik = 7;
wybor_trajektoria = 1;



tic                             % rozpoczecie odliczania czasu
for i = 1:N
   czas = Tp*i;
   
  %**********************************************************************
  
%   wy = trajektoriaa([czas; wybor]);
%   wy_ds = BSP(wy);

  % tutaj umiescic generator sygnalow referencyjnych
  % 					 oraz algorytm sterowania robotem
  
  switch wybor_sterownik
    case 1 %liniowy sledzenie
        
        traj = trajektoriaa([czas; wybor_trajektoria]);
        wy_ds = sterownik_sledzenie([traj; theta; x; y]);
        
     case 2 %liniowy sciezka
         
         traj = trajektoria_sciezka_param2([wybor_trajektoria; theta; x; y]);
         wy_ds = sterownik_podazanie2(traj);
     
      case 3 %liniowy do punktu
          
          traj = gsr_pkt(wybor_trajektoria);
          wy_ds = sterownik_pkt([traj; theta; x; y]);
        
      case 4 %sterownik Pometa
          
          traj = gsr_Pomet(wybor_trajektoria);
          wy_ds = Pomet_sterownik([traj; theta; x; y; czas]);
          
      case 5 %VFO punkt
          
          traj = gsr_VFO_punkt(wybor_trajektoria);
          wy_ds = VFO_punkt2([traj; theta; x; y]);
          
      case 6 %VFO sledzenie
          
          traj = trajektoria_VFO([czas, wybor_trajektoria]);
          wy_ds = VFO_sledzenie([traj; theta; x; y]);
          
      case 7 %VFO sciezka
          
          traj = trajektoria_sciezka_bez([wybor_trajektoria; theta; x; y]);
          wy_ds = VFO_sciezka([traj; theta; x; y]); 
        
  end 
  
  % do wszystkiego oprocz sciezki
  zadana(i,1) = traj(1);
  zadana(i,2) = traj(2);
  zadana(i,3) = traj(3);

  u = J*wy_ds;
  u1(i,1) = u(1);
  u2(i,1) = u(2);
  
  
  wy_ds = BSP(wy_ds);
  
  %do sciezki 
%   zadana(i,1) = traj(1);
%   zadana(i,2) = traj(2);
%   zadana(i,3) = traj(3);
%   zadana(i,4) = traj(4);
%   zadana(i,5) = traj(5);
%   zadana(i,6) = traj(6);
%   
%   u = J*wy_ds(1:2);
%   u1(i,1) = u(1);
%   u2(i,1) = u(2);
%   e_theta(i,1) = wy_ds(3);
%   
%   wy_ds(1:2) = BSP(wy_ds(1:2));
  
  
  %**********************************************************************

  Kh3UstawPredkosciKol(wy_ds);   % wys³anie predkosci zadanych do robota

  Kh3EnkoderyZapytanie;         % odczyt licznikow enkoderow
  enk = Kh3EnkoderyOdczyt;

  q_i = Kh3Odometria(enk); 
  % obliczenie odometrii
  theta_pomiar = q_i(1);
  x = q_i(2);
  y = q_i(3);
  t_i = toc;
  theta_2 = atan2(sin(theta),cos(theta));
  delta_th = theta_pomiar - theta_2;
  
if (delta_th > pi)
    deltap_th = delta_th - 2*pi;
elseif (delta_th < -pi) 
    deltap_th = delta_th + 2*pi;
else
    deltap_th = delta_th;
end
theta = theta + deltap_th;
 
 
    
  % przepisanie probek (do celow analizy i wizualizacji)
  q(i, :) = q_i;
  q(i,1) = theta;
  wk(i, :) = wk_i;
  t(i) = t_i;
end

Kh3UstawPredkosciKol([0 0]);    % wyzerowanie predkosci kol - zatrzymanie robota

disp('Stop');
fclose(com);                    % zamkniecie portu komunikacyjnego