function [R weights_ub]=autocorr_struct(S1,field1,varargin)

%
% Sn=autocorr_struct(S1,filed1)
%

if nargin>2
	opt=varargin{1};
else
	opt='none';
end

if nargin > 3;
	NN=varargin{2};
end
	

ll=arrayfun(@(x)(numel(x.(field1))),S1);
moy=sum(arrayfun(@(x)(mean(x.(field1))),S1).*ll)/sum(ll);
std2=sum(arrayfun(@(x)(mean((x.(field1)-moy).^2)),S1).*ll)/sum(ll)


disp(sprintf('Moyennes bulle a bulle ...\n'));
%[r, weights_ub]=arrayfun(@(x)(autocorr(x.(field1),moy)),S1,'UniformOutput',false);

[r]=arrayfun(@(x)(autocorr1(x.(field1)-moy,opt)),S1,'UniformOutput',false);
weights_ub=arrayfun(@(x)(fliplr(1:(numel(x.(field1))))'),S1,'UniformOutput',false);

r=cell2struct(r,'R');
assignin('base','r',r);

disp(sprintf('Moyenne d''ensemble ...\n'));

weights_ub=cell2struct(weights_ub,'w');
if nargin >3
    R=meanstruct2(r,'R',weights_ub,NN);
else
    R=meanstruct2(r,'R',weights_ub);
end
%R=meanstruct2(r,'R',[],NN);

function [R w]=autocorr1(sig,opt)

R=fftshift(xcorr(sig,opt));
R(ceil(numel(R)/2):end)=[];


