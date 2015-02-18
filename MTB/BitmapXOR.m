function [ xorBm ] = BitmapXOR( bm1, bm2 )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BitmapXOR: XOR's the given two bitmaps
%   Argument: 
%       bm1 & bm2 - bitmaps of the two images
%   Return value:
%       xorBm - XOR'ed result between bm1 and bm2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%XOR'ing between the pixels
xorBm = bm1 ~= bm2;
