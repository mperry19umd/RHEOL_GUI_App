% HuetMPGeParameters.m
% Calculates analytically flow law parameters for each rock type using 
% Huet et al., (2014) MPGe model: 
% Minimized Power, Geometric Average, strainrate model
% Model appropriate for untextured rocks.

%% Initialize
LoadEndMember;

%% import GF
[num,txt,raw]=xlsread('CRM_slab_format.xlsx','A5:K85');
LithoName=unique(txt(:,5)); nLitho=numel(LithoName);
for iLitho=1:nLitho
    RowNum=min(find(strcmp(txt(:,5),LithoName(iLitho))));
    Litho(iLitho).Name=cell2mat(txt(RowNum,5));
    Composition=cell2mat(raw(RowNum,5+[1:nM-1]));
    C=[Composition/sum(Composition),0]; 
    % Huet MPGe
    a=sum(n+1)./(n+1);
%     Litho(iLitho).composition=C;
    Litho(iLitho).density=sum(C.*rh)/sum(C);
    Litho(iLitho).nh=sum(C.*a.*n)/sum(C.*a);
    Litho(iLitho).Qh=sum(C.*a.*Q)/sum(C.*a);
    Litho(iLitho).Vh=sum(C.*a.*V)/sum(C.*a);
    Litho(iLitho).ph=sum(C.*a.*p)/sum(C.*a);
    Litho(iLitho).Bh=prod((B.*(n+1)./n).^((C.*a.*n)/sum(C.*a.*n)))*sum(C.*n./(n+1));
    Litho(iLitho).Qf=Litho(iLitho).Qh+Qw*Litho(iLitho).ph;
    Litho(iLitho).Vf=Litho(iLitho).Vh-Vw*Litho(iLitho).ph;
    Litho(iLitho).Bf=Litho(iLitho).Bh*(Aw^(-Litho(iLitho).ph/Litho(iLitho).nh));
    Litho(iLitho).composition=C;    
    Litho(iLitho).etaex=(Litho(iLitho).Bf/2)*...
        ((1e-14)^(1/Litho(iLitho).nh-1))*...
        exp((Litho(iLitho).Qf+5e8*Litho(iLitho).Vf)./(Litho(iLitho).nh*R*800));
end
%% add mantle 

LithoName{nLitho+1,1}='Mantle'; nLitho=numel(LithoName);

iLitho=nLitho;C=C*0;C(end)=1;
Litho(iLitho).Name='Mantle';

Litho(iLitho).nh=M(in).n;
    Litho(iLitho).density=M(in).density;
    Litho(iLitho).Qh=M(in).Q;
    Litho(iLitho).Vh=M(in).V;
    Litho(iLitho).ph=M(in).p;
    Litho(iLitho).Bh=M(in).B;
    Litho(iLitho).Qf=Litho(iLitho).Qh+Qw*Litho(iLitho).ph;
    Litho(iLitho).Vf=Litho(iLitho).Vh-Vw*Litho(iLitho).ph;
    Litho(iLitho).Bf=Litho(iLitho).Bh*(Aw^(-Litho(iLitho).ph/Litho(iLitho).nh));
    Litho(iLitho).composition=C;    
    Litho(iLitho).etaex=(Litho(iLitho).Bf/2)*...
        ((1e-14)^(1/Litho(iLitho).nh-1))*...
        exp((Litho(iLitho).Qf+5e8*Litho(iLitho).Vf)./(Litho(iLitho).nh*R*800));

%% Save the results (it ain't pretty but it works)
% Preparing to make a matlab table
Names=LithoName;
% general rheology
nh=[Litho.nh]';Qh=[Litho.Qh]';Vh=[Litho.Vh]';ph=[Litho.ph]';Bh=[Litho.Bh]';
% "wet" rheology
Qf=[Litho.Qf]';Vf=[Litho.Vf]';Bf=[Litho.Bf]';Etaex=[Litho.etaex]';
% composition
CompMat=transpose(reshape([Litho.composition],nM,[]));
Quartz=CompMat(:,1);Feldspar=CompMat(:,2);Biotite=CompMat(:,3);
Pyroxene=CompMat(:,4);Amphibole=CompMat(:,5);Olivine=CompMat(:,6);
Mantle=CompMat(:,6)*0;Mantle(end)=1;
% make table 
T=table(Names,nh,ph,Qh,Vh,Bh,Qf,Vf,Bf,Etaex,...
    Quartz,Feldspar,Biotite,Pyroxene,Amphibole,Olivine,Mantle);
% rename variable names in table
T.Properties.VariableNames{2}='n';
T.Properties.VariableNames{3}='r';
T.Properties.VariableNames{4}='Q';
T.Properties.VariableNames{5}='V';
T.Properties.VariableNames{6}='B';
T.Properties.VariableNames{10}='eta_example';
% At last, save!
% writetable(T,'GFlitho_MPGe_Wet.csv');
% writetable(table(Names,nh,ph,Qh,Vh,Bh,Qf,Vf,Bf),'GFlitho_MPGe_Dry.csv');
    
