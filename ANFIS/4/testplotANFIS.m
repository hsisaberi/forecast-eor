% Test File

%% First Plot

% t=Targets;
% y=Outputs;
% 
% figure;
% plot(y,'ok');
% hold on
% plot(t,'or');

%% Second Plot

% targetsnormal=(Targets-min(Targets))/(max(Targets)-min(Targets));
% outputsnormal=(Outputs-min(Outputs))/(max(Outputs)-min(Outputs));
% 
% tnormal=targetsnormal;
% ynormal=outputsnormal;
% 
% e=tnormal-ynormal;
% 
% plot(e,'b')

%% Third Plot

% t=Targets;
% y=Outputs;
% 
% plot(t,y,'ko');
% hold on;
% xmin=min(min(t),min(y));
% xmax=max(max(t),max(y));
% plot([xmin xmax],[xmin xmax],'b','LineWidth',2);

%% Forth Plot

targetsnormal=(Targets-min(Targets))/(max(Targets)-min(Targets));
outputsnormal=(Outputs-min(Outputs))/(max(Outputs)-min(Outputs));

tnormal=targetsnormal;
ynormal=outputsnormal;

e=tnormal-ynormal;
histfit(e,50);
xlabel('Residual')
ylabel('Frequency')
set(gca,'fontsize',12)
set(gca,'LabelFontSizeMultiplier',1.3)
set(gca,'fontname','Times New Roman')




