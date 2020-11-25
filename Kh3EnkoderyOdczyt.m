function out = Kh3EnkoderyOdczyt
% Odczyt licznikow dla kol [imp]
% KSIS 2012: M. Michalek, D. Pazderski
% Modyfikacja: 
%   03-12-2012 - obs³uga b³êdów odczytu
% wejscie: brak
% wyjscie: stan licznikow

global com enk_old
 
 try
    res = fscanf(com);       % odbior ramki
 catch ME3
    ME3.identifier
    out = enk_old;
    return;
 end
    
frame_size = size(res, 2);
frame = str2num(res(3:frame_size));   % ramka=[r, poz_lk, poz_pk]

if (size(frame, 1) == 1) % sprawdzenie czy ramka zostala odebrana
    out = frame';          
else
    out = enk_old;       % jesli nie to zakladamy stan poprzedni
end

 
 
     
