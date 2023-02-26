x = -40:5:40;
SDR = [1.6064,3.9219,8.1241,14.0684,21.8172,30.0708,39.6311,46.7550,50.4205,46.5223,39.2963,30.0406,21.0288,13.8212,8.0922,3.9165,1.5881];
Sd = [1.8545,4.4816,9.0763,14.7689,24.1369,33.1410,41.6922,48.0348,50.4205,48.1024,41.7103,33.2495,24.1186,15.6001,9.0455,4.4772,1.8540];
CRLB = [1.8397,4.3411,8.5235,15.3545,23.9256,34.2152,43.3070,50.3192,50.4205,50.1100,43.1971,34.1809,23.9772,15.1093,8.5110,4.3233,1.8392];

figure(2);
plot(x,SDR,'-o','color','#0072BD','Linewidth',2,'Markersize',10);
hold on;
plot(x,Sd,'-s','color','#D95319','Linewidth',2,'Markersize',10);
hold on;
plot(x,CRLB,'-+','color','#EDB120','Linewidth',2,'Markersize',10);
grid on;

%title('\fontname{Times}\fontsize{14}\tau = 0.05 and \Gamma = 10dB');
xlabel('\fontname{Times}\fontsize{16}Target Location \itx \rm(m)');
ylabel('\fontname{Times}\fontsize{16}Total tranmit power (W)');
legend('\fontname{Times}\fontsize{16}SDR-based solution',...
       '\fontname{Times}\fontsize{16}Separate design',...
       '\fontname{Times}\fontsize{16}CRLB approximation');
set(gca,'FontName','Times');
set(gca,'Fontsize',16);