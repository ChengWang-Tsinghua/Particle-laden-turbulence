function [moy,sig]=moy_sup(vel_in)

% sigs=sig_sup(vel_in)
%
% calcul sigma_sup(tau), la variance de vitesse des segments plus longs que
% tau. le signal de sortie a N+1 elements (l'element 1 correspondant a
% tau=0 et l'element N+1 a tau=N)
%

% load(vel_in);
% eval(['vel=' vel_in '.data(' vel_in '.good);'])
% eval(['clear ' vel_in]);

vel=vel_in;
clear vel_in;

L=arrayfun(@(x)(numel(x.velf)),vel);
Nmin=min(L);
Nmax=max(L);
mean_tot=sum(arrayfun(@(x,Li)(mean(x.velf)*Li),vel,L))/sum(L);
sig_tot=sqrt(sum(arrayfun(@(x,Li)(mean((x.velf-mean_tot).^2))*Li,vel,L))/sum(L));
%sig_tot=sqrt(sum(arrayfun(@(x,Li)(mean((x.velf--mean_tot).^2)*Li),vel,L))/sum(L));

moy(1:Nmin+1)=mean_tot;
sig(1:Nmin+1)=sig_tot;
for k=Nmin+1:Nmax
	I=find(L>=k);
	moy(k+1)=sum(arrayfun(@(x,Li)(mean(x.velf)*Li),vel(I),L(I)))/sum(L(I));
	sig(k+1)=sqrt(sum(arrayfun(@(x,Li)(mean((x.velf-moy(k+1)).^2)*Li),vel(I),L(I)))/sum(L(I)));
	%sig(k+1)=sqrt(sum(arrayfun(@(x,Li)(mean((x.velf-moy(k+1)).^2)*Li),vel(I),L(I)))/sum(L(I)));
end
