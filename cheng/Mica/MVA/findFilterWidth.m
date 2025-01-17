function [sigma_a, sigma_v, mean_a, mean_v, w]=findFilterWidth(vel);

% [sigma_a, sigma_v, mean_a, mean_v, w]=findFilterWidth(vel);

w=1:1:21;
l=max(5,3*w);


for j=1:numel(w)
    disp(sprintf('w = %i',w(j)));
    kerp = posfiltcoef(w(j),l(j));
    kerv = velfiltcoef(w(j),l(j));
    velf=[];
    acc=[];
    for jj=1:numel(vel.good)
        if vel.length(vel.good(jj))>l(j)+1
            velftmp=conv(kerp,vel.data(vel.good(jj)).freq);
            acctmp=conv(kerv,vel.data(vel.good(jj)).freq);
        
            velf=[velf velftmp(l(j):length(velftmp)-l(j))];
            acc=[acc acctmp(l(j):length(acctmp)-l(j))];
            clear velftmp acctmp;
        end
    end
    
    sigma_v(j)=std(velf);
    mean_v(j)=mean(velf);
    sigma_a(j)=std(acc);
    mean_a(j)=mean(acc);
end

