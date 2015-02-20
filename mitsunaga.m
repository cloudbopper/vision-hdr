%% Solve for imaging system response function using Mitsunaga's HDR 
%% algorithm
% given a set of pixel values observed for several pixels in several images
% with different exposure times, this function returns the imaging system?s
% response function g as well as the log film irradiance values for the 
% observed pixels.
%
% Assumes:
%
%  Zmin = 0
%  Zmax = 255
% 
% Arguments:
%
%  Z(i,j)   : the pixel values of pixel location number i in image j
%  B(j)     : the log delta t, or log shutter speed, for image j
%  l        : lamdba, the constant that determines the amount of smoothness 
%  w(z)     : weighting function value for pixel value z
%
% Returns:
%
% g(z)      : the log exposure corresponding to pixel value z
%

function g = mitsunaga(Z,B,l,w)

% normalize pixel values to [0,1]
M = Z/255;
% number of pixels
P = size(M,1);
% number of exposures
Q = size(M,2);
% max order
N = 10;
% stopping conditions
epsilon = 0.001;
max_iter = 1;
Imax = 100000;

% coefficients matrix
C = zeros(N,N+1);

% re-exponentiate B to get shutter time ratios
B = exp(B);

% re-order to ensure ratios are in increasing order
if (B(1)/B(2) > 1)
    B = fliplr(B')';
    M = fliplr(M);
end

min_error = Inf;
min_N = 0;

for i=1:N
    % ratio vector
    R = zeros(size(B,1)-1,1);
    for j=1:size(B,1)-1
        R(j) = B(j)/B(j+1);
    end
    % I matrix
    I = zeros(P,Q-1);
    I_last = zeros(P,Q-1);
    A = zeros(P*(Q-1)+1,i+1);
    b = zeros(size(A,1),1);
    b(end) = Imax;
    cs = zeros(i+1,1);
    for k=1:max_iter
        for p=1:P
            for q=1:Q-1
                j = (p-1)*(Q-1) + q;
                for n=0:i
                    A(j,n+1) = M(p,q)^n - R(q)*M(p,q+1)^n;
                end
            end
        end
        A(end,:) = ones(1,i+1);
        % compute coefficients by solving linear system
        cs = ridge(b,A,0.1);
        %cs = A\b;
        % recompute ratios
        for q=1:Q-1
            acc = 0;
            for p=1:P
                num = 0;
                den = 0;
                for n=0:i
                    num = num + cs(n+1)*M(p,q)^n;
                    den = den + cs(n+1)*M(p,q+1)^n;
                end
                acc = acc + num/den;
            end
            R(q) = acc;
        end
        % compute f for early stopping
        for p=1:P
            for q=1:Q-1
                acc = 0;
                for n=0:i
                    acc = acc + cs(n+1)*M(p,q)^n;
                end
                I(p,q) = acc;
            end
        end
        if max(I - I_last) < epsilon
            break;
        end
    end
    % compute error for final coefficients to decide N
    C(i,1:i+1) = cs;
    error = 0;
    for p=1:P
        for q=1:Q-1
            acc = 0;
            for n=0:i
                acc = acc + cs(n+1)*(M(p,q)^n - R(q)*M(p,q+1)^n);
            end
            error = error + acc^2;
        end
    end
    if min_error >= error
        min_error = error;
        min_N = i;
    end
end

% compute and return f
c = C(min_N,:);
n = 256;
g = zeros(n,1);
for j=0:n-1
    f = 0;
    for i=0:N
        f = f + c(i+1)*(j/(n-1))^i;
    end
    g(j+1) = f;
end

end