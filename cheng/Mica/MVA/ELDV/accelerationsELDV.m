function vel_out=accelerations(vel_in,w)

% vel_out=accelerationsELDV(vel_in,w)
%
% calculates acceleration from velocities in structure vel_in
% the gaussian kernel is calculated from 
% kernel = velfiltcoef(filterwidth, filterlen)

kerv=posfiltcoef(w,5*w);
kera=velfiltcoef(w,5*w);


%l=length(kera);
vel_out=vel_in;
%vel_out.filtparam=[w,3*w];
for jj=1:numel(vel_in.velocity)
   %disp(sprintf('%i',jj));
   %if isempty(vel_in.velocity(jj))
       acctmp=conv(kera,(vel_in.velocity(jj).vit));
       %acc=acctmp(l:length(acctmp)-l);
   
       veltmp=conv(kerv,(vel_in.velocity(jj).vit));
       %velf=veltmp(l:length(veltmp)-l);
		ll=length(vel_in.velocity(jj).vit);
       vel_out.velocity(jj).acc=acctmp(numel(kera):ll);
       vel_out.velocity(jj).velf=veltmp(numel(kerv):ll);
   
       %for kk=1:vel_in.length(jj)-numel(ker)
       %     acc(kk)=sum(ker'.*vel_in.data(jj).vit(kk:kk+numel(ker)-1));
       %     vel.data(jj).acc=acc;
       %end
   %end
end

