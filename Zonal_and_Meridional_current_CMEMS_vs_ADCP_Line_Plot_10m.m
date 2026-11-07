clc; clear;

load ADCP_uv10.mat
load CMEMS_uv10.mat

%%
%SC5
m=[1:1:31];
[ax,hlines,fh] = jzplotys_sealevel({m,u10_ADCP,m,u10,m,v10_ADCP,m,v10},[1 1 1 1],[1 31],100);

ylabel(ax(1),'ADCP zonal velocity at 10 meter depth (ms^-^1)','FontName','Times', 'FontSize',12, 'FontWeight','bold');
%ylabel(ax(3),'Eddy mean SSH with-tide (m)','FontName','Times', 'FontSize',12, 'FontWeight','bold');
ylabel(ax(3),'Reanalysis zonal velocity at 10 meter depth (ms^-^1)','FontName','Times','FontSize',12, 'FontWeight','bold');
ylabel(ax(5),'ADCP meridional velocity at 10 meter depth (ms^-^1)','FontName','Times','FontSize',12, 'FontWeight','bold');
ylabel(ax(7),'Reanalysis meridional velocity at 10 meter depth (ms^-^1)','FontName','Times', 'FontSize',12, 'FontWeight','bold');

set(ax(1),'YLim',[-0.8 1.2],'YTickMode','auto','FontName','Times', 'FontSize', 12,'FontWeight','bold','LineWidth',1.5)
%set(ax(3),'YLim',[-0.15 0.25],'YTickMode','auto', 'FontName','Times','FontSize', 12,'FontWeight','bold','LineWidth',2)
set(ax(3),'YLim',[-0.8 1.2],'YTickMode','auto', 'FontName','Times','FontSize', 12,'FontWeight','bold','LineWidth',2)
set(ax(5),'YLim',[-0.8 1.2],'YTickMode','auto', 'FontName','Times','FontSize', 12,'FontWeight','bold','LineWidth',2)
set(ax(7),'YLim',[-0.8 1.2],'YTickMode','auto','FontName','Times', 'FontSize', 12,'FontWeight','bold','LineWidth',2)

%xticklabels(ax(1),{'20','40','60','80','100','120','140','160','180','200'})
xlabel(ax(1),'Date','FontName','Times','FontSize',14, 'FontWeight','bold');

set(hlines{1}(1),'LineWidth',1.2,'linestyle','-');
set(hlines{2}(1),'LineWidth',1.5,'linestyle','-');
set(hlines{4}(1),'LineWidth',1.2,'linestyle','-');
set(hlines{6}(1),'LineWidth',1.2,'linestyle','-');

%text(29.5,20,{'RMSE ADCP VS CMEMS = 0.79'},'fontname','Times','fontsize',14,'fontweight','bold')
%text(30.5,20,{'RMSE ADCP VS NOAA = 0.55'},'fontname','Times','fontsize',14,'fontweight','bold')

legend(cat(1,hlines{:}),'ADCP zonal velocity','CMEMS zonal velocity','ADCP meridional velocity','CMEMS meridional velocity','location',[.5 .5 .01 .01],'Orientation','vertical')

%u_rmse = 0.359
%v_rmse = 0.245

exportgraphics(gcf,'Line_plot_uv10_val.png','Resolution',1000);