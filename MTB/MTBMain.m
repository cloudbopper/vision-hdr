function [ ] = MTBMain( dir )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MTBMain: Runs Ward's MTB algorithm and creates shifted images in the
%current directory
%   Argument: 
%       dir - absolute pathname of the directory containing image files
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

