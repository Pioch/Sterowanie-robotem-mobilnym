function Kh3UstawPredkosciKol(wk)
% Wyslanie predkosci katowych kol [rad/s]
% KSIS 2011: M. Michalek, D. Pazderski
% wejscie: wk = [wkp; wkl] (predkosc katowa kola prawego i lewego)
% wyjscie: brak


global com Kspeed r

    error = 0;
    % przeliczenie do jednostek wewnêtrznych dla Khepery III
    wk = wk * r * Kspeed * 1000; % predkosc k¹towa w [rad/s] = mspeed/Kspeed

    wlk = num2str(wk(2));
    wpk=num2str(wk(1));  

    buf= ['D,l',wlk,',l',wpk];
    
    % wys³anie zapytania do portu
    try
        fprintf(com, buf) ;     
    catch ME1
        ME1.identifier
        return
    end

    % odczyt informacji zwrotnej (w celu wyczyszczenia bufora odbiornika)
    try
        temp = fscanf(com);
    catch ME2
        ME2.identifier
        return
    end