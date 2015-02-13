function [ imgList, T, pixelVals ] = readImagePixels( dir )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%readImagePixels Reads the image files and shutter speed values
%   Arguments: absolute pathname of the directory containing image files
%   Return values:
%       imgList - list of image files in the directory
%       T - log of shutter times
%       pixelVals - 
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dir = strcat(dir, '/');
imgListFile = strcat(dir, 'image_list.txt');
metadata = importdata(imgListFile, ' ', 0);

imgList = metadata.textdata;
shutterTimes = metadata.data;

%Calculating log of shutter times
T = log(shutterTimes);

%Determining number of images
[imgCount, yDim] = size(imgList);

%Reading pixel values for each image
for i = 1:imgCount
    imgPath = strcat(dir, imgList{i});
    img = imread(imgPath);
    
    %Init during first image read
    if i == 1
        rowSize = size(img, 1);   
        colSize = size(img, 2);    
        pixelVals = zeros(i, rowSize, colSize,3);
    end

    pixelVals(i, :, :, :) = img;
end

end

