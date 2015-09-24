clear all, close all;
clc; 



%load sc.dayout.ascii
 fdayout=fopen('sc.dayout.ascii');
 dayout=textscan(fdayout,repmat('%f',[1,26]));
 fclose(fdayout);
 LAImdl=dayout{1};

 dailyNPP=dayout{20};
 dailyNEE=dayout{21};
 gl_wv_sun=dayout{23};
 gl_wv_shade=dayout{24};
 gl_s_sun=dayout{25};
 gl_s_shade=dayout{26};

 %load observed LAI
 fLAI=fopen('LAI/obsLAI.txt');
 LAIobs=textscan(fLAI,repmat('%f',[1,107]));
 fclose(fLAI);
 DOY=LAIobs{1};
 S60A=LAIobs{82};
 S60B=LAIobs{83};
 S60C=LAIobs{84};
 S60D=LAIobs{85};
 
 plot(LAImdl,':ko',...
    'MarkerEdgeColor',[0 0.5 0],... 
    'MarkerFaceColor',[1 1 0]);
 title('LAI','FontSize',12,'FontWeight','bold');
 set(gca,'xlim',[830,1030]);
 hold on;
 plot(DOY+730,S60A,'ks',...
    'MarkerEdgeColor',[0 0.3 0],... 
    'MarkerFaceColor',[0 0.4 0]);
 plot(DOY+730,S60B,'k^',...
    'MarkerEdgeColor',[0.8 0 0],... 
    'MarkerFaceColor',[0.8 0 0]);
plot(DOY+730,S60C,'kd',...
    'MarkerEdgeColor',[0 0 0.7],... 
    'MarkerFaceColor',[0 0 0.7]);
plot(DOY+730,S60D,'ko',...
    'MarkerEdgeColor',[0.5 0.5 0.5],... 
    'MarkerFaceColor',[0.5 0.5 0.5]);