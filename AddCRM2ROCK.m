HuetMPGeWet
RG=8.314510; %J.mol^(-1).K^(-1)


id=12;
rock(id).name='CRM 1.0 wet';
% Right now, inputing hte density of feldspar, but should be updated to
% have density etc. associated with rheology, not rock.
rock(id).density='';
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

rock(id).piezo(1).geq=@(s)(s/603e6).^(-1/0.68)*1e-6;
rock(id).piezo(1).ref='Twiss 1977';

for ir=1:nLitho
    % Store each lithology
    n=Litho(ir).nh;
    Q=Litho(ir).Qf;
    V=Litho(ir).Vf;
    B=Litho(ir).Bf;
    A=2*(3^(-(n+1)/2))*(B)^(-n);
    rock(id).rheol(ir).name=Litho(ir).Name;
    rock(id).rheol(ir).ref=sprintf('%4.2fQz %4.2fFd %4.2fBt %4.2fPx %4.2fAm  %4.2fOl  %4.2fMa',...
        Litho(ir).composition);
    rock(id).rheol(ir).density=Litho(ir).density;
    rock(id).rheol(ir).type=5;
    rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
    rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
    store_rheol_numbers;    
end

% Check and save
nrock=size(rock,2);
for id=1:numel(rock);
    for ir=1:numel(rock(id).rheol);
        if ~isfield(rock(id).rheol(ir),'n'); rock(id).rheol(ir).n=0;
        elseif isempty(rock(id).rheol(ir).n); rock(id).rheol(ir).n=0;end
        if ~isfield(rock(id).rheol(ir),'m'); rock(id).rheol(ir).m=0;
        elseif isempty(rock(id).rheol(ir).m); rock(id).rheol(ir).m=0;end
        if ~isfield(rock(id).rheol(ir),'p'); rock(id).rheol(ir).p=0;
        elseif isempty(rock(id).rheol(ir).p); rock(id).rheol(ir).p=0;end
        if ~isfield(rock(id).rheol(ir),'Q'); rock(id).rheol(ir).Q=0;
        elseif isempty(rock(id).rheol(ir).Q); rock(id).rheol(ir).Q=0;end
    end
end
save 'rock' rock nrock
