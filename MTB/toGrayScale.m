function [ grayScale ] = toGrayScale( imagePix )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%toGrayScale: Converts the given image pixel values to Gray Scale
%   Arguments: pixelVals of a given image read using readImagePixels.m
%   Return values:
%       grayScale - the pixel values of the given image in gray scale
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Determining size of the image
rowSize = size(imagePix, 2);
colSize = size(imagePix, 3);
%Init 
grayScale = zeros(rowSize, colSize);

for row = 1:rowSize
    for col = 1:colSize
        red = double(imagePix(1, row, col, 1));
        green = double(imagePix(1, row, col, 2));
        blue = double(imagePix(1, row, col, 3));
        %Converting to gray scale
        grayScale(row, col) = (54 * red + 183 * green + 19 * blue)/256;
    end
end

grayScale = uint8(grayScale);

%imshow(grayScale);
imwrite(grayScale, '/Users/cs/Documents/MATLAB/vision-hdr/MTB/outputImage.jpg');
end

