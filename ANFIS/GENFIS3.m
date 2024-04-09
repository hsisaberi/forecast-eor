function [R111,R222,R444,Targets,Outputs,TrainTargets,TrainOutputs,TestTargets,TestOutputs]=GENFIS2()
% clc;
% clear;
% close all; 
%% Create Time-Series Data

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

    pTrain=0.7;
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

    % Option{3}='FCM (genfis3)';

    nCluster=2;
    Exponent=100;
    MaxIt=100;
    MinImprovment=1e-5;
    DisplayInfo=0;
    FCMOptions=[Exponent MaxIt MinImprovment DisplayInfo];

    fis=genfis3(TrainInputs,TrainTargets,'sugeno',nCluster,FCMOptions);

    MaxEpoch=100;
    ErrorGoal=3.77728;
    InitialStepSize=0.01;
    StepSizeDecreaseRate=0.9;
    StepSizeIncreaseRate=1.1;
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

    fis=anfis([TrainInputs TrainTargets],fis,TrainOptions,DisplayOptions,[],OptimizationMethod);

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
%     if R111>0.99 && R222>0.99 && R444>0.99
%         break;
%     end
% end
%% Plots

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


end