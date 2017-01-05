function [etp]=entp(input)
% Raphael.Apr.16

if iscell(input)
    p=input;
else
    p{1}=input;
end

s=zeros(1,length(p));
for i=1:length(p)
    s(i)=sum(p{i});
end
% if sum(s)-1>10^-10
%     error('Input must be probs with sum of 1')
% end
etp=0;
for i=1:length(p)
    l=length(p{i});
    e=0;
    for j=1:l
        e=e-p{i}(j)*log2(p{i}(j)/s(i));
    end
    etp=etp+e;
end

end
