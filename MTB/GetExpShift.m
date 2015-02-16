function [ shiftRet ] = GetExpShift( image1, image2, shiftBits, tolerance )
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

rowSize = size(image1, 1);
colSize = size(image1, 2);

shiftRet = [0 0];
cur_shift = [0 0];

if shiftBits > 0
    shrunkImg1 = ImageShrink2(image1);
    shrunkImg2 = ImageShrink2(image2);
    cur_shift = GetExpShift(shrunkImg1, shrunkImg2, shiftBits - 1, tolerance);
    cur_shift(1) = cur_shift(1) * 2;
    cur_shift(2) = cur_shift(2) * 2;
else
    cur_shift(1) = 0;
    cur_shift(2) = 0;
end

percentile = findPercentile(image1, image2);
[tbm1, ebm1] = ComputeBitmaps(image1, percentile, tolerance);
[tbm2, ebm2] = ComputeBitmaps(image2, percentile, tolerance);
min_err = rowSize * colSize;
for i = -1:1
    for j = -1:1
        xs = cur_shift(1) + i;
        ys = cur_shift(2) + j;
        shiftedtbm2 = BitmapShift(tbm2, xs, ys);
        shiftedebm2 = BitmapShift(ebm2, xs, ys);
        diff_b = BitmapXOR(tbm1, shiftedtbm2);
        diff_b = BitmapAND(diff_b, ebm1);
        diff_b = BitmapAND(diff_b, shiftedebm2);
        err = BitmapTotal(diff_b);
        if err < min_err
            shiftRet(1) = cur_shift(1) + i;
            shiftRet(2) = cur_shift(2) + j;
            min_err = err;
        end
    end
end

end

