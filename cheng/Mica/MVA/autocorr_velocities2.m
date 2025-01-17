function autocorr=autocorr_velocities2(vel_in,varargin)

% autocorr=autocorr_velocities2(vel_in,dt,n,w)
%
% calcule l'autocorrelation de la vitesse lagrangienne comme la moyenne
% d'ensemble de la correlation de chaque trajectoire
%

if nargin>1
	ind=varargin{1};
else
	ind=':';
end

field='velf';


disp(sprintf('Calcul des correlations des trajectoires ...\n'));

autocorr_tmp=cell2mat(arrayfun(@(vel)(autocorr_vel1(vel.(field))),vel_in.data(vel_in.good(ind)),'UniformOutput', false));

disp(sprintf('Calcul de la moyenne ...\n'));

autocorr=meanstruct(autocorr_tmp,'autocorr','l');



function autocorr1=autocorr_vel1(vel1)

% autocorr1=autocorr_vel1(data,dt)
%
% calcule l'autocorrelation de la vitesse lagrangienne pour 1 trajectoire,
% a partir des increments

%sig2=std(vel1)^2;
%sig2=0.006385271161616^2;
 autocorr1.autocorr=zeros(1,numel(vel1));
 autocorr1.l=zeros(1,numel(vel1));
 
 for kk=0:numel(vel1)-1
 		ind=1:numel(vel1)-kk;
 		autocorr1.autocorr(kk+1)=1-std(vel1(ind+kk)-vel1(ind)).^2/2/sig2;
 		autocorr1.l(kk+1)=numel(ind);
 end

%autocorr1=xcorr(detrend(vel1),'coeff');
% autocorr=xcorr(vel1-mean(vel1),'coeff');
% autocorr1.autocorr=fliplr(autocorr(1:numel(vel1)));
% autocorr1.l=ones(1,numel(vel1));