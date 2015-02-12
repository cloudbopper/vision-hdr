% gsolve.m
% Solve for imaging system response function
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
% lE(i)     : the log film irradiance at pixel location i 
%

function [g,lE] = gsolve(Z,B,l,w)

n = 256;
N = size(Z,1);
P = size(Z,2);

A = zeros(N*P+n+1,n+N);
b = zeros(size(A,1),1);

%% Data-fitting equations [w(Zij)*(g(Zij) - ln(Ei)) = w(Zij)*ln(deltatj)]

k = 1;
for i=1:N
    for j=1:P
        z = Z(i,j)+1;
        wij = w(z);
        A(k,z) = wij;
        A(k,n+i) = -wij;
        b(k) = wij * B(j);
        k = k+1;
    end
end

%% Constraint [g(Zmid) = 0]

A(k,n/2+1) = 1;
k=k+1;

%% Smoothness equations [g(z-1) - 2g(z) + g(z+1) = 0]
for i=1:n-2
    A(k,i) = l*w(i+1);
    A(k,i+1) = -2*l*w(i+1);
    A(k,i+2) = l*w(i+1);
    k = k+1;
end

%% Solve the system

x = A\b;

g = x(1:n);
lE = x(n+1:size(x,1));