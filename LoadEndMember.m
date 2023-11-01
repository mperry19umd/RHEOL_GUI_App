%% Initialize
clear ;
load rock.mat
% T=850; %deformation conditions
% P=20e3*10*3000; %600 Mpa
R=8.314; %
% Shinevar et al., 2015
Aw=5521e6;Qw=31.28e3;Vw=20.09e-6;
% fw=@(P,T)5521*exp(-(31.28e3-20.09e-6*P)./(R*T))*1e6;
fw=@(P,T)Aw*exp(-(Qw-Vw*P)./(R*T));
Tk=273.15;

% plagwet=eps.^((1-3)./3)./((10^(0.2)*fug.*exp(-(345e3+Ppa*38e-6)./(R*T))).^(1./3))*1e6./(2.^((3-1)./3).*3.^((3+1)./(2*3)));

%% initialize rheology / use latest edition of rock.mat
nM=7; %nM=numel(M); %number of end-member rheologies
in=1;
M(in).name='Quartzite';
sel(in).ir=2;sel(in).il=1; %Selected dislocation creep HTD01
in=2;
M(in).name='Feldspar';
sel(in).ir=4;sel(in).il=2; %Selected dislocation creep RD06w
in=3;
M(in).name='Biotite';
sel(in).ir=6;sel(in).il=1; %Selected dislocation creep Kr90
in=4;
M(in).name='Pyroxene';
sel(in).ir=8;sel(in).il=2; %Selected dislocation creep DD05Dw
in=5;
M(in).name='Amphibole';
sel(in).ir=9;sel(in).il=1; %Selected dislocation creep Hc90amp
in=6;
M(in).name='Olivine';  
sel(in).ir=1;sel(in).il=2; %Selected dislocation creep HK03dw
in=7;
M(in).name='Mantle';  
sel(in).ir=1;sel(in).il=6; %Selected dislocation creep HK03d480

for in=1:nM
    ir=sel(in).ir; il=sel(in).il; %rock and rheology for this mineral
    M(in).code=rock(ir).rheol(il).name;
    M(in).ref=rock(ir).rheol(il).ref;
    M(in).density=rock(ir).density;
    switch rock(ir).rheol(il).type
        case 2
            M(in).s=@(r,T,P)rock(ir).rheol(il).s(r,T,fw(P,T));
            M(in).r=@(s,T,P)rock(ir).rheol(il).r(s,T,fw(P,T));
        case 6
            M(in).s=@(r,T,P)rock(M(in).ir).rheol(M(in).il).s(r,T,P,fw(P,T));
            M(in).r=@(s,T,P)rock(M(in).ir).rheol(M(in).il).r(s,T,P,fw(P,T));
        case 1
            M(in).s=@(r,T,P)rock(ir).rheol(il).s(r,T);
            M(in).r=@(s,T,P)rock(ir).rheol(il).r(s,T);
        case 5
            M(in).s=@(r,T,P)rock(ir).rheol(il).s(r,T,P);
            M(in).r=@(s,T,P)rock(ir).rheol(il).r(s,T,P);
        otherwise
            warning('Unexpected rheology type; aborting');
            return 
    end
    M(in).n=rock(ir).rheol(il).n;
    M(in).p=rock(ir).rheol(il).p;
    M(in).Q=rock(ir).rheol(il).Q;
    M(in).V=rock(ir).rheol(il).V;
    M(in).A=rock(ir).rheol(il).A;
    M(in).B=rock(ir).rheol(il).B;
end

n=[M.n];p=[M.p];Q=[M.Q];V=[M.V];A=[M.A];B=[M.B];rh=[M.density];
