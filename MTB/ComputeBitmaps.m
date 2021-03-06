function [ threshBitmap, exclBitmap ] = ComputeBitmaps( image, percentile )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ComputeBitmaps: Computing the bitmap and the exlusion bitmap
%   Argument: 
%       image - pixel values of the image which is to be processed
%       percentile - percentile value for creating the bitmap
%       tolerance - tolerance value for exclusion bitmap
%   Return value:
%       threshBitmap - pixel values of the bitmap
%       exclBitmap - pixel values of the exclusion bitmap
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Tolerance value
tolerance = 0.5;

imgPercentile = prctile(image(:), percentile);
rowSize = size(image, 1);
colSize = size(image, 2);

%Computing bitmap
threshBitmap = image > imgPercentile;

exclBitmap = zeros(rowSize, colSize);


for row = 1:rowSize
    for col = 1:colSize
        pix = image(row, col);
        %Computing exclusion bitmap
        if(pix < (imgPercentile - tolerance) || pix > (imgPercentile + tolerance))
            exclBitmap(row, col) = 1;
        else
            exclBitmap(row, col) = 0;
        end
    end
end

imwrite(threshBitmap, '/Users/cs/Documents/MATLAB/vision-hdr/MTB/threshBitmap.jpg');
imwrite(exclBitmap, '/Users/cs/Documents/MATLAB/vision-hdr/MTB/exclusionBitmap.jpg');

end

