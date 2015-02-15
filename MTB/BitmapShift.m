function [ shiftedBm ] = BitmapShift( bm, x0, y0 )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

rowSize = size(bm, 1);
colSize = size(bm, 2);
shiftedBm = zeros(rowSize, colSize);
for row = 1:rowSize
    for col = 1:colSize
        if(row + x <= rowSize && col + y <= colSize )
            shiftedBm(row + x0, col + y0) = bm(row, col);
        end
    end
end

end

