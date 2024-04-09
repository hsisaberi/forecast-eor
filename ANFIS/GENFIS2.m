% function [R111,R222,R444,Targets,Outputs,TrainTargets,TrainOutputs,TestTargets,TestOutputs]=GENFIS2()
% clc;
% clear;
% close all;
%% Load Data

load EORData

Data_Targets=EORData(:,end-3);
EORData(:,end-3)=[];
Data_Inputs=EORData;

inputs=Data_Inputs;
targets=Data_Targets;

Inputs=Data_Inputs;
Targets=Data_Targets;

R=0.1;
% while R<1.5
    nData=numel(Targets);
    Perm=randperm(nData);
    % Perm=1:nData;

    pTrain=.7;
    nTrainData=round(pTrain*nData);
    TrainInputs=Inputs(Perm(1:nTrainData),:);
    TrainTargets=Targets(Perm(1:nTrainData),:);
    Perm(1:nTrainData)=[];
    TrainData=[TrainInputs TrainTargets];

    pTest=1-pTrain;
    nTestData=nData-nTrainData;
    TestInputs=Inputs(Perm,:);
    TestTargets=Targets(Perm,:);
    TestData=[TestInputs TestTargets];

    %% Design ANFIS

    % Option{2}='Sub. Clustering (genfis2)';

    Radius=0.3;

    fis=genfis2(TrainInputs,TrainTargets,Radius);

    MaxEpoch=50;
    ErrorGoal=3.77728;
    InitialStepSize=4;
    StepSizeDecreaseRate=23;
    StepSizeIncreaseRate=20;

%     MaxEpoch=50;
%     ErrorGoal=7.77728;
%     InitialStepSize=(0.01+.03)*100;
%     StepSizeDecreaseRate=(0.9+1.4)*10;
%     StepSizeIncreaseRate=(1.1+0.9)*10;
    TrainOptions=[MaxEpoch ...
                  ErrorGoal ...
                  InitialStepSize ...
                  StepSizeDecreaseRate ...
                  StepSizeIncreaseRate];

    DisplayInfo=true;
    DisplayError=true;
    DisplayStepSize=true;
    DisplayFinalResult=true;
    DisplayOptions=[DisplayInfo ...
                    DisplayError ...
                    DisplayStepSize ...
                    DisplayFinalResult];

    OptimizationMethod=1;
    % 0: Backpropagation
    % 1: Hybrid

    fis=anfis([TrainInputs TrainTargets],fis,TrainOptions,[],[],OptimizationMethod);

    %% Apply ANFIS to All Data
    
    Outputs=evalfis(Inputs,fis);

    Errors=Targets-Outputs;
    MSE=mean(Errors(:).^2);
    RMSE=sqrt(MSE);
    ErrorMean=mean(Errors);
    ErrorSTD=std(Errors);

    %% Apply ANFIS to Train Data

    TrainOutputs=evalfis(TrainInputs,fis);

    TrainErrors=TrainTargets-TrainOutputs;
    TrainMSE=mean(TrainErrors(:).^2);
    TrainRMSE=sqrt(TrainMSE);
    TrainErrorMean=mean(TrainErrors);
    TrainErrorSTD=std(TrainErrors);

    %% Apply ANFIS to Test Data

    TestOutputs=evalfis(TestInputs,fis);

    TestErrors=TestTargets-TestOutputs;
    TestMSE=mean(TestErrors(:).^2);
    TestRMSE=sqrt(TestMSE);
    TestErrorMean=mean(TestErrors);
    TestErrorSTD=std(TestErrors);


    R111=corr(Targets,Outputs)^2;
    R222=corr(TrainTargets,TrainOutputs)^2;
    R444=corr(TestTargets,TestOutputs)^2;
%     if R111>0.9 && R222>0.9 && R444>0.9
%         break;
%     end
% end
%% Plots

% targetsnormal=(Targets-min(Targets))/(max(Targets)-min(Targets));
% outputsnormal=(Outputs-min(Outputs))/(max(Outputs)-min(Outputs));
% PlotResults(Targets,Outputs,targetsnormal,outputsnormal,'All Data');

% TrainTargetsnormal=(TrainTargets-min(TrainTargets))/(max(TrainTargets)-min(TrainTargets));
% TrainOutputsnormal=(TrainOutputs-min(TrainOutputs))/(max(TrainOutputs)-min(TrainOutputs));
% PlotResults(TrainTargets,TrainOutputs,TrainTargetsnormal,TrainOutputsnormal,'Train Data');
% % figure;
% % plotregression(TrainTargets,TrainOutputs,'Train Data');
% % set(gcf,'Toolbar','figure');
% 
% 
% TestTargetsnormal=(TestTargets-min(TestTargets))/(max(TestTargets)-min(TestTargets));
% TestOutputsnormal=(TestOutputs-min(TestOutputs))/(max(TestOutputs)-min(TestOutputs));
% PlotResults(TestTargets,TestOutputs,TestTargetsnormal,TestOutputsnormal,'Test Data');
% % % figure;
% % % plotregression(TestTargets,TestOutputs,'Test Data');
% % % set(gcf,'Toolbar','figure');


% end