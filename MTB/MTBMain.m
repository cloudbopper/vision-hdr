function [ output_args ] = MTBMain( dir )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%findShifts: Determine shift values for all the images
%   Argument: 
%       pixelVals - pixel values for all the images
%       refImage - index of the base reference image to which other images
%       will be aligned
%       shiftBits - maximum number of bits in the final offsets
%       filterFlag - flag whether to use edge filtering or not
%   Return value:
%       shifts - x and y shift values for all the images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Read the required images
[imgList, T, pixelVals] = readImagePixels(dir);

%Just trying out!
shiftBits = 6;
refImage = 1;

% 
% %Compute shifts without filter
shiftsNoFilter = findShifts(pixelVals, refImage, shiftBits, 0)
shiftedPixVals = ApplyShifts(shiftsNoFilter, pixelVals);
SaveImages(shiftedPixVals);

% %Compute shifts with filter
% shiftsWithFilter = findShifts(pixelVals, refImage, shiftBits, 1);

% grayScale = toGrayScale(pixelVals(1,:,:,:));
% [bm, em] = ComputeBitmaps(grayScale,50);
% shiftedBm = BitmapShift(bm, 2, 50);
% BitmapXOR(bm, bm);
% shrunkImg = ImageShrink2(grayScale);
% ComputeBitmaps(grayScale,50,3);

%median_th_pixel=median(grayScale(:))

end

