function [incr]=increments_velocities2(vel_in,dt)

%[incr]=increments_velocities2(vel_in,dt)

%c=340;
%fact=c/2/nu0/sin(theta/2)*32768;

incr.dt=dt;

for kk=1:numel(dt)
    kk
    ig=0;
    inc=[];
    for jj=1:numel(vel_in.good)
        if(length(vel_in.data(vel_in.good(jj)).velf)-dt(kk)>1)
            ig=ig+1;
            ind=1:length(vel_in.data(vel_in.good(jj)).velf)-dt(kk);
            %data(ig).x=vel_in.data(vel_in.good(jj)).velf(ind+dt(kk))-vel_in.data(vel_in.good(jj)).velf(ind);
            inc=[inc vel_in.data(vel_in.good(jj)).velf(ind+dt(kk))-vel_in.data(vel_in.good(jj)).velf(ind)];
        end
    end
    
    %pdf=mkpdf4(data,65,10);
    [incr.pdf(kk).xpdfn,incr.pdf(kk).pdfn]=mkpdf3(inc,65,-5,5);
    %stat=stat_velocities2(vel_in,65);
    
    incr.mean(kk)=mean(inc);
    incr.std(kk)=std(inc);
    incr.flatness(kk)=kurtosis(inc);
    incr.skewness(kk)=skewness(inc);
    
%     incr.pdf(kk).xpdf=pdf.xpdf;
%     incr.pdf(kk).pdf=pdf.pdf;
%     incr.pdf(kk).xpdfn=pdf.xpdfn;
%     incr.pdf(kk).pdfn=pdf.pdfn;
%     incr.N(kk)=pdf.N;
%     incr.mean(kk)=pdf.mean;
%     incr.std(kk)=pdf.std;
%     incr.flatness(kk)=pdf.flatness;
%     incr.skewness(kk)=pdf.skewness;
    clear data;
    %eval(['vel_out.inc_' num2str(dt(kk)) '.x=x;']);
    %eval(['vel_out.inc_' num2str(dt(kk)) '.pdf=pdf;']);
end

