CRLB = 0.03:0.006:0.06;
SDR_5 = [11.1755,8.4521,6.8077,5.8828,5.3175,5.0092];
Sd_5 = [15.9563,12.3103,10.1226,8.6642,7.7892,7.2058];
CRLB_5 = [11.3484,8.6559,7.0193,6.0162,5.3827,5.0131];
SDR_10 = [17.4233,13.8716,11.7406,10.3200,9.4676,8.8993];
Sd_10 = [20.2879,15.8612,13.1705,11.5214,10.4798,9.8722];
CRLB_10 = [18.4015,14.4072,11.9955,10.5636,9.8100,9.3578];

figure(3);
plot(CRLB,SDR_5,'-o','color','#0072BD','Linewidth',2,'Markersize',10);
hold on;
plot(CRLB,Sd_5,'-s','color','#D95319','Linewidth',2,'Markersize',10);
hold on;
plot(CRLB,CRLB_5,'-+','color','#EDB120','Linewidth',2,'Markersize',10);
hold on;
plot(CRLB,SDR_10,'-.o','color','#0072BD','Linewidth',2,'Markersize',10);
hold on;
plot(CRLB,Sd_10,'-.s','color','#D95319','Linewidth',2,'Markersize',10);
hold on;
plot(CRLB,CRLB_10,'-.+','color','#EDB120','Linewidth',2,'Markersize',10);
grid on;

xlabel('\fontname{Times}\fontsize{16}CRLB constraint \tau');
ylabel('\fontname{Times}\fontsize{16}Total tranmit power (W)');
legend('\fontname{Times}\fontsize{16}SDR-based solution, \Gamma = 5',...
       '\fontname{Times}\fontsize{16}Separate design, \Gamma = 5',...
       '\fontname{Times}\fontsize{16}CRLB approximation, \Gamma = 5',...
       '\fontname{Times}\fontsize{16}SDR-based solution, \Gamma = 10',...
       '\fontname{Times}\fontsize{16}Separate design, \Gamma = 10',...
       '\fontname{Times}\fontsize{16}CRLB approximation, \Gamma = 10',...
       'Location','northeast');
set(gca,'FontName','Times');
set(gca,'Fontsize',16);