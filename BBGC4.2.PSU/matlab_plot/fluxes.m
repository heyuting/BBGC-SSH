clear all, close all;
clc; 
Dir='/eddy/s0/users/yzh120/Research/BiomeBGC/GitHub/BBGC-SSH/BBGC4.2.PSU/';
%load sc.dayout.ascii

 fdayout=fopen([Dir 'outputs/sc.dayout.ascii']);
 dayout=textscan(fdayout,repmat('%f',[1,42]));
 fclose(fdayout);
 ALAImdl=dayout{1};
 dailyNPP=dayout{20};
 dailyNEE=dayout{21};
 dailyGPP=dayout{22};
 gl_wv_sun=dayout{23};
 gl_wv_shade=dayout{24};
 gl_s_sun=dayout{25};
 gl_s_shade=dayout{26};
 psn_sun_J=dayout{27};
 psn_sun_Av=dayout{28};
 psn_sun_Aj=dayout{29};
 assim_sun=dayout{30};
 assim_shade=dayout{31};
 cf_sun_cpool=dayout{32};
 cf_shade_cpool=dayout{33};
 dlmr_sun=dayout{34};
 dlmr_shade=dayout{35};
 psn_shade_Av=dayout{36};
 psn_shade_Aj=dayout{37};
 PLAIsun=dayout{38};
 PLAIshade=dayout{39};
 excessC=dayout{40};
 total_assimilation=dayout{41};
 soil_psi=dayout{42};
 
 fMeteo=fopen([Dir 'metdata/sc_74_8cm_Wsavg_61.txt']);
 MeteoData=textscan(fMeteo,repmat('%f', [1,11]),'HeaderLines',4);
 fclose(fMeteo);
 Ts=MeteoData{11};
 
 fLAI=fopen([Dir 'LAI/obsLAI.txt']);
 LAIobs=textscan(fLAI,repmat('%f',[1,107]),'delimiter',',');
 fclose(fLAI);
 
 DOY=LAIobs{1}+366;
 
 S50=LAIobs{59};
 
 S51A=LAIobs{61};
 S51B=LAIobs{62};
 S51C=LAIobs{63};
 S51D=LAIobs{64};
 S51=1/4*(S51A+S51B+S51C+S51D);
 S60A=LAIobs{82};
 S60B=LAIobs{83};
 S60C=LAIobs{84};
 S60D=LAIobs{85};
 S60=1/4*(S60A+S60B+S60C+S60D);
 S61A=LAIobs{87};
 S61B=LAIobs{88};
 S61C=LAIobs{89};
 S61D=LAIobs{90};
 S61=1/4*(S61A+S61B+S61C+S61D);
 S74A=LAIobs{104};
 S74B=LAIobs{105};
 S74C=LAIobs{106};
 S74D=LAIobs{107};
 S74=1/4*(S74A+S74B+S74C+S74D);
 
 [row,col]=size(dailyGPP);

 %%plot LAI 
 subplot(4,2,1);
 figLAIsun=plot(PLAIsun);
  set(figLAIsun,...
     'LineWidth',2.0,...
     'Color',[0 0.3 0]);
 hold;
 figLAIshade=plot(PLAIshade);
 set(figLAIshade,...
     'LineWidth',2.0,...
     'Color',[0.2 0.2 0]);
 
 figLAI=plot(PLAIsun+PLAIshade);
 set(figLAI,...
     'LineWidth',2.0,...
     'Color',[0 0.6 0]);
 title('LAI sun and shade [m2/m2]','FontSize',12,'FontWeight','bold');
 legend('sun','shade','LAIt','Location','Northeast');
 
 figLAI=plot(DOY,S60,'ko');
 title('LAI','FontSize',12,'FontWeight','bold');
 set(figLAI,...
     'LineWidth',1.0,...
     'Color',[0.2 0.4 0.2]);
 axis([0 row 0 10]);

 %%%plot daily GPP
 subplot(4,2,2);
%  subplot(2,1,2);
 figGPP=plot(dailyGPP,'k');
 title('dailyGPP [kgC/m^2/d] simulated from 2008 to 2010','FontSize',22,'FontWeight','bold');
 set(figGPP,...
     'LineStyle','-',...
     'LineWidth',2.0,...
     'Color',[0.2 0.5 0.2]);
 grid;
 set(gca,'FontSize',22,'FontWeight','bold','XTick',0:365:row);
 axis([0 row -0.01 0.03]);
 xlabel('days','FontSize',22,'FontWeight','bold');
 ylabel('daily GPP [kgC/m^2/d]','FontSize',22,'FontWeight','bold');
 hold;
 figNEE=plot(dailyNEE);
 set(figNEE,...
     'LineStyle','-.',...
     'LineWidth',1.0,...
     'Color',[0.6 0.1 0.1]);
figNPP=plot(dailyNPP);
 set(figNPP,...
     'LineWidth',1,...
     'Color',[0 0 0.5]);
 legend('GPP','NEP','NPP');
 %%%plot daily NEE
%  subplot(4,2,3);
%  figNEE=plot(dailyNEE, 'black');
%  title('dailyNEP, NPP [kgC/m2/d]','FontSize',12,'FontWeight','bold');
%  set(figNEE,...
%      'LineStyle','--',...
%      'LineWidth',1.0,...
%      'Color',[0.2 0.1 0.2]);
%  grid;
%  axis([0 row 0 0.015]);
%  hold;
 %%%plot daily NPP
%  figNPP=plot(dailyNPP);
%  set(figNPP,...
%      'LineWidth',1,...
%      'Color',[0 0.5 0]);
%  legend('NEP','NPP');
 %%%%plot excess C
 subplot(4,2,6);
 %%figExcessC=plot(excessC,'k');
 title('Potential and actual assimilated C [kgC/m2/d]','FontSize',12,'FontWeight','bold');
 grid;
 hold;
 plot(total_assimilation,'g');
 calc_gpp=total_assimilation-excessC;
 plot(calc_gpp,'r');
 legend('Potential A','Actual A','Location','North');
 axis([0 row 0 0.04]);
 %%%plot carbon flux to pools
 subplot(4,2,4);
 figcf_sun=plot(cf_sun_cpool);
 title('carbon fluxes [kgC/m2/d]','FontSize',12,'FontWeight','bold');
 set(figcf_sun,...
 'LineStyle','-',...
 'MarkerSize',5,...
 'MarkerEdgeColor',[0.4 0.4 0],...
 'MarkerFaceColor',[0.4 0.4 0],...
 'LineWidth',1,...
 'Color',[0.2 0.5 0]);
 hold;
 grid;
 axis([0 row 0 0.06]);
 figcf_shade=plot(cf_shade_cpool);
 set(figcf_shade,...
 'LineStyle','-',...
 'MarkerSize',5,...
 'MarkerEdgeColor',[0.4 0.4 0],...
 'MarkerFaceColor',[0.4 0.4 0],...
 'LineWidth',1,...
 'Color',[0.2 0.2 0]);
 figcft=plot(cf_sun_cpool+cf_shade_cpool);
 legend('Sun CF','Shade CF','TotalCF','Location','North');

 %%plot sun_Av
 subplot(4,2,7);
 figAvsun=plot(psn_sun_Av);
 title('sun Av Aj [umol/m2/s]','FontSize',12,'FontWeight','bold');
 set(figAvsun,...
 'LineStyle','-',...
 'MarkerSize',5,...
 'MarkerEdgeColor',[0 0.3 0],...
 'MarkerFaceColor',[0 0.4 0],...
 'LineWidth',2,...
 'Color',[0.1 0.1 0.1]);
  hold;
  grid;
  axis([0 row 0 30]);
  figSunAjsun=plot(psn_sun_Aj);
  set(figSunAjsun,...
 'LineStyle','-',...
 'MarkerSize',5,...
 'MarkerEdgeColor',[0.4 0.4 0],...
 'MarkerFaceColor',[0.4 0.4 0],...
 'LineWidth',1.5,...
 'Color',[0.7 0.6 0]);
 legend('Av','Aj','Location','North');
 
 subplot(4,2,3);
 figAvshade=plot(psn_shade_Av);
 title('shade Av Aj [umol/m2/s]','FontSize',12,'FontWeight','bold');
 set(figAvshade,...
 'LineStyle','-',...
 'MarkerSize',5,...
 'MarkerEdgeColor',[0 0.3 0],...
 'MarkerFaceColor',[0 0.4 0],...
 'LineWidth',2,...
 'Color',[0.1 0.1 0.1]);
  hold;
  grid;
  axis([0 row 0 20]);
  figSunAjshade=plot(psn_shade_Aj);
  set(figSunAjshade,...
 'LineStyle','-',...
 'MarkerSize',5,...
 'MarkerEdgeColor',[0.4 0.4 0],...
 'MarkerFaceColor',[0.4 0.4 0],...
 'LineWidth',1.5,...
 'Color',[0.7 0.6 0]);
 legend('Av','Aj','Location','North');

%%%plot assim_sun & assim_shade
 figAsun=plot(assim_sun);
 title('sun and shade leaves Assimilation [umol/m2/s]','FontSize',12,'FontWeight','bold');
 set(figAsun,...
 'LineStyle','-',...
 'MarkerSize',5,...
 'MarkerEdgeColor',[0.4 0.4 0],...
 'MarkerFaceColor',[0.4 0.4 0],...
 'LineWidth',1,...
 'Color',[0.2 0.5 0]);
 hold;
 grid;
 axis([0 row 0 40]);
 figAshade=plot(assim_shade);
 set(figAshade,...
 'LineStyle','-',...
 'MarkerSize',5,...
 'MarkerEdgeColor',[0.4 0.4 0],...
 'MarkerFaceColor',[0.4 0.4 0],...
 'LineWidth',1,...
 'Color',[0.2 0.2 0]);
 figAt=plot(assim_sun+assim_shade);
 legend('Sun A','Shade A','Total A','Location','North');

 %%%%plot soil psi
 subplot(4,2,5);
%  subplot(2,1,1);
 psi_open=-ones(row)*0.34;
 figsoil_psi=plot(soil_psi);
 title('Soil PSI [MPa]','FontSize',22,'FontWeight','bold');
 set(figsoil_psi,...
 'LineStyle','-',...
  'LineWidth',2);
  grid;
  hold;
  plot(psi_open);
%%%%plot soil T
%  figTs=plot(Ts,'r');
%  title('Observed Soil Temperature [^oC] from 2008 to 2010','FontSize',22,'FontWeight','bold');
%   axis([0 row -2 25]);
%   set(gca,'FontSize',22,'FontWeight','bold','XTick',0:365:row);
%   set(figTs,...
%  'LineStyle','-',...
%   'LineWidth',2);
%   grid;
%   xlabel('days','FontSize',22,'FontWeight','bold');
%   ylabel('Soil Temperature [^oC]','FontSize',22,'FontWeight','bold');

 %%%plot maintenance respiration
 subplot(4,2,8);
 figMRsun=plot(dlmr_sun);
 title('Maintentance Respiration [umol/m2/s]','FontSize',12,'FontWeight','bold');
 set(figMRsun,...
 'LineStyle','-',...
 'MarkerSize',5,...
 'MarkerEdgeColor',[0.4 0.4 0],...
 'MarkerFaceColor',[0.4 0.4 0],...
 'LineWidth',1,...
 'Color',[0.2 0.5 0]);
 hold;
 grid;
 axis([0 row 0 4]);
 figMRshade=plot(dlmr_shade);
 set(figMRshade,...
 'LineStyle','-',...
 'MarkerSize',5,...
 'MarkerEdgeColor',[0.4 0.4 0],...
 'MarkerFaceColor',[0.4 0.4 0],...
 'LineWidth',1,...
 'Color',[0.2 0.2 0]);
 figMRt=plot(dlmr_shade+dlmr_sun);
 legend('MR sun','MRshade','MRt','Location','North');
 