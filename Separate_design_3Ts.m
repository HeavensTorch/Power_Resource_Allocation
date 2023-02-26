Settings_3Ts;

% CVX
cvx_begin quiet                           
    variable p_ba(3,1)            
    minimize(one'*p_ba);            
    subject to
        p_ba(1,1) >= 0;
        p_ba(2,1) >= 0;
        p_ba(3,1) >= 0;
        g_1'*p_ba >= SINR*sigma^2;
        g_2'*p_ba >= SINR*sigma^2;
        g_3'*p_ba >= SINR*sigma^2;
cvx_end

% Separate_design
eta = max(b'*p_ba/(CRLB*p_ba'*A*p_ba),1);
p_wan = eta*p_ba;
p_W = sum(p_wan);
p = 10^(p_W/10-3);
disp('总发射功率为')
disp(p)