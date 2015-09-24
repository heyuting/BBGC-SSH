clear all, close all;
clc; 
Dir='/eddy/s0/users/yzh120/Research/BiomeBGC/GitHub/BBGC-SSH/BBGC4.2.PSU/';
%load sc.dayout.ascii

 fdayout=fopen([Dir 'outputs/sc.dayout.ascii']);
 dayout=textscan(fdayout,repmat('%f',[1,24]));
 fclose(fdayout);
 ALAImdl=dayout{1};
 dailyNPP=dayout{2};
 dailyNEE=dayout{3};
 dailyGPP=dayout{4};
 psn_sun_J=dayout{5};
 psn_sun_Av=dayout{6};
 psn_sun_Aj=dayout{7};
 assim_sun=dayout{8};
 assim_shade=dayout{9};
 cf_sun_cpool=dayout{10};
 cf_shade_cpool=dayout{11};
 dlmr_sun=dayout{12};
 dlmr_shade=dayout{13};
 psn_shade_Av=dayout{14};
 psn_shade_Aj=dayout{15};
 PLAIsun=dayout{16};
 PLAIshade=dayout{17};
 excessC=dayout{18};
 total_assimilation=dayout{19};
 soil_psi=dayout{20}*1000;
 soil_outflow_dummy=dayout{21};
 soil_outflow_model=dayout{22};
 model_soilwater=dayout{23};
 obs_soilwater=dayout{24};

 
 subplot(2,2,1);
 figQD=plot(soil_outflow_dummy);
 title('Soil Out Flow (~Obs) [kg/m^2/d]','FontSize',12,'FontWeight','bold');
 set(figQD,...
 'LineStyle','-',...
 'MarkerSize',5,...
 'MarkerEdgeColor',[0.4 0.4 0],...
 'MarkerFaceColor',[0.4 0.4 0],...
 'LineWidth',1,...
 'Color',[0.2 0.5 0]);
 grid;

 
  subplot(2,2,2);
  figQM=plot(soil_outflow_model);
  title('Soil Out Flow (Model) [kg/m^2/d]','FontSize',12,'FontWeight','bold');
  set(figQD,...
  'LineStyle','-',...
  'MarkerSize',5,...
  'MarkerEdgeColor',[0.4 0.4 0],...
  'MarkerFaceColor',[0.4 0.4 0],...
  'LineWidth',1,...
  'Color',[0.2 0.5 0]);
  grid;
  
  subplot(2,2,3);
 figm=plot(model_soilwater);
 title('soil water content [kg/m^2]','FontSize',12,'FontWeight','bold');
 set(figm,...
 'LineStyle','-',...
 'MarkerSize',5,...
 'MarkerEdgeColor',[0.4 0.4 0],...
 'MarkerFaceColor',[0.4 0.4 0],...
 'LineWidth',1,...
 'Color',[0.2 0.5 0]);
  grid;
  hold;
  figobs=plot(obs_soilwater);
  set(figobs,...
  'LineStyle','-',...
  'MarkerSize',5,...
  'MarkerEdgeColor',[0.4 0.4 0],...
  'MarkerFaceColor',[0.4 0.4 0],...
  'LineWidth',1,...
  'Color',[0.1 0.5 0.6]);
  legend('modeled soilwater','obs soilwater');
 

