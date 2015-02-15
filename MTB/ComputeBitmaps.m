function [ threshBitmap, exclBitmap ] = ComputeBitmaps( image, percentile )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

imgPercentile = prctile(image, percentile);
rowSize = size(image, 1);
colSize = size(image, 2);

threshBitMap = zeros(rowSize, colSize);

for row = 1:rowSize
    for col = 1:colSize
        pix = image(row, col);
        if pix > imgPercentile
            threshBitmap(row, col) = 1;
        else
            threshBitmap(row, col) = 0;
        end
    end
end

imwrite(threshBitmap, '/Users/cs/Documents/MATLAB/vision-hdr/MTB/threshBitmap.jpg');

end

