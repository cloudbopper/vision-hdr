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
[imgList, pixelVals] = readImagePixels(dir);

shiftBits = 6;
refImage = 1;
dir = strcat(dir, '/');

% Shifts without filter
shiftsNoFilter = findShifts(pixelVals, refImage, shiftBits, 0);
shiftedPixVals = ApplyShifts(shiftsNoFilter, pixelVals);
SaveImages(shiftedPixVals, dir, imgList);

end

