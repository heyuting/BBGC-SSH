clear all, close all;
clc; 
% Dir='/eddy/s0/users/yzh120/Research/BiomeBGC/GitHub/BBGC-SSH/BBGC4.2.PSU/';
Dir =  '/eddy/s0/users/yzh120/Research/BiomeBGC/GitHub/BBGC-SSH/BBGC4.2.PSU/';
FigDir='/eddy/s0/users/yzh120/Research/BiomeBGC/GitHub/BBGC-SSH/BBGC4.2.PSU/';
Outname = 'Fig4';
%load sc.dayout.ascii

 fdayout74=fopen([Dir 'outputs/fig4.sc.dayout74.ascii']);
 dayout74=textscan(fdayout74,repmat('%f',[1,42]));
 fclose(fdayout74);
 dailyGPP74=dayout74{22};
 
 fdayout61=fopen([Dir 'outputs/fig4.sc.dayout61.ascii']);
 dayout61=textscan(fdayout61,repmat('%f',[1,42]));
 fclose(fdayout61);
 dailyGPP61=dayout61{22};
 
 fMeteo74=fopen([Dir 'metdata/sc_74_8cm_Wsavg_61.txt']);
 MeteoData74=textscan(fMeteo74,repmat('%f', [1,11]),'HeaderLines',4);
 fclose(fMeteo74);
 Ts74=MeteoData74{11};
 
 fMeteo61=fopen([Dir 'metdata/sc_61_RZ_Wsavg_74.txt']);
 MeteoData61=textscan(fMeteo61,repmat('%f',[1,11]),'HeaderLines',4);
 fclose(fMeteo61);
 Ts61=MeteoData61{11};
 
 fannout61=fopen([Dir 'outputs/fig4.sc.annout61.ascii']);
 annout61=textscan(fannout61,repmat('%f',[1,12]));
 fclose(fannout61);
 VegC61=annout61{2};
 SoilC61=annout61{4};
 TotalC61=annout61{5};
 ABVGC61=annout61{7}+annout61{8}+annout61{9};
 
 fannout74=fopen([Dir 'outputs/fig4.sc.annout74.ascii']);
 annout74=textscan(fannout74,repmat('%f',[1,12]));
 fclose(fannout74);
 VegC74=annout74{2};
 SoilC74=annout74{4};
 TotalC74=annout74{5};
 ABVGC74=annout74{7}+annout74{8}+annout74{9};
 

 [row,col]=size(dailyGPP61);
 
 fig = figure;
 Figure_width = 25;
 Figure_height = 20;
 
 ylim9 = [9.25 9.4];
 ylim10 = [14.2 14.8];
 ylim1 = [-2 25];
 ylim2 = [-0.002 0.03];
 
 marginl = 0.11;
%marginr = 0.02;
 marginm = 0.07;
 margin2 = 0.01;
 margin1 = 0.08;
 
 width1 = 0.39;
 height = 0.25;
 marginb = 0.08; 
 width2 = (width1-marginb)/2;
 dh = 0.02;
 
 Fontname = 'Times';
 Fontsize = 18;
 linewidth = 1.0;
 %plot soil temperature
 %subplot(3,4,[1,2]);
  p1 = subplot('position',[marginl 2*margin2+margin1+2*height width1 height]);
  figTs=plot(Ts61,'r');
%   title('Observed Soil Temperature [2008-2010]','FontSize',Fontsize,'FontWeight','bold');
  axis([0 row -2 25]);
  %set(gca,'ylim',ylim1,'FontSize',Fontsize-2,'FontWeight','bold','XTick',0:365:row,'xticklabel',[],'linewidth',linewidth,'fontname',Fontname);
   set(gca,'linewidth',linewidth,'ylim',ylim1,'FontSize',Fontsize-2,'FontWeight','bold','XTick',365/2:365:row-365/2,'xticklabel',[]);

  set(figTs,...
  'LineStyle','-',...
  'LineWidth',2);
  grid;
% xlabel('days','FontSize',Fontsize,'FontWeight','bold');
  ylabel('\bf{Soil Temperature [^\circC]}','FontSize',...
    Fontsize,'fontname',Fontname);
  Title1 = title(p1,'\bf{#61, valley floor}');
 
% subplot(3,4,[3,4]);
  p2 = subplot('position',[marginl+marginm+width1 2*margin2+margin1+2*height width1 height]);
  figTs=plot(Ts74,'r');
%   title('Observed Soil Temperature [2008-2010]','FontSize',Fontsize,'FontWeight','bold');
  axis([0 row -2 25]);
  %set(gca,'linewidth',linewidth,'ylim',ylim1,'yticklabel',[],'FontSize',Fontsize-2,'FontWeight',...
  %    'bold','XTick',0:365:row,'xticklabel',[],'fontname',Fontname);
   set(gca,'linewidth',linewidth,'ylim',ylim1,'FontSize',Fontsize-2,'FontWeight','bold','XTick',365/2:365:row-365/2,'xticklabel',[]);

  set(figTs,...
  'LineStyle','-',...
  'LineWidth',2);
  grid;
% xlabel('days','FontSize',Fontsize,'FontWeight','bold');
% ylabel('Soil Temperature [^oC]','FontSize',Fontsize,'FontWeight','bold');
  Title2 = title(p2,'\bf{#74, ridge top}');
  set([Title1 Title2],'fontname',Fontname,'FontSize',Fontsize+2,'FontWeight','bold');
  
%  plot daily GPP
%  subplot(4,2,2);
%  subplot(3,4,[5,6]);
 subplot('position',[marginl 2*margin2+height width1 height])
 figGPP61=plot(dailyGPP61,'g');
%  title('Modeled dailyGPP [2008-2010]','FontSize',Fontsize,'FontWeight','bold');
 set(figGPP61,...
     'LineStyle','-',...
     'LineWidth',2.0,...
     'Color',[0.2 0.5 0.2]);
 grid;
 set(gca,'linewidth',linewidth,'ylim',ylim2,'FontSize',Fontsize-2,'FontWeight','bold','XTick',365/2:365:row-365/2,...
     'xticklabel',2008:2010,'fontname',Fontname);
 axis([0 row -0.01 0.03]);
 xlabel('\bf{Year}','FontSize',Fontsize,'FontWeight','bold','fontname',Fontname);
 y5 = ylabel('\bf{Daily GPP [kgC m^{-2}d^{-1}}]');
 set(y5, 'FontSize',Fontsize,'FontWeight','bold');
%  subplot(3,4,[7,8]);

 subplot('position',[marginl+marginm+width1 2*margin2+height width1 height])
 figGPP74=plot(dailyGPP74,'g');
%  title('Modeled dailyGPP [2008-2010]','FontSize',Fontsize,'FontWeight','bold');
 set(figGPP74,...
     'LineStyle','-',...
     'LineWidth',2.0,...
     'Color',[0.2 0.5 0.2]);
 grid;
 set(gca,'linewidth',linewidth,'ylim',ylim2,'FontSize',Fontsize-2,'FontWeight','bold','XTick',365/2:365:row-365/2,...
     'xticklabel',2008:2010,'fontname',Fontname);
 axis([0 row -0.01 0.03]);
 xlabel('\bf{Year}','fontname',Fontname,'FontSize',Fontsize,'FontWeight','bold');
%  ylabel('daily GPP [kgC/m^2/d]','FontSize',22,'FontWeight','bold');


%   %plot annual output 61
% %  subplot(3,4,9);
%  subplot('position',[marginl margin2 width2 height-dh])
%  figVC61=plot(ABVGC61,'o');
% %  title('Aboveground Veg C Pool');
%  set(figVC61,...
%  'LineStyle',':',...
%  'MarkerSize',5,...
%  'MarkerEdgeColor',[0 0.3 0],...
%  'MarkerFaceColor',[0 0.4 0],...
%  'LineWidth',1,...
%  'Color',[0.1 0.3 0.1]);
%   set(gca,'fontname',Fontname,'linewidth',linewidth,'FontSize',Fontsize-2,'FontWeight','bold',...
%       'ylim',ylim9,'XTick',1:3,'XTickLabel',['2008';'2009';'2010']);
%   ylabel('\bf{Abvg Veg C [kgC m^{-2}d^{-1}]}','FontSize',Fontsize,'FontWeight','bold');
%  
% %  subplot(3,4,10);
%  subplot('position',[marginl+marginb+width2 margin2 width2 height-dh])
%  figSC61=plot(SoilC61,'s');
% %  title('Soil C Pool');
%   set(figSC61,...
%  'LineStyle','-.',...
%  'MarkerSize',4,...
%  'MarkerEdgeColor',[0.4 0.4 .2],...
%  'MarkerFaceColor',[0.4 0.4 .2],...
%  'LineWidth',1,...
%  'Color',[0.2 0.2 0.1]);
%  set(gca,'linewidth',linewidth,'ylim',ylim10,'FontSize',Fontsize-2,'FontWeight','bold','XTick',1:3,'XTickLabel',['2008';'2009';'2010'],'fontname',Fontname);
%   ylabel('\bf{Soil C [kgC m^{-2}]}','FontWeight','bold','fontname',Fontname);
% 
%     %plot annual output 74
% %  subplot(3,4,11);
%  subplot('position',[marginl+marginm+width1+0.01 margin2 width2 height-dh])
%  figVC74=plot(ABVGC74,'o');
% %  title('Aboveground Veg C Pool');
%  set(figVC74,...
%  'LineStyle',':',...
%  'MarkerSize',5,...
%  'MarkerEdgeColor',[0 0.3 0],...
%  'MarkerFaceColor',[0 0.4 0],...
%  'LineWidth',1,...
%  'Color',[0.1 0.3 0.1]);
%   set(gca,'linewidth',linewidth,'ylim',ylim9,'FontSize',Fontsize-2,'FontWeight','bold','XTick',1:3,...
%       'XTickLabel',['2008';'2009';'2010'],'fontname',Fontname);
% %   ylabel('Aboveground Veg C [kgC/m^2/d]','FontSize',22,'FontWeight','bold');
%  
% %  subplot(3,4,12);
%  subplot('position',[marginl+marginm+width1+width2+marginb margin2 width2 height-dh])
%  figSC74=plot(SoilC74,'s');
% %  title('Soil C Pool');
%   set(figSC74,...
%  'LineStyle','-.',...
%  'MarkerSize',4,...
%  'MarkerEdgeColor',[0.4 0.4 .2],...
%  'MarkerFaceColor',[0.4 0.4 .2],...
%  'LineWidth',1,...
%  'Color',[0.2 0.2 0.1]);
%  set(gca,'linewidth',linewidth,  'ylim',ylim10,'FontSize',Fontsize-2,'FontWeight','bold','XTick',1:3,...
%      'XTickLabel',['2008';'2009';'2010'],'fontname',Fontname);
% %   ylabel('Soil C [kgC/m^2]','FontSize',22,'FontWeight','bold');
% 
% set(fig, 'color', 'w');
% set(fig, 'units', 'centimeters','pos', [0 0 Figure_width Figure_height]);
% set(fig, 'PaperPositionMode', 'auto','Visible','on');
% set(fig,'PaperOrientation','landscape');
% print(fig,'-dpdf' ,[FigDir Outname]);
%  '-dpng'

% txt1 = text(0.3, 0.9,'#61,Valley floor','units','normalized');