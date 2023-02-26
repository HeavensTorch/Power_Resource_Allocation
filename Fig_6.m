SINR = -5:5:20;
Sd_005_2Ts = [6.7966,6.8403,7.2058,7.7532,9.8722,13.5869];
Sd_005_3Ts = [20.6412,20.5535,20.4112,19.9588,18.9409,18.0493];
Sd_003_2Ts = [15.5023,15.6072,15.9563,17.0212,20.2879,26.2520];
Sd_003_3Ts = [39.1015,39.0038,38.7024,37.8419,36.1572,33.9572];

figure(6);
plot(SINR,Sd_005_2Ts,'-^','color','#0072BD','Linewidth',2,'Markersize',10);
hold on;
plot(SINR,Sd_005_3Ts,'-.^','color','#D95319','Linewidth',2,'Markersize',10);
hold on;
plot(SINR,Sd_003_2Ts,'-v','color','#0072BD','Linewidth',2,'Markersize',10);
hold on;
plot(SINR,Sd_003_3Ts,'-.v','color','#D95319','Linewidth',2,'Markersize',10);
grid on;

xlabel('\fontname{Times}\fontsize{16}SINR constraint \Gamma (dB)');
ylabel('\fontname{Times}\fontsize{16}Total tranmit power (W)');
legend('\fontname{Times}\fontsize{16}Separate design of 2 transmitters, \tau = 0.05',...
       '\fontname{Times}\fontsize{16}Separate design of 3 transmitters, \tau = 0.05',...
       '\fontname{Times}\fontsize{16}Separate design of 2 transmitters, \tau = 0.03',...
       '\fontname{Times}\fontsize{16}Separate design of 3 transmitters, \tau = 0.03');
set(gca,'FontName','Times');
set(gca,'Fontsize',16);