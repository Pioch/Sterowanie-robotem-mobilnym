function out = Kh3Odometria(enk)
% Algorytm odometrii robota
% KSIS 2012: M. Michalek, D. Pazderski
% Modyfikacja: 
%   3-12-2012 (korekcja przypisania d_dist w przypadku b³êdu)
% wejscie : enk - stan licznikow [imp]
% wyjscie : q - biezaca estymata konfiguracji

global enk_old q_old enk_const b

th = q_old(1); p = q_old(2:3);

% obliczanie drogi liniowej dla kola lewego i prawego
d_dist = enk_const * (enk - enk_old);

% filtracja blednych odczytow
if norm(d_dist) > 0.1
    d_dist = [0; 0];    % jesli przyrost przekracza przyjety prog
                        % nie uaktualniaj wyniku odometrii
end

% zmiana orientacji
d_th = [-1/b 1/b] * d_dist;

% obliczanie pozycji w oparciu o metode Rungego-Kutty
c = cos(th+0.5*d_th); s = sin(th+0.5*d_th);
P = 0.5*[c c; s s];
p = p + P * d_dist;

% obliczanie orientacji
th = th + d_th;
% sprowadzenie orientacji do przedzialu (-pi, pi>
th = atan2(sin(th), cos(th));

q = [th; p];
enk_old = enk;
q_old = q;

out = q;