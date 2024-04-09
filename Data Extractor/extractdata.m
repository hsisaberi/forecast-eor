clc;
clear;
close all;

[numbers, ~, everything] = xlsread('SamplesColectting.xlsx');

%% 1_ID of Each Sample
ID = numbers(:,1);

%% 2_Polymer Concentration
PolymerConcentration = numbers(:,3);

%% 3_Salt Concentration
SaltConcentration = numbers(:,4);

%% 4_Rock Type
% Note: Sand Stone == 0
% Note: Carbonate == 1

RockType = char(everything(:,5));
RockType(1,:)=[];

y=zeros(1,847)';
for i=1:847   
    x=RockType(i,:);
    switch x
        case 'Sand Stone'
            y(i)=0;
        otherwise
            y(i)=1;
    end
end

RockType = y;

clear i x y

%% 5_Initial Oil Saturation
InitialOilSaturation = numbers(:,6);

%% 6_Prosity
Prosity = numbers(:,7);

%% 7_Prmeability
Permeability = numbers(:,8);

%% 8_PVinj
PVinj = numbers(:,9);

%% 9_Temp
Temp = numbers(:,10);

%% 10_EOR
EOR = numbers(:,11);

%% 11_API
API = numbers(:,12);

%% 12_Molecular Weight
MolecularWeight = numbers(:,13);

%% 13_Salt Type
% Note: 1 >>> FreshWater
% Note: 2 >>> LowSalinity
% Note: 3 >>> HighSalinity

SaltType = numbers(:,14);

EORData = [PolymerConcentration SaltConcentration RockType InitialOilSaturation Prosity Permeability PVinj Temp EOR API MolecularWeight SaltType];

clear numbers everything





