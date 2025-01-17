function Sn=crossStructFunc_struct(S1,field1,field2,n)

% Sn=SructFunc(vel_in,n,dt)
%
% vel_in est une structure contenant vel_in.data.velf et vel_in.good
% n est l'ordre de la fonction de structure a calculer
% dt est un vecteur avec les increments temporels a evaluer

disp(sprintf('Moyennes bulle a bulle ...\n'));
[sn, weights_ub]=arrayfun(@(x)(crossStructFunc(x.(field1),x.(field2),n)),S1,'UniformOutput',false);

disp(sprintf('Moyenne d''ensemble ...\n'));
sn=cell2struct(sn,'Sn');
weights_ub=cell2struct(weights_ub,'w');

Sn=meanstruct(sn,'Sn',weights_ub);
