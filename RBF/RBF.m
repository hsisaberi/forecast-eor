clc;
clear;
close all;

tic;

R=0.1;
%% Load Data
load EORData
% load RBFnet.mat Max Neurons: 30   Spread: 300
load net44.mat
Data_Targets=EORData(:,end-3)';
EORData(:,end-3)=[];
Data_Inputs=EORData';

inputs=Data_Inputs;
targets=Data_Targets;

% while R<1.5
%     nData=size(inputs,2);
% 
%     Perm=randperm(nData);
% %     Perm=1:nData;
% 
%     pTrainData=0.7;
%     nTrainData=round(pTrainData*nData);
%     trainInd=Perm(1:nTrainData);
%     Perm(1:nTrainData)=[];
%     trainInputs = inputs(:,trainInd);
%     trainTargets = targets(:,trainInd);
% 
%     pTestData=1-pTrainData;
%     nTestData=nData-nTrainData;
%     testInd=Perm;
%     Perm(1:nTestData)=[];
%     testInputs = inputs(:,testInd);
%     testTargets = targets(:,testInd);
% 
%     %% Create and Train RBF Network
% %     The net is load
%     Goal=0;
%     Spread=1.1;
%     MaxNeuron=44;
%     DisplatAt=10;
%     net = newrb(trainInputs,trainTargets,Goal,Spread,MaxNeuron,DisplatAt);
% 
%     % Test the Network
%     outputs = net(inputs);
%     errors = gsubtract(targets,outputs);
%     performance = perform(net,targets,outputs);
% 
%     % Recalculate Training, Validation and Test Performance
%     trainOutputs = outputs(:,trainInd);
%     trainErrors = trainTargets - trainOutputs;
%     trainPerformance = perform(net,trainTargets,trainOutputs);
% 
%     testOutputs = outputs(:,testInd);
%     testError = testTargets-testOutputs;
%     testPerformance = perform(net,testTargets,testOutputs);
% 
%     %% Sample 37 Testing
% 
%     % sam37Inputs=sam37(:,1:end-1)';
%     % sam37Targets=sam37(:,end)';
%     % 
%     % sam37Outputs=net(sam37Inputs);
%     % % sam37Outputs=(sam37Outputs-min(sam37Outputs))./(max(sam37Outputs)-min(sam37Outputs));
%     % sam37Outputs=(sam37Outputs-min(sam37Outputs))/(max(sam37Outputs)-min(sam37Outputs));
%     % sam37Outputs=min(sam37Targets)+(max(sam37Targets)-min(sam37Targets))*sam37Outputs;
%     % 
%     % Rsam37=corr(sam37Targets',sam37Outputs');
%     % esam37=sam37Targets-sam37Outputs;
%     % MSEsam37=mean(esam37.^2);
%     % RMSEsam37=sqrt(MSEsam37);
% 
%     %% Sample 35 Testing
% 
%     % sam35Inputs=sam35(:,1:end-1)';
%     % sam35Targets=sam35(:,end)';
%     % 
%     % sam35Outputs=net(sam35Inputs);
%     % % sam35Outputs=(sam35Outputs-min(sam35Outputs))./(max(sam35Outputs)-min(sam35Outputs));
%     % sam35Outputs=(sam35Outputs-min(sam35Outputs))/(max(sam35Outputs)-min(sam35Outputs));
%     % sam35Outputs=min(sam35Targets)+(max(sam35Targets)-min(sam35Targets))*sam35Outputs;
%     % 
%     % Rsam35=corr(sam35Targets',sam35Outputs');
%     % esam35=sam35Targets-sam35Outputs;
%     % MSEsam35=mean(esam35.^2);
%     % RMSEsam35=sqrt(MSEsam35);
% 
%     %% Sample 33 Testing
% 
%     % sam33Inputs=sam33(:,1:end-1)';
%     % sam33Targets=sam33(:,end)';
%     % 
%     % sam33Outputs=net(sam33Inputs);
%     % % sam33Outputs=(sam33Outputs-min(sam33Outputs))./(max(sam33Outputs)-min(sam33Outputs));
%     % sam33Outputs=(sam33Outputs-min(sam33Outputs))/(max(sam33Outputs)-min(sam33Outputs));
%     % sam33Outputs=min(sam33Targets)+(max(sam33Targets)-min(sam33Targets))*sam33Outputs;
%     % 
%     % Rsam33=corr(sam33Targets',sam33Outputs');
%     % esam33=sam33Targets-sam33Outputs;
%     % MSEsam33=mean(esam33.^2);
%     % RMSEsam33=sqrt(MSEsam33);
% 
%     %% Get Best Model
% 
%     R111=corr(targets',outputs')^2;
%     R222=corr(trainTargets',trainOutputs')^2;
%     R444=corr(testTargets',testOutputs')^2;
%     [~, AAD1]=AARD(targets,outputs);
%     [~, AAD2]=AARD(trainTargets,trainOutputs);
%     [~, AAD3]=AARD(testTargets,testOutputs);
%         if R111>0.99 && R222>0.99 && R444>0.99 && AAD1<10 && AAD2<10 && AAD3<10
%             break;
% %         elseif R111>0.99 && R222>0.99 && R444>0.99
% %             break;
% %         elseif R111>0.99 && R222>0.99 && R444>0.99
% %             break;
% %         elseif R111>0.99 && R222>0.99 && R444>0.99
% %             break;    
%         end
% end

%% Plots

targetsnormal=(targets-min(targets))/(max(targets)-min(targets));
outputsnormal=(outputs-min(outputs))/(max(outputs)-min(outputs));
PlotResults(targets,outputs,targetsnormal,outputsnormal,'All Data');

trainTargetsnormal=(trainTargets-min(trainTargets))/(max(trainTargets)-min(trainTargets));
trainOutputsnormal=(trainOutputs-min(trainOutputs))/(max(trainOutputs)-min(trainOutputs));
PlotResults(trainTargets,trainOutputs,trainTargetsnormal,trainOutputsnormal,'Train Data');

testTargetsnormal=(testTargets-min(testTargets))/(max(testTargets)-min(testTargets));
testOutputsnormal=(testOutputs-min(testOutputs))/(max(testOutputs)-min(testOutputs));
PlotResults(testTargets,testOutputs,testTargetsnormal,testOutputsnormal,'Test Data');

toc;