function viz_strength(model,did,e,axst,axgs,axth,rock);

nlayer=numel(model);

%plot_strength_integrate; input ifig=0 to turn off plot (integrate only)

% % if ifig==0; %integrate, no figure
%     nstep=100;
% %     Stotal=0;
%     %plot strength, temperature, and grain size
%     icolor=0;in=0;
%     for il=1:nlayer;
%         for im=1:model(il).nrock
%             for is=1:model(il).rock(im).nstr;
%                 in=in+1;
%                 z=linspace(model(il).rock(im).str(is).ztop,model(il).rock(im).str(is).zbot,nstep);
%
%                 if isa(model(il).rock(im).gs,'function_handle');
%                     %can't use vector for z
%                     stress=z*0;
%                     grain=stress;
%                     for iz=1:numel(z)
%                         stress(iz)=model(il).rock(im).str(is).s(z(iz),e);
%                         grain(iz)=model(il).rock(im).gs(stress(iz));
%                     end
%                 else %use vector for z
%                     stress=model(il).rock(im).str(is).s(z,e);
%                     grain=model(il).rock(im).gs;
%                 end
%                 Stotal=Stotal+sum((stress(1:end-1)+stress(2:end)).*diff(z)/2);
%             end
%         end
%     end
% else %integrate and plot

%     %initialize figure
%     set(0,'DefaultAxesLineWidth',1,...
%         'DefaultAxesFontSize',12,...
%         'DefaultAxesColor','none');
collist=[0,0,0;1,0,0;0,1,0;0,0,1;1,1,0;0,1,1;1,0,1;...
    0.75,0.25,0.25;0.25,0.75,0.25;0.25,0.25,0.75];
ncolor=10;
icolor=0;
nz=100;

axes(axst);cla;hold on
cla(axgs);hold on
cla(axth);hold on
%     figure (ifig)
%     clf
%     hold on

%     axst=gca;% axis for strength envelope

%     axth=axes; % axis for temperature profile
%     hold on
%     axgs=axes; % axis for grain size profile
%     hold on

labels=[];

nstep=100;
%     Stotal=0;
%plot strength, temperature, and grain size
icolor=0;in=0;
for il=1:nlayer;
    for im=1:model(il).nrock
        for is=1:model(il).rock(im).nstr;
            in=in+1;
            labels(in).text=model(il).rock(im).str(is).name;%
%             if model(il).rock(im).str(is).law<0; %brittle law
%                 %                     z=[model(il).rock(im).str(is).ztop,model(il).rock(im).str(is).zbot];
%                 labels(in).text=model(il).rock(im).str(is).name;%'Brittle';
%                 %                     stress=model(il).rock(im).str(is).s(z,e);
%                 %                     Stotal=Stotal+sum(stress)*(z(end)-z(1))/2;
%             else
%                 labels(in).text=rock(model(il).irock(im)).rheol(model(il).rock(im).str(is).law).name;
%             end
            z=linspace(model(il).rock(im).str(is).ztop,model(il).rock(im).str(is).zbot,nstep);
            
            if isa(model(il).rock(im).gs,'function_handle');
                %can't use vector for z
                stress=z*0;
                grain=stress;
                for iz=1:numel(z)
                    stress(iz)=model(il).rock(im).str(is).s(z(iz),e);
                    grain(iz)=model(il).rock(im).gs(stress(iz));
                end
            else %use vector for z
                stress=model(il).rock(im).str(is).s(z,e);
                grain=model(il).rock(im).gs+(z*0);
            end
            %             Stotal=Stotal+sum((stress(1:end-1)+stress(2:end)).*diff(z)/2);
            
            
            icolor=mod(icolor,ncolor)+1;
            
            axes(axst); hold on; plot(stress/1e6,z/1000,'color',collist(icolor,:),'linewidth',2,'Parent',axst);
            axes(axgs); hold on; plot(grain*1e6,z/1000,'color',collist(icolor,:),'linewidth',2,'Parent',axgs);
            axes(axth); hold on; plot(model(il).Temperature(z)-273.15,z/1000,'color',collist(icolor,:),'linewidth',2,'Parent',axth,'linestyle','--');
            
            %plot thermal profile
            %                 z=linspace(model(il).rock(im).str(is).ztop,model(il).rock(im).str(is).zbot,100);
            %                 T=model(il).Temperature(z)-Celsius;
            %                 %         ztop=model(1).str(1).ztop;
            %                 %         zbot=model(end).scomb(end).zbot;
            %                 %         z=ztop+(zbot-ztop)*[0:nz-1]/(nz-1);
            %                 %         T=calc_T(z,Ts,Ti,G,del,thid)-Celsius;
            %                 plot(T,z/1000,'color',collist(icolor,:),'linewidth',4,'parent',axth);
        end
    end
    %     end
    
    %     axstpos=get(axst,'Position');
    %     axthpos=axstpos;
    %     axthpos(3)=axstpos(3)/2;
    %     axstpos(1)=axthpos(1)+axthpos(3);
    %     axstpos(3)=axthpos(3);
    %     axgspos=axstpos;
    %
    %     set (axst,'Position',axstpos,...
    %         'box','on',...
    %         'fontSize',12,...
    %         'Ydir','reverse',...
    %         'Xdir','normal',...
    %         'XAxisLocation','bottom',...
    %         'YAxisLocation','left',...
    %         'Color','none',...
    %         'Xcolor','k',...
    %         'Ycolor','k',...
    %         'TickDir','in',...
    %         'YTickLabel','');
    %     set (axth,'Position',axthpos,...
    %         'Ydir','reverse',...
    %         'Xdir','reverse',...
    %         'XAxisLocation','bottom',...
    %         'YAxisLocation','right',...
    %         'Color','none',...
    %         'Xcolor','k',...
    %         'Ycolor','k',...
    %         'TickDir','in');
    %     set (axgs,'Position',axthpos,...
    %         'Ydir','reverse',...%    'Xdir','reverse',...
    %         'xscale','log',...
    %         'XAxisLocation','top',...
    %         'YAxisLocation','left',...
    %         'Color','none',...
    %         'Xcolor','k',...
    %         'Ycolor','k',...
    %         'TickDir','in');
    %
    %     set(get(axst,'xlabel'),'string','Stress (MPa)','fontSize',18);
    %     set(get(axst,'ylabel'),'string','Depth (km)','fontSize',18);
    %     set(get(axth,'xlabel'),'string','Temperature (\circ C)','fontSize',18);
    %     set(get(axgs,'xlabel'),'string','Grain size (\mum)','fontSize',18);
    %     set(get(axgs,'ylabel'),'string','Depth (km)','fontSize',18);
    %
    
    
    axes(axst);    legend(labels.text,'Location','best')
    axis auto
    set(get(axst,'xlabel'),'string','Stress (MPa)');%,'fontSize',18);
    %set(get(axst,'ylabel'),'string','Depth (km)');%,'fontSize',18);
    set(get(axst,'ylabel'),'string','');%,'fontSize',18);
    set(axst,'ylim',get(axth,'ylim'),'xscale','lin','yscale','lin');
    set(axst,'box','on','ydir','reverse','color','white');
    
    axes(axgs);
    set(get(axgs,'xlabel'),'string','Grain size (\mum)');%,'fontSize',18);
    %         set(get(axgs,'ylabel'),'string','Depth (km)');%,'fontSize',18);
    set(axgs,'box','off','ydir','reverse','color','white');
    set(axgs','YAxisLocation','right','Yticklabel',[]);
    set(axgs,'xscale','log','ylim',get(axst,'ylim'),'color','none','xlim',[1,1e6]);
    
    axes(axth);
    set(axth,'box','off','ydir','reverse','color','white');
    
    
    
    
    %     orient landscape
    %
end