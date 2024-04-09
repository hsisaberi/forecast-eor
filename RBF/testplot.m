% Test File

%% First Plot

% t=targets;
% y=outputs;
% 
% figure;
% plot(y,'ok');
% hold on
% plot(t,'or');

%% Second Plot

% targetsnormal=(targets-min(targets))/(max(targets)-min(targets));
% outputsnormal=(outputs-min(outputs))/(max(outputs)-min(outputs));
% 
% tnormal=targetsnormal;
% ynormal=outputsnormal;
% 
% e=tnormal-ynormal;
% 
% plot(e,'b')

%% Third Plot

% t=targets;
% y=outputs;
% 
% plot(t,y,'ko');
% hold on;
% xmin=min(min(t),min(y));
% xmax=max(max(t),max(y));
% plot([xmin xmax],[xmin xmax],'b','LineWidth',2);

%% Forth Plot

targetsnormal=(targets-min(targets))/(max(targets)-min(targets));
outputsnormal=(outputs-min(outputs))/(max(outputs)-min(outputs));

tnormal=targetsnormal;
ynormal=outputsnormal;

e=tnormal-ynormal;
histfit(e,50);
xlabel('Residual')
ylabel('Frequency')
set(gca,'fontsize',12)
set(gca,'LabelFontSizeMultiplier',1.3)
set(gca,'fontname','Times New Roman')




