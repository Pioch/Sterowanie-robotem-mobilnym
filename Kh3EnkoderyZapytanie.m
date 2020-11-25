function Kh3EnkoderyZapytanie
% Zapytanie o stan licznikow dla kol
% KSIS 2011: M. Michalek, D. Pazderski
% wejscie: brak
% wejscie: brak

global com

try 
    fprintf(com, 'R');
catch ME
    ME.identifier
end

