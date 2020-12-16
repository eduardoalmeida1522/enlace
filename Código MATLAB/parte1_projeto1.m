close all
clear all
clc

%% Projeto 1:
%(a) a temperatura de ruído do sistema, em K;
%(b) a relação G/T do sistema.

%% Programa:
% Dados:
Ta = 100; %K
Ga = 40; %dBi
Tw = 290; %K
Lw = 0.5; %dB
T1 = 40; %K
G1 = 60; %dB
T2 = 290; %K
L2 = 15; %dB
NF3 = 30; %dB

T0 = 290; %K - temperatura de referência

% Temperatura de ruído do guia de onda - wave guide:
LwWatt = db2pow(Lw);
Trw = (LwWatt - 1)*Tw;

% Temperatura de ruído do LNA/LNB:
G1Watt = db2pow(G1);
Tr1 = T1;

% Temperatura de ruído do CABO:
L2Watt = db2pow(L2);
Tr2 = (L2Watt - 1)*T2;

% Calculando a temperatura de ruído do MODEM:
NF3 = db2pow(NF3);
Tr3 = (NF3 - 1)*T0;

% Temperatura do sistema, referenciado depois da antena:
Tsist1 = Ta + Trw + Tr1*LwWatt + Tr2*LwWatt/G1Watt + Tr3*LwWatt*L2Watt/(G1Watt)

% Temperatura do sistema, referenciado depois do guia de onda:
Tsist2 = Ta/LwWatt + Trw + Tr1 + (Tr2)/(G1Watt/L2Watt) + (Tr3)/(G1Watt/L2Watt)

%temp trabalho ano passado - nota que é Tsist1/LwWatt e Tsist e G/T bateu em todos os 6
%casos do trabalho do ano passado
Tsist3 = Ta/LwWatt + Trw/LwWatt + Tr1 + (Tr2)/(G1Watt) + (Tr3)/(G1Watt/L2Watt)

% Calculando a figura de mérito G/T do sistema:
GTsist3 = Ga - Lw - 10*log10(Tsist3)