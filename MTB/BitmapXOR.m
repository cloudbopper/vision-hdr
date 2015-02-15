function [ output_args ] = BitmapXOR( bm1, bm2 )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

rowSize = size(bm1, 1);
colSize = size(bm1, 2);
xorBm = zeros(rowSize, colSize);

for row = 1:rowSize
    for col = 1:colSize
        pixBm1 = bm1(row, col);
        pixBm2 = bm1(row, col);
        if(pixBm1 == pixBm2)
            xorBm = 0;
        else
            xorBm = 1;
    end
end

end

