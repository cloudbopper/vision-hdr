function [ shifts ] = findShifts( pixelVals, refImage, shiftBits, filterFlag )
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here

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

