function pdf=mkpdf5(data,n,varargin)

%pdf=mkpdf5(data,field,n,varargin)
%
% computes de PDFs (normalized and not) and statistics from data structure
% where :
% data(i).x is the data
%
%
% pdf.N
% pdf.pdf
% pdf.xpdf
% pdf.pdfn
% pdf.xpdfn
% pdf.mean
% pdf.std
% pdf.skewness
% pdf.flatness


t0=cputime;

%x=zeros(1,data(numel(data)).lc);
%ifin=0;
%for j=1:numel(data)
%        ideb=ifin+1;
%        ifin=ideb+data(j).l-1;
%        x(ideb:ifin)=data(j).x;
        %pour centrer les signaux par la moyenne locale decommenter la
        %ligne ci-dessous
        %x(ideb:ifin)=(x(ideb:ifin)-mean(x(ideb:ifin))); 
     
        %plot(ideb:ifin,x(ideb:ifin));
%end
%moy=mean(x);
%sigma=std(x);

%L=arrayfun(@(X)(numel(X.(field))),data);

%moy=sum(arrayfun(@(X)(mean(X.(field))),data).*L)/sum(L);
%sigma=sqrt(sum(arrayfun(@(X)(mean((X.(field)-moy).^2)),data).*L)/sum(L));



%Lx=0;

 %for jj=1:numel(data)
 %    Nx=Nx+hist(data(jj).(field),Xx);
     %Lx=Lx+numel(data(jj).(field));
 %end
%Lx
stat=statf(data);
[Nx,Xx]=histf(data,n);

%pdf.N=L;
pdf.pdf=Nx/integ(Nx,Xx);
pdf.xpdf=Xx;
pdf.meanb=stat.mean;
pdf.mean=integ(pdf.xpdf.*pdf.pdf,pdf.xpdf);
pdf.std=sqrt(integ((pdf.xpdf-pdf.mean).^2.*pdf.pdf,pdf.xpdf));
pdf.stdb=stat.std;
pdf.skewness=integ((pdf.xpdf-pdf.mean).^3.*pdf.pdf,pdf.xpdf)/pdf.std^3;
%pdf.skewnessb=skewness(x);
pdf.flatness=integ((pdf.xpdf-pdf.mean).^4.*pdf.pdf,pdf.xpdf)/pdf.std^4;
%pdf.flatnessb=kurtosis(x);

%for jj=1:numel(data)
%    Nx=Nx+hist((data(jj).(field)-pdf.mean)/pdf.std,Xx);
%end

%[Nx,Xx]=histf((data-pdf.mean)/pdf.std,n);

%pdf.pdfn=Nx/integ(Nx,Xx);
%pdf.xpdfn=Xx;
%disp(cputime-t0);
   