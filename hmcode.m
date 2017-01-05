%% HM coding
function [cd,w]=hmcode(p,q,mode)

% sample:
% p=[0.1 0.1 0.12 0.12 0.23 0.33];
% q=3;



if sum(p)-1>10^-10
    error('Input must be probs with sum of 1')
end

if nargin<3
   mode='ascend';
end;

r=mod((length(p)-q)*(q-2),q-1);

cd=cell(length(p),1);


if strcmp(mode,'ascend')
    md=-1;
elseif strcmp(mode,'descend')
    md=1;
else
     error('Mode should be ascend or descend')   
end

pa=p;
[st,stq]=sort(pa);
stq=num2cell(stq);
for i=1:q-r
    for j=1:length(stq{i})
        cd{stq{i}(j)}=[(q-1)/2+md/2*(q-2*i+1),cd{stq{i}(j)}];
    end
end
for i=1:q-r-1
    stq{1}=[stq{1} stq{1+q-r-i}];
    stq(1+q-r-i)=[];
    st(1)=st(1)+st(1+q-r-i);
    st(1+q-r-i)=[];
end
[st,qw]=sort(st);
stq=stq(qw);

while length(st)~=1
for i=1:q
    for j=1:length(stq{i})
        cd{stq{i}(j)}=[(q-1)/2+md/2*(q-2*i+1),cd{stq{i}(j)}];
    end
end
for i=1:q-1
    stq{1}=[stq{1} stq{1+q-i}];
    stq(1+q-i)=[];
    st(1)=st(1)+st(1+q-i);
    st(1+q-i)=[];
end
    [st,qw]=sort(st);
    stq=stq(qw);
end
w=0;
for i=1:length(cd)
    w=w+length(cd{i})*p(i);
end

end