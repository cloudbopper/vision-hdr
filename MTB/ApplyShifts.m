function [ shiftedPixelVals ] = ApplyShifts( shifts, pixelVals )

%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

numPhotos = size(pixelVals, 1);
rowSize = size(pixelVals, 2);
colSize = size(pixelVals, 3);

%RGB dimensions
rgb = 3;
%shiftedPixelVals = zeros(numPhotos, rowSize, colSize, rgb);

for i = 1:numPhotos
    xShift = shifts(i, 1);
    yShift = shifts(i, 2);
    for row = 1:colSize
        for col = 1:colSize
%             if(row + yShift <= rowSize && col + xShift <= colSize && row + yShift > 0 && col + xShift > 0)
%                 shiftedPixelVals(i, row + yShift, col + xShift, :) = pixelVals(i, row, col, :);
            if(row + xShift <= rowSize && col + yShift <= colSize && row + xShift > 0 && col + yShift > 0)
                shiftedPixelVals(i, row + xShift, col + yShift, :) = pixelVals(i, row, col, :);
            end
        end
    end
end

end

