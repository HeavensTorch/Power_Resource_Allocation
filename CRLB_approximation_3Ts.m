Settings_3Ts;

% CVX
cvx_begin quiet                           
    variable p_star(3,1)            
    minimize(one'*p_star);            
    subject to
        p_star(1,1) >= 0;
        p_star(2,1) >= 0;
        p_star(3,1) >= 0;
        g_1'*p_star >= SINR*sigma^2;
        g_2'*p_star >= SINR*sigma^2;
        g_3'*p_star >= SINR*sigma^2;
        b-CRLB*A*p_star <= 0;
cvx_end

% CRLB_approximation
p0 = p_star;
CRLB0 = b'*p0/(p0'*A*p0);
if CRLB0 < CRLB
    disp('满足克拉美罗下界约束');
    p_W = sum(p0);
end
disp('总发射功率为');
p = 10^(p_W/10-3);
disp(p);