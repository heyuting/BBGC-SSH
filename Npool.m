 clear all, close all;
 clc; 
 Dir='/eddy/s0/users/yzh120/Research/BiomeBGC/GitHub/BBGC-SSH/60BBGC/';
 
 %load sc.dayout.ascii

 fdayout=fopen([Dir 'outputs/sc.dayout.ascii']);
 dayout=textscan(fdayout,repmat('%f',[1,26]));
 fclose(fdayout);
 sminn_leached=dayout{25};
 sminn_npool=dayout{26};

 %load sc.annout.ascii
 fannout=fopen([Dir 'outputs/sc.annout.ascii']);
 annout=textscan(fannout,repmat('%f',[1,18]));
 fclose(fannout);
 VegC=annout{2};
 LitrC=annout{3};
 SoilC=annout{4};
 TotalC=annout{5};
 ABVGC=annout{7}+annout{8}+annout{6};
 SminN=annout{12};
 N_pool=annout{13};
 N_fix=annout{14};
 N_dep=annout{15};
 N_leached=annout{16};
 Fontsize=16;
 
  subplot(2,2,1);
  figNP=plot(sminn_npool);
   ylabel('Soil Mineral N to N pool [kgN/m^2/d]','FontSize',Fontsize);
 % title('Soil Mineral N to N pool [kgN/m^2/d]');
  set(figNP,...
 'LineStyle','-',...
 'MarkerSize',5,...
 'MarkerEdgeColor',[0.4 0.4 0],...
 'MarkerFaceColor',[0.4 0.4 0],...
 'LineWidth',1,...
 'Color',[0.2 0.5 0]);
 set(gca, 'FontSize',Fontsize,'FontWeight','bold','XTick',182:365:1460,'XTickLabel',['2008';'2009';'2010';'2011']);
 %set(gca, 'FontSize',Fontsize,'FontWeight','bold','XTick',182:365:1095,'XTickLabel',['2008';'2009';'2010']);

subplot(2,2,2);
  figNleach=plot(sminn_leached);
  %title('Soil Mineral N Leached [kgN/m^2/d]');
  set(figNleach,...
  'LineStyle','-',...
  'MarkerSize',5,...
  'MarkerEdgeColor',[0.4 0.4 0],...
  'MarkerFaceColor',[0.4 0.4 0],...
  'LineWidth',1,...
  'Color',[0.2 0.5 0]);
  grid;
  set(gca, 'FontSize',Fontsize,'FontWeight','bold','XTick',182:365:1460,'XTickLabel',['2008';'2009';'2010';'2011']);
  %set(gca, 'FontSize',Fontsize,'FontWeight','bold','XTick',182:365:1095,'XTickLabel',['2008';'2009';'2010']);
  ylabel('\bf{Soil Mineral N Leached [kgN/m^2/d]}','FontSize',Fontsize);

 subplot(2,2,3);
 figSminN=plot(SminN,'d');
%  title('Soil Mineral N [kgN/m^2]');
 set(figSminN,...
 'LineStyle','-',...
 'MarkerSize',5,...
 'MarkerEdgeColor',[0.4 0.4 0],...
 'MarkerFaceColor',[0.4 0.4 0],...
 'LineWidth',1,...
 'Color',[0.2 0.2 0]);
 set(gca, 'FontSize',Fontsize,'FontWeight','bold','XTick',1:4,'XTickLabel',['2008';'2009';'2010';'2011']);
 %set(gca, 'FontSize',Fontsize,'FontWeight','bold','XTick',1:3,'XTickLabel',['2008';'2009';'2010']);
 ylabel('\bf{Soil Mineral N [kgN/m^2]}','FontSize',Fontsize);

subplot(2,2,4);
figN_P=plot(N_leached,'o');
% title('N Pool [kgN/m^2]');
 set(figN_P,...
 'LineStyle','-',...
 'MarkerSize',5,...
 'MarkerEdgeColor',[0 0.3 0],...
 'MarkerFaceColor',[0.2 0.5 0],...
 'LineWidth',1,...
 'Color',[0 0.5 0]);
 set(gca, 'FontSize',Fontsize,'FontWeight','bold','XTick',1:4,'XTickLabel',['2008';'2009';'2010';'2011']);
 %set(gca, 'FontSize',Fontsize,'FontWeight','bold','XTick',1:3,'XTickLabel',['2008';'2009';'2010']);
  ylabel('\bf{N leached [kgN/m^2]}','FontSize',Fontsize);