SINR = -5:5:20;
SDR_005 = [4.2536,4.3441,5.0092,5.9605,8.8993,13.3972];
Sd_005 = [6.7966,6.8403,7.2058,7.7532,9.8722,13.5869];
CRLB_005 = [4.3816,4.5255,5.0131,6.3876,9.3578,14.1424];
SDR_003 = [10.2868,10.3057,11.1755,12.7620,17.4233,25.0349];
Sd_003 = [15.5023,15.6072,15.9563,17.0212,20.2879,26.2520];
CRLB_003 = [10.3136,10.6277,11.3484,13.4926,18.4015,26.7533];

figure(1);
plot(SINR,SDR_005,'-o','color','#0072BD','Linewidth',2,'Markersize',10);
hold on;
plot(SINR,Sd_005,'-s','color','#A2142F','Linewidth',2,'Markersize',10);
hold on;
plot(SINR,CRLB_005,'-+','color','#EDB120','Linewidth',2,'Markersize',10);
hold on;
plot(SINR,SDR_003,'-.o','color','#0072BD','Linewidth',2,'Markersize',10);
hold on;
plot(SINR,Sd_003,'-.s','color','#A2142F','Linewidth',2,'Markersize',10);
hold on;
plot(SINR,CRLB_003,'-.+','color','#EDB120','Linewidth',2,'Markersize',10);
grid on;

xlabel('\fontname{Times}\fontsize{16}SINR constraint \Gamma (dB)');
ylabel('\fontname{Times}\fontsize{16}Total tranmit power (W)');
legend('\fontname{Times}\fontsize{16}SDR-based solution, \tau = 0.05',...
       '\fontname{Times}\fontsize{16}Separate design, \tau = 0.05',...
       '\fontname{Times}\fontsize{16}CRLB approximation, \tau = 0.05',...
       '\fontname{Times}\fontsize{16}SDR-based solution, \tau = 0.03',...
       '\fontname{Times}\fontsize{16}Separate design, \tau = 0.03',...
       '\fontname{Times}\fontsize{16}CRLB approximation, \tau = 0.03',...
       'Location','northwest');
set(gca,'FontName','Times');
set(gca,'Fontsize',16);