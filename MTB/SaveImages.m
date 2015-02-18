function [ output_args ] = SaveImages( shiftedPixelVals )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

numPhotos = size(shiftedPixelVals, 1);
rowSize = size(shiftedPixelVals, 2);
colSize = size(shiftedPixelVals, 3);
%image = zeros(rowSize, colSize);

for i = 1:numPhotos
    image = shiftedPixelVals(i, :, :, :);
    fileName = sprintf('/Users/cs/Documents/MATLAB/vision-hdr/MTB/img%d.jpg', i);
    imwrite(image, fileName);
end

end

