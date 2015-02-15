function [ bmSum ] = BitmapTotal( bm )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BitmapTotal: Summing up values of the bitmap pixels
%   Argument: 
%       bm - bitmap of an image
%   Return value:
%       bmSum - sum of all 1 bits in the bitmap
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Summing up the pixels
bmSum = sum(bm(:));

end

