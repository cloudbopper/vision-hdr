function [ shiftedPixelVals ] = ApplyShifts( shifts, pixelVals )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BitmapShift: Shift all images on pixelVals by the calculated shifts
%   Argument: 
%       shifts - shifts for individual images with respect to reference
%       image
%       pixelVals - pixel values for the original images
%   Return value:
%       shiftedPixelVals - shifted image pixels
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Total number of images
numPhotos = size(pixelVals, 1);

for i = 1:numPhotos
    xShift = shifts(i, 1);
    yShift = shifts(i, 2);
    tform = affine2d([1 0 0; 0 1 0; xShift yShift 1]);
    shiftedPixelVals(i,:,:,:)=imtranslate(squeeze(pixelVals(i, :, :, :)),[xShift yShift]);
end

end

