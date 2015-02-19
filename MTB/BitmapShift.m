function [ shiftedBm ] = BitmapShift( bm, x0, y0 )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BitmapShift: Shift the bitmap by (x0, y0)
%   Argument: 
%       bm - bitmaps of the image
%       x0 - x value of the shift
%       y0 - y value of the shift
%   Return value:
%       shiftedBm - shifted bitmap pixels
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     shiftedBm = imtranslate(bm, [x0, y0]);
end
