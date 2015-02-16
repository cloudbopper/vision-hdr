function [ output_args ] = MTBMain( dir )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[imgList, T, pixelVals] = readImagePixels(dir);
grayScale = toGrayScale(pixelVals(1,:,:,:));
[bm, em] = ComputeBitmaps(grayScale,50);
shiftedBm = BitmapShift(bm, 2, 50);
% shrunkImg = ImageShrink2(grayScale);
% ComputeBitmaps(grayScale,50,3);

%median_th_pixel=median(grayScale(:))

end

