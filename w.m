function [ o ] = w( z )
%
% Computes weight of pixel value z
%
% Assumes:
%
%  Zmin = 0
%  Zmax = 255
% 

Zmin = 0;
Zmax = 255;

Zmid = (Zmin + Zmax)/2;

if (z <= Zmid)
    o = z - Zmin;
else
    o = Zmax - z;
end

end

