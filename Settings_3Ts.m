cc;

% Parameters
T = 10;
k = 5;
carrier_frequency = 6*(1e+9);
bandwidth = 1*(1e+6);
noise_power_spectrum_density = -174;
SINR = 5;
CRLB = 0.03;

% Position
ISAC_transmitter_1 = [-100,0];
ISAC_transmitter_2 = [100,0];
ISAC_transmitter_3 = [0,100];
CU_receiver_1 = [-80,20];
CU_receiver_2 = [80,20];
CU_receiver_3 = [0,80];
sensing_receiver_1 = [-100,50];
sensing_receiver_2 = [100,50];
target = [0,50];

% Channel
sigma = sqrt(noise_power_spectrum_density*bandwidth/2);
h = sqrt(k/(k+1))*ones(3,3).*exp(1i*2*pi*rand(3,3))+sqrt(1/(k+1))*sqrt(1/2)*(rand(3,3)+1i*rand(3,3));
h_1_1 = (norm(h(1,1)))^2;
h_1_2 = (norm(h(1,2)))^2;
h_1_3 = (norm(h(1,3)))^2;
h_2_1 = (norm(h(2,1)))^2;
h_2_2 = (norm(h(2,2)))^2;
h_2_3 = (norm(h(2,3)))^2;
h_3_1 = (norm(h(3,1)))^2;
h_3_2 = (norm(h(3,2)))^2;
h_3_3 = (norm(h(3,3)))^2;

% Radar
R_tx = [sqrt((ISAC_transmitter_1(1)-target(1))^2+(ISAC_transmitter_1(2)-target(2))^2),...
    sqrt((ISAC_transmitter_2(1)-target(1))^2+(ISAC_transmitter_2(2)-target(2))^2),...
    sqrt((ISAC_transmitter_3(1)-target(1))^2+(ISAC_transmitter_3(2)-target(2))^2)];
R_rx = [sqrt((sensing_receiver_1(1)-target(1))^2+(sensing_receiver_1(2)-target(2))^2),...
    sqrt((sensing_receiver_2(1)-target(1))^2+(sensing_receiver_2(2)-target(2))^2)];

% SDR
one = [1,1,1]';
e = eye(4);
g_1 = [h_1_1,-SINR*h_1_2,-SINR*h_1_3]';
g_2 = [-SINR*h_2_1,h_2_2,-SINR*h_1_3]';
g_3 = [-SINR*h_3_1,-SINR*h_3_2,h_3_3]';

G = [g_1,g_2,g_3]';
gama_wan = [SINR*sigma^2,SINR*sigma^2,SINR*sigma^2]';

xi = 8*pi^2*carrier_frequency*T/sigma^2;
g_a_1 = xi * h_1_1 * ((ISAC_transmitter_1(1))/R_tx(1)+(sensing_receiver_1(1))/R_rx(1))^2 + ...
        xi * h_2_1 * ((ISAC_transmitter_1(1))/R_tx(1)+(sensing_receiver_2(1))/R_rx(2))^2;

g_a_2 = xi * h_1_2 * ((ISAC_transmitter_2(1))/R_tx(2)+(sensing_receiver_1(1))/R_rx(1))^2 + ...
        xi * h_2_2 * ((ISAC_transmitter_2(1))/R_tx(2)+(sensing_receiver_2(1))/R_rx(2))^2;

g_a_3 = xi * h_1_3 * ((ISAC_transmitter_3(1))/R_tx(3)+(sensing_receiver_1(1))/R_rx(1))^2 + ...
        xi * h_2_3 * ((ISAC_transmitter_3(1))/R_tx(3)+(sensing_receiver_2(1))/R_rx(2))^2;

g_b_1 = xi * h_1_1 * ((ISAC_transmitter_1(2))/R_tx(1)+(sensing_receiver_1(2))/R_rx(1))^2 + ...
        xi * h_2_1 * ((ISAC_transmitter_1(2))/R_tx(1)+(sensing_receiver_2(2))/R_rx(2))^2;

g_b_2 = xi * h_1_2 * ((ISAC_transmitter_2(2))/R_tx(2)+(sensing_receiver_1(2))/R_rx(1))^2 + ...
        xi * h_2_2 * ((ISAC_transmitter_2(2))/R_tx(2)+(sensing_receiver_2(2))/R_rx(2))^2;

g_b_3 = xi * h_1_3 * ((ISAC_transmitter_3(2))/R_tx(2)+(sensing_receiver_1(2))/R_rx(1))^2 + ...
        xi * h_2_3 * ((ISAC_transmitter_3(2))/R_tx(2)+(sensing_receiver_2(2))/R_rx(2))^2;

g_c_1 = xi * h_1_1 * ((ISAC_transmitter_1(1))/R_tx(1)+(sensing_receiver_1(1))/R_rx(1)) * ...
                     ((ISAC_transmitter_1(2))/R_tx(1)+(sensing_receiver_1(2))/R_rx(1)) + ...
        xi * h_2_1 * ((ISAC_transmitter_1(1))/R_tx(1)+(sensing_receiver_2(1))/R_rx(2)) * ...
                     ((ISAC_transmitter_1(2))/R_tx(1)+(sensing_receiver_2(2))/R_rx(2));

g_c_2 = xi * h_1_2 * ((ISAC_transmitter_2(1))/R_tx(2)+(sensing_receiver_1(1))/R_rx(1)) * ...
                     ((ISAC_transmitter_2(2))/R_tx(2)+(sensing_receiver_1(2))/R_rx(1)) + ...
        xi * h_2_2 * ((ISAC_transmitter_2(1))/R_tx(2)+(sensing_receiver_2(1))/R_rx(2)) * ...
                     ((ISAC_transmitter_2(2))/R_tx(2)+(sensing_receiver_2(2))/R_rx(2));

g_c_3 = xi * h_1_3 * ((ISAC_transmitter_3(1))/R_tx(2)+(sensing_receiver_1(1))/R_rx(1)) * ...
                     ((ISAC_transmitter_3(2))/R_tx(2)+(sensing_receiver_1(2))/R_rx(1)) + ...
        xi * h_2_3 * ((ISAC_transmitter_3(1))/R_tx(2)+(sensing_receiver_2(1))/R_rx(2)) * ...
                     ((ISAC_transmitter_3(2))/R_tx(2)+(sensing_receiver_2(2))/R_rx(2));

g_a = [g_a_1,g_a_2,g_a_3]';
g_b = [g_b_1,g_b_2,g_b_3]';
g_c = [g_c_1,g_c_2,g_c_3]';
b = g_a+g_b;
A = g_a*g_b'-g_c*g_c';