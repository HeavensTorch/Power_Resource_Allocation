SINR = -5:5:20;
SDR_005_2Ts = [4.2536,4.3441,5.0092,5.9605,8.8993,13.3972];
SDR_005_3Ts = [6.1002,6.1509,6.2997,6.9165,8.8423,15.6240];
SDR_003_2Ts = [10.2868,10.3057,11.1755,12.7620,17.4233,25.0349];
SDR_003_3Ts = [12.0143,12.1037,12.4179,13.4454,16.8968,29.9589];

figure(5);
plot(SINR,SDR_005_2Ts,'-^','color','#0072BD','Linewidth',2,'Markersize',10);
hold on;
plot(SINR,SDR_005_3Ts,'-.^','color','#D95319','Linewidth',2,'Markersize',10);
hold on;
plot(SINR,SDR_003_2Ts,'-v','color','#0072BD','Linewidth',2,'Markersize',10);
hold on;
plot(SINR,SDR_003_3Ts,'-.v','color','#D95319','Linewidth',2,'Markersize',10);
grid on;

xlabel('\fontname{Times}\fontsize{16}SINR constraint \Gamma (dB)');
ylabel('\fontname{Times}\fontsize{16}Total tranmit power (W)');
legend('\fontname{Times}\fontsize{16}SDR-based solution of 2 transmitters, \tau = 0.05',...
       '\fontname{Times}\fontsize{16}SDR-based solution of 3 transmitters, \tau = 0.05',...
       '\fontname{Times}\fontsize{16}SDR-based solution of 2 transmitters, \tau = 0.03',...
       '\fontname{Times}\fontsize{16}SDR-based solution of 3 transmitters, \tau = 0.03',...
       'Location','Northwest');
set(gca,'FontName','Times');
set(gca,'Fontsize',16);