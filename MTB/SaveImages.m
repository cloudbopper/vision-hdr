function [ output_args ] = SaveImages( shiftedPixelVals, dir, imgList )

%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

numPhotos = size(shiftedPixelVals, 1);
rowSize = size(shiftedPixelVals, 2);
colSize = size(shiftedPixelVals, 3);
%image = zeros(rowSize, colSize);

for i = 1:numPhotos
    %image = shiftedPixelVals(i, :, :, :);
    name = imgList(i);
    image = squeeze(shiftedPixelVals(i, :, :, :));
    fileName = sprintf('shiftedImg%d.jpg', i);
%     name_new = strrep(name, '.bmp', '')
%     name = strcat(name_new, '_new.jpg')
%     fileName = strcat(dir, name);
    imwrite(image, fileName);
end
% 
% end

