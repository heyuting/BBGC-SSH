clear all, close all, clc;
 %load sc.dayout.ascii
 [LAI,C_CL,C_CLS,C_frC,C_frCS,C_lsC,C_lsCS,C_dsC,C_dsCS,C_lcrC,C_lcrCS,C_dcrC,C_dcrCS,LCT_LC,frCT_frC,lsCT_lsC,dsCT_dsC,lcrCT_lcrC,dcrCT_dcrC,dNPP,dNEE,dGPP]=...
 textread('sc.dayout.ascii','%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f');
 dailydat=[LAI,C_CL,C_CLS,C_frC,C_frCS,C_lsC,C_lsCS,C_dsC,C_dsCS,C_lcrC,C_lcrCS,C_dcrC,C_dcrCS,LCT_LC,frCT_frC,lsCT_lsC,dsCT_dsC,lcrCT_lcrC,dcrCT_dcrC,dNPP,dNEE,dGPP];
 %[row, col]=size(dat);
 

 %plot
 %hold on;
 subplot(2,2,1)
 plot(dailydat(:,1))
 title('LAI')
 
 subplot(2,2,2)
 plot(dailydat(:,20))
 title('NPP')
 
 subplot(2,2,3)
 plot(dailydat(:,14))
 title('leafC(Transfer) to leafC')
 
 subplot(2,2,4)
 plot(dailydat(:,21))
 title('NEE')
 
 