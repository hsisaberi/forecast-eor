% ANFIS Tester

clc;
clear;
close all;

A=zeros(10,3);
i=0;
R111=0;
R222=0;
R444=0;

while R111<0.9 && R222<0.9 && R444<0.9
    
    [R111,R222,R444,Targets,Outputs,TrainTargets,TrainOutputs,TestTargets,TestOutputs]=GENFIS3();

    i=i+1;
    A(i,:)=[R111 R222 R444];
    
    if i==50
        break;
    end
    
end

targetsnormal=(Targets-min(Targets))/(max(Targets)-min(Targets));
outputsnormal=(Outputs-min(Outputs))/(max(Outputs)-min(Outputs));
PlotResults(Targets,Outputs,targetsnormal,outputsnormal,'All Data');

TrainTargetsnormal=(TrainTargets-min(TrainTargets))/(max(TrainTargets)-min(TrainTargets));
TrainOutputsnormal=(TrainOutputs-min(TrainOutputs))/(max(TrainOutputs)-min(TrainOutputs));
PlotResults(TrainTargets,TrainOutputs,TrainTargetsnormal,TrainOutputsnormal,'Train Data');
% figure;
% plotregression(TrainTargets,TrainOutputs,'Train Data');
% set(gcf,'Toolbar','figure');


TestTargetsnormal=(TestTargets-min(TestTargets))/(max(TestTargets)-min(TestTargets));
TestOutputsnormal=(TestOutputs-min(TestOutputs))/(max(TestOutputs)-min(TestOutputs));
PlotResults(TestTargets,TestOutputs,TestTargetsnormal,TestOutputsnormal,'Test Data');
% % figure;
% % plotregression(TestTargets,TestOutputs,'Test Data');
% % set(gcf,'Toolbar','figure');