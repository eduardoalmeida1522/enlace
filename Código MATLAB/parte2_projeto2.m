
%% Projeto 1:
% A figura mostra um sistema de recepcao via satelite. Os dados sao
% mostrados na tabela. Determinar (a) a temperatura de ruido do sistema, em
% K; (b) a relacao G/T do sistema.

%% Programa:
% Definindo variaveis:
Ta = 40; %K
Ga = 40; %dBi
Tw = 290; %K
Lw = 1; %dB
T1 = 25; %K
G1 = 60; %dB
T2 = 290; %K
L2 = 20; %dB
NF3 = 2; %dB

T0 = 290; %K - temperatura de referencia

% Temperatura de ruido do GUIA:
Lwmag = db2pow(Lw);
Gwmag = 1/Lwmag;
Trw = ((1 - Gwmag)/Gwmag)*Tw;

% Temperatura de ruido do LNA/LNB:
G1mag = db2pow(G1);
Tr1 = T1;

% Temperatura de ruido do CABO:
L2mag = db2pow(L2);
G2mag = 1/L2mag;
Tr2 = ((1 - G2mag)/G2mag)*T2;

% Calculando a temperatura de ruido do MODEM:
NF3mag = db2pow(NF3);
Tr3 = (NF3mag - 1)*T0;

% Temperatura do sistema, referenciado depois da antena:
Tsist = Ta + Trw + Tr1/Gwmag + (Tr2)/(G1mag*Gwmag) +...
    (Tr3)/(G1mag*G2mag*Gwmag)

% Calculando a figura de merito G/T do sistema:
GTsist = Ga - 10*log10(Tsist)