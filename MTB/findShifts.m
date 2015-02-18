function [ shifts ] = findShifts( pixelVals, refImage, shiftBits, filterFlag )

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

numPhotos = size(pixelVals, 1);
shifts = zeros(numPhotos, 2);

for i = 1:refImage
    %Until a pair of images can be processed
    if i + 1 <= refImage
        %Reference image is to the right
        image1 = toGrayScale(pixelVals(i + 1, :, :, :));
        %To be shifted image
        image2 = toGrayScale(pixelVals(i, :, :, :));
        if (filterFlag == 1)
            h = fspecial('sobel');
            %h = fspecial('prewitt');
            image1 = imfilter(image1, h);
            image2 = imfilter(image2, h);
        end
        shiftRet = GetExpShift(image1, image2, shiftBits);
        shifts(i, :) = shiftRet;
    end
end

for i = refImage:numPhotos
    %Until a pair of images can be processed
    if i + 1 <= numPhotos
        %Reference image is to the left
        image1 = toGrayScale(pixelVals(i, :, :, :));
        %To be shifted image
        image2 = toGrayScale(pixelVals(i + 1, :, :, :));
        if (filterFlag == 1)
            h = fspecial('sobel');
            %h = fspecial('prewitt');
            image1 = imfilter(image1, h);
            image2 = imfilter(image2, h);
        end
        shiftRet = GetExpShift(image1, image2, shiftBits);
        shifts(i + 1, :) = shiftRet;
    end
end

end

