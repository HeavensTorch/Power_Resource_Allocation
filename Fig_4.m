SINR = -5:5:20;
SDR_005 = [6.1002,6.1509,6.2997,6.9165,8.8423,15.6240];
Sd_005 = [20.6412,20.5535,20.4112,19.9588,18.9409,18.0493];
CRLB_005 = [5.9439,6.0104,6.4702,7.0226,9.6033,20.2615];
SDR_003 = [12.0143,12.1037,12.4179,13.4454,16.8968,29.9589];
Sd_003 = [39.1015,39.0038,38.7024,37.8419,36.1572,33.9572];
CRLB_003 = [11.8587,11.9558,12.4007,13.7092,18.2580,38.5528];

figure(4);
plot(SINR,SDR_005,'-o','color','#0072BD','Linewidth',2,'Markersize',10);
hold on;
plot(SINR,Sd_005,'-s','color','#D95319','Linewidth',2,'Markersize',10);
hold on;
plot(SINR,CRLB_005,'-+','color','#EDB120','Linewidth',2,'Markersize',10);
hold on;
plot(SINR,SDR_003,'-.o','color','#0072BD','Linewidth',2,'Markersize',10);
hold on;
plot(SINR,Sd_003,'-.s','color','#D95319','Linewidth',2,'Markersize',10);
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
       '\fontname{Times}\fontsize{16}CRLB approximation, \tau = 0.03');
set(gca,'FontName','Times');
set(gca,'Fontsize',16);