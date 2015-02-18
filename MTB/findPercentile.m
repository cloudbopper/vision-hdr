function [ percentile ] = findPercentile( image1, image2 )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%findPercentile: Compares image intensities to determine required
%percentile level for bitmap generation
%   Argument: 
%       image1 & image2 - pixels of the exposure pair images
%   Return value:
%       percentile - percentile to use while generating bitmaps for the
%                    given images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


rowSize = size(image1, 1);
colSize = size(image1, 2);
pixMaxVal = 255;

%Total number of possible pixels in the given exposure pair
totalPix = rowSize * colSize * 2;
%Summing up intensities of the exposure pair for comparison with a 25% to
%75% thresholds
totalSum = sum(image1(:)) + sum(image2(:));

maxBright = totalPix * pixMaxVal * 0.75;
maxDark = totalPix * pixMaxVal * 0.25;

%For too bright images choosing 17th percentile and for too dark images
%83rd percentile and 50th percentile for the regular images
if totalSum >= maxBright
    %percentile = 17;
    percentile = 50;
elseif totalSum <= maxDark
    percentile = 83;
else
    percentile = 50;
end

end

