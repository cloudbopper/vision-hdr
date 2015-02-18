function [ O ] = reinhard( R )
%% implementation of Reinhard's tone mapping algorithm
%
% input: radiance map R = m x n x c matrix
% m = number of vertical pixels
% n = number of horizontal pixels
% c = number of channels (R,G,B)
%

[m, n, c] = size(R);
N = m*n;
% output image
O = zeros(m,n,c);
% delta: small value to avoid singularity if black pixels are present in
% the image
delta = 0.001;
deltaM = delta*ones(m,n);
% a: key value (key of the image after applying scaling)
a = 0.36;

for k=1:c
    % process each channel separately
    M = R(:,:,k);
    % compute log-average luminance
    l_wbar = exp(sum(sum(log(deltaM + M)))/N);
    % compute scaled luminance
    L = (a/l_wbar)*M;
    % compute maximum luminance
    l_white = max(max(L));
    % tonemapping operator
    L_d = L .* (1 + (L/l_white^2)) ./ (1 + L);
    O(:,:,k) = L_d;
end
