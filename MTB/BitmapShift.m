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

rowSize = size(bm, 1);
colSize = size(bm, 2);
shiftedBm = zeros(rowSize, colSize);

for row = 1:rowSize
    for col = 1:colSize
        %Shifting the bitmap as long as it is within the image size
        if row + x0 <= rowSize && col + y0 <= colSize
            shiftedBm(row + x0, col + y0) = bm(row, col);
        end
    end
end

imwrite(shiftedBm, '/Users/cs/Documents/MATLAB/vision-hdr/MTB/shiftedBm.jpg');

end

