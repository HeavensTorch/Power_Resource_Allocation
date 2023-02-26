SINR = -5:5:20;
CRLB_005_2Ts = [4.3816,4.5255,5.0131,6.3876,9.3578,14.1424];
CRLB_005_3Ts = [5.9439,6.0104,6.4702,7.0226,9.6033,20.2615];
CRLB_003_2Ts = [10.3136,10.6277,11.3484,13.4926,18.4015,26.7533];
CRLB_003_3Ts = [11.8587,11.9558,12.4007,13.7092,18.2580,38.5528];

figure(7);
plot(SINR,CRLB_005_2Ts,'-^','color','#0072BD','Linewidth',2,'Markersize',10);
hold on;
plot(SINR,CRLB_005_3Ts,'-.^','color','#D95319','Linewidth',2,'Markersize',10);
hold on;
plot(SINR,CRLB_003_2Ts,'-v','color','#0072BD','Linewidth',2,'Markersize',10);
hold on;
plot(SINR,CRLB_003_3Ts,'-.v','color','#D95319','Linewidth',2,'Markersize',10);
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