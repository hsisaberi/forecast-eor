% function [a, AARD]=AARD(target,output)
%     N=numel(target);
%     q=100/N;
%     o=zeros(1,N);
%     for i=1:N
%         w=(target(i)-output(i))/(target(i));
%         o(i)=w;
%     end
%     a=abs(sum(o));
%     a=q*a;
%     PlotResults(targets,outputs,targetsnormal,outputsnormal,'All Data');
N=numel(targets);
AARD=100/N*sum(abs((targets-outputs)./targets));
N=numel(targets);

w=0;
for i=1:N
    w=abs((targets(i)-outputs(i))/targets(i))+w;
end
AARDloop=100/N*w;

summ=sum(abs((targets-outputs)./targets));


disp(['w= ' num2str(w)])
disp(['sum= ' num2str(summ)])
disp(['AAARD loop= ' num2str(AARDloop)])
disp(['AARD= ' num2str(AARD)])