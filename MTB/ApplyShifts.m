function [ shiftedPixelVals ] = ApplyShifts( shifts, pixelVals )

%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

numPhotos = size(pixelVals, 1);
rowSize = size(pixelVals, 2);
colSize = size(pixelVals, 3);

%RGB dimensions
rgb = 3;
shiftedPixelVals = zeros(numPhotos, rowSize, colSize, rgb);

for i = 1:numPhotos
    xShift = shifts(i, 1);
    yShift = shifts(i, 2);
    for row = 1:colSize
        for col = 1:colSize
            
        end
    end
end

end

