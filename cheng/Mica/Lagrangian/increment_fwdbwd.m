
function [incrfwd,idxfwd,incrbwd,idxbwd]=increment_fwdbwd(sig,varargin)

%[incr]=increments_velocities(vel_in)
%
% signal des increments de vel_in : incr=vel_in(t+dt)=vel_in(t)

if nargin>1
	dt=varargin{1};
else
	dt=(1:numel(sig))-1;
end

for kk=1:numel(dt)
	indfwd=1:numel(sig)-dt(kk);
    indbwd=dt(kk)+1:numel(sig);
    if min(indfwd)>0
        idxfwd{kk}=indfwd+floor(dt(kk)/2);
        incrfwd{kk}=(sig(indfwd+dt(kk))-sig(indfwd));
    end
        if min(indbwd)>0
        idxbwd{kk}=indbwd-floor(dt(kk)/2);
        incrbwd{kk}=(sig(indbwd-dt(kk))-sig(indbwd));
    end
end
