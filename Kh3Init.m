% Plik inicjalizacyjny programu realizuj¹cego sterowanie w petli zamknietej
% robota Khepera III
% KSIS 2011: M. Michalek, D. Pazderski
clear all
global enk_const r b
global com Kspeed
global q_old enk_old
global w_kmax J
global fi_1 phi_c phi_c3 wybor_s phi_c3b


%clc

com = serial('COM9');           % port COM (wpisac port wykorzystywany)
% ustawienie parametrow portu szeregowego
set(com,'BaudRate',115200,'Databits',8,'Parity','None','StopBits',1, ....
    'FlowControl','none');

% parametry geometryczne opisujace uklad napedowy robota KhIII
r = 20.5e-3;                    % promien kola w m
b = 88e-3;                      % odleg³osc pomiedzy kolami w m (2*b to jest)

q_old = [0; 0; 0];              
enk_old = [0; 0];

Kspeed = 144.01;                % stala predkosciowa
enk_const = 0.047e-3;           % stala enkodera: jeden impuls = 0.047 mm

w_kmax = 5; %5 do Pometa
J = [r/(b) -r/(b); r/2 r/2];
fi_1 = 0;
phi_c = 0;
phi_c3 = 0;
phi_c3b = 0;
wybor_s = 1;