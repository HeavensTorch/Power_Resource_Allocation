Settings_2Ts;

% CVX
cvx_begin quiet                            
    variable Y_star(3,3) semidefinite              
    minimize([0,one']*Y_star*[0;one]);            
    subject to
        for i = 1:3
            Y_star*e(:,i) >= 0;          
            [-gama_wan,G]*Y_star*e(:,i) >= 0;                                                            
        end
        trace([0,b'/2;b/2,-CRLB*A]*Y_star) <= 0;            
        Y_star(1,1) == 1;      
cvx_end
rank_Y_star = rank(Y_star)
p_star = 10^(sqrt([0,one']*Y_star*[0;one])/10-3)

% % Gaussian Randomization
% P = Y_star(2:3,2:3);
% L = 100;                                    
% % EVD
% % [V,D] = eig(P);
% % [value,num] = max(diag(D));
% for i = 1:L
%     v = randn(2,1);
%     w = chol(P);
%     z = w'*v;
%     xi_star = max([SINR*sigma^2/(g_1'*z),SINR*sigma^2/(g_2'*z),b'*z/(CRLB*z'*A*z)]);
%     p = xi_star*one'*z;
%     if 10^(p/10) > 0 && 10^(p/10) < 100
%         break;
%     end
% end
%               
% p = 10^(p/10-3)
% diff = abs(p_star-p)