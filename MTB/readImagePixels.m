function [ imgList, B, pixelVals ] = readImagePixels( dir )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%readImagePixels Reads the image files and shutter speed values
%   Argument: 
%       dir - absolute pathname of the directory containing image files
%   Return values:
%       imgList - list of image files in the directory
%       B - log of shutter times
%       pixelVals - stores the pixel values for all the images in the given
%                   directory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dir = strcat(dir, '/');
imgListFile = strcat(dir, 'image_list.txt');
metadata = importdata(imgListFile, ' ', 0);

imgList = metadata.textdata
shutterTimes = metadata.data;

%Calculating log of shutter times
B = log(shutterTimes);

%Determining number of images
[imgCount, yDim] = size(imgList);

%RGB dimensions
rgb = 3;

%Reading pixel values for each image
for i = 1:imgCount
    imgPath = strcat(dir, imgList{i});
    img = imread(imgPath);
    
    %Init during first image read
    if i == 1
        rowSize = size(img, 1);   
        colSize = size(img, 2);    
        pixelVals = zeros(i, rowSize, colSize, rgb);
    end

    pixelVals(i, :, :, :) = img;
end

%pixelVals = uint8(pixelVals);

end

