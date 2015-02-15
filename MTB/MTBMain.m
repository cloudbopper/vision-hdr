function [ output_args ] = MTBMain( dir )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[imgList, T, pixelVals] = readImagePixels(dir);
grayScale = toGrayScale(pixelVals(1,:,:,:));
shrunkImg = ImageShrink2(grayScale);
ComputeBitmaps(grayScale,50);

end

