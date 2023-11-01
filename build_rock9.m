% CRM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% unit conversion
RG=8.314510; %J.mol^(-1).K^(-1)
% 
% % Initialize water fugacity function
% load water_fugacity
% fw=@(P,T)P*interp2(P_H2O,T_H2O,gamma_coef,P,T,'spline');

%initialize with default values
id=0;
ir=0;
clear rock
ip=0;

%ip=ip+1;
%rock(id).piezo(ip).geq=@(s)(s/603e6).^(-1/0.68)*1e-6;
%rock(id).piezo(ip).ref='Twiss 1977';

%Basalt
id=id+1;
ir=0;
rock(id).name='Basalt';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=4.45454545454545;
Q=495264.727272727;
V=4.50127272727273*1e-06;
A=1.1e5*(1e-6)^n;
B=132293.489301402; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Basalt';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;

%Use the Qf, Vf, Bf, not Q, V, B (the parameters without the f are for a type 6 formulation. You do need to type the values in  Build_rock7 by hand.

%Forearc Sediments
id=id+1;
ir=0;
rock(id).name='Forearc Sediments';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=4.05992010652463;
Q=191309.560585885;
V=-0.0000150155659121172;
A=1.1e5*(1e-6)^n;
B=21483583.5288246; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Forearc Sediments';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;

%Franciscan Melange
id=id+1;
ir=0;
rock(id).name='Franciscan Melange';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=4.1877133105802;
Q=203985.66552901;
V=-0.000012148976109215;
A=1.1e5*(1e-6)^n;
B=14923308.7343466; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Franciscan Melange';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;

%Franciscan Schist
id=id+1;
ir=0;
rock(id).name='Franciscan Schist';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=3.93506493506494;
Q=216601.038961039;
V=-0.0000104524675324675;
A=1.1e5*(1e-6)^n;
B=10754779.6706297; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Franciscan Schist';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;

%Gabbro
id=id+1;
ir=0;
rock(id).name='Gabbro';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=4.45454545454545;
Q=495264.727272727;
V=4.50127272727273*1e-06;
A=1.1e5*(1e-6)^n;
B=132293.489301402; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Gabbro';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;

%Grandiorite05
id=id+1;
ir=0;
rock(id).name='Grandiorite05';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=3.63174273858921;
Q=313199.211618257;
V=7.79059128630705*1e-06;
A=1.1e5*(1e-6)^n;
B=567576.482916453; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Grandiorite05';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;

%Grandiorite10
id=id+1;
ir=0;
rock(id).name='Grandiorite10';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=3.61808967264829;
Q=316584.411232352;
V=8.69540104462946*1e-06;
A=1.1e5*(1e-6)^n;
B=515980.350234172; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Grandiorite10';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;


%Meta-Basic
id=id+1;
ir=0;
rock(id).name='Meta-Basic';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=3.59509418577496;
Q=360022.511647054;
V=0.0000114215661081622;
A=1.1e5*(1e-6)^n;
B=227121.261659858; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Meta-Basic';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;

%Meta-Felsic
id=id+1;
ir=0;
rock(id).name='Meta-Felsic';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=3.52566126737228;
Q=324008.597547902;
V=7.61216225172017*1e-06;
A=1.1e5*(1e-6)^n;
B=442109.194477469; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Meta-Felsic';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;

%Meta-Intermediate
id=id+1;
ir=0;
rock(id).name='Meta-Intermediate';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=3.56011344308402;
Q=341878.474331931;
V=9.50236439269847*1e-06;
A=1.1e5*(1e-6)^n;
B=316652.8492682; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Meta-Intermediate';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;

%Peridotite
id=id+1;
ir=0;
rock(id).name='Peridotite';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=3.79508196721311;
Q=554063.475409836;
V=-1.79698360655737*1e-06;
A=1.1e5*(1e-6)^n;
B=10427.4949841045; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Peridotite';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;

%Quartz Diorite
id=id+1;
ir=0;
rock(id).name='Quartz Diorite';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=3.60451686088481;
Q=319949.712282149;
V=9.59489223471177*1e-06;
A=1.1e5*(1e-6)^n;
B=469002.030242693; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Quartz Diorite';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;

%Rand Schist
id=id+1;
ir=0;
rock(id).name='Rand Schist';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=3.92546986390149;
Q=328384.731043422;
V=0.0000113663836681789;
A=1.1e5*(1e-6)^n;
B=445250.25099132; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Rand Schist';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;

%Rift Basin Fill
id=id+1;
ir=0;
rock(id).name='Rift Basin Fill';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=3.93506493506494;
Q=216601.038961039;
V=-0.0000104524675324675;
A=1.1e5*(1e-6)^n;
B=10754779.6706297; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Rift Basin Fill';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;

%Schist
id=id+1;
ir=0;
rock(id).name='Schist';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=3.93506493506494;
Q=216601.038961039;
V=-0.0000104524675324675;
A=1.1e5*(1e-6)^n;
B=10754779.6706297; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Schist';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;

%Sediment
id=id+1;
ir=0;
rock(id).name='Sediment';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=4;
Q=166280;
V=-0.00002009;
A=1.1e5*(1e-6)^n;
B=43807884.1467735; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Sediment';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;

%Sediment and Sills
id=id+1;
ir=0;
rock(id).name='Sediment and Sills';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=4.26434195725534;
Q=321039.001124859;
V=-8.34225646794151*1e-06;
A=1.1e5*(1e-6)^n;
B=2606694.22165354; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Sediment and Sills';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;

%Sediment Colorado
id=id+1;
ir=0;
rock(id).name='Sediment Colorado';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=3.87804878048781;
Q=-0.0000154558536585366;
V=-8.34225646794151*1e-06;
A=1.1e5*(1e-6)^n;
B=21983969.8670437; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Sediment Colorado';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;

%Mantle
id=id+1;
ir=0;
rock(id).name='Mantle';
rock(id).density=2800;
rock(id).thermal(1).alpha=2.4e-5;
rock(id).thermal(1).k=3.5;

ir=ir+1;
n=3.5;
Q=480000;
V=0.000011;
A=1.1e5*(1e-6)^n;
B=20028.5749940779; %2.^((1+(3/n))/2)*A.^(-1/n);
rock(id).density=2800;
rock(id).rheol(ir).name='Mantle';
rock(id).rheol(ir).ref='Hirth and Kohlstedt, 2003, dry olivine, dislocation creep';
rock(id).rheol(ir).type=5;
rock(id).rheol(ir).r=@(s,T,P)(s/B).^n.*exp(-(Q+P*V)./(RG*T));
rock(id).rheol(ir).s=@(r,T,P)B.*exp((Q+P*V)./(n*RG*T)).*r.^(1/n);
store_rheol_numbers;

ip=ip+1;
rock(id).piezo(ip).geq=@(s)(s/603e6).^(-1/0.68)*1e-6;
rock(id).piezo(ip).ref='Twiss 1977';
nrock=size(rock,2);

for id=1:numel(rock)
    for ir=1:numel(rock(id).rheol)
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



save 'rock' rock nrock;

