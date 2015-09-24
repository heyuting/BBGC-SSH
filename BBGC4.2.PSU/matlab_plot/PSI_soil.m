clear all;
close all;
clc; 
Dir='/eddy/s0/users/yzh120/Research/BiomeBGC/GitHub/BBGC-SSH/BBGC4.2.PSU/Soilwater/';

 %load sc.annout.ascii
 fsoilw=fopen([Dir '2s3yr.txt']);
 VWC=textscan(fsoilw,repmat('%f',[1,2]),'HeaderLines',3);
 fclose(fsoilw);
%  VWC15=VWC{1}/100;
%  VWC51=VWC{2}/100;
%  VWC53=VWC{3}/100;
%  VWC60=VWC{4}/100;
 VWC61=VWC{1}/100;
 VWC74=VWC{2}/100;
[row, col]=size(VWC74);

 %plot soil water content
 subplot(2,1,1);
%  figS15=plot(VWC15);
  grid;

 %hold;
 figS74=plot(VWC74);
 
 title('Soil volumetric water content');
 axis([0 row 0 0.5])
 %legend();
 xlabel('days','FontSize',12,'FontWeight','bold');
 ylabel('Volumetric water content','FontSize',12,'FontWeight','bold');
%van Genutchen parameters
%site 15 - Valley - Ernest
%         Alpha = 0.046;
%         Beta = 1.28;
%         Theta_s = 0.583;
%         Theta_r = 0.049;
% %site 51 - Swale - Rushtown
%         Alpha = 0.1;
%         Beta = 1.37;
%         Theta_s = 0.326;
%         Theta_r = 0.02;
% % site 53 - Swale - Berks
%         Alpha = 0.068;
%         Beta = 1.44;
%         Theta_s = 0.293;
%         Theta_r = 0.015;
%site 60 - Planar - Weikert
%         Alpha =0.106;
%         Beta = 1.38;
%         Theta_s = 0.306;
%         Theta_r = 0.014;
%site 61 - Valley - Blairton
%       Alpha =0.03;
%       Beta = 1.35;
%       Theta_s = 0.384;
%       Theta_r = 0.028;
%  
%site 74 - Ridgetop - Weikert
      Alpha =0.095;
      Beta = 1.34;
      Theta_s =0.239;
      Theta_r = 0.005;

psi_open=-ones(row)*0.34;

%Calculate soil water potential
% if VWC15>Theta_s
%     VWC15((VWC15>Theta_s),1)=Theta_s;
% end
% psi_t1=((VWC15-Theta_r)/(Theta_s-Theta_r)).^(Beta/(1-Beta))-1;
% psi_t2=-(1/Alpha)*((psi_t1).^(1/Beta));
% psi=psi_t2*0.01*9.8*1000/1000000; %convert to Pa

% if VWC61>Theta_s
%     VWC61((VWC61>Theta_s),1)=Theta_s;
% end
% psi_t1=((VWC61-Theta_r)/(Theta_s-Theta_r)).^(Beta/(1-Beta))-1;
% psi_t2=-(1/Alpha)*((psi_t1).^(1/Beta));
% psi=psi_t2*0.01*9.8*1000/1000000; %convert to Pa

if VWC74>Theta_s
    VWC74((VWC74>Theta_s),1)=Theta_s;
end
psi_t1=((VWC74-Theta_r)/(Theta_s-Theta_r)).^(Beta/(1-Beta))-1;
psi_t2=-(1/Alpha)*((psi_t1).^(1/Beta));
psi=psi_t2*0.01*9.8*1000/1000000; %convert to Pa
%plot soil water potential

subplot(2,1,2);
k=1:row;
plot(k,psi);
axis([0 row -2.2 0]);
title('Soil water potential');
hold;
grid;
plot(psi_open);
 xlabel('days','FontSize',12,'FontWeight','bold');
 ylabel('Soil water potential [MPa]','FontSize',12,'FontWeight','bold');

