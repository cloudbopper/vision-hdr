function [ xorBm ] = BitmapXOR( bm1, bm2 )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BitmapXOR: XOR's the given two bitmaps
%   Argument: 
%       bm1 & bm2 - bitmaps of the two images
%   Return value:
%       xorBm - XOR'ed result between bm1 and bm2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rowSize = size(bm1, 1);
colSize = size(bm1, 2);
xorBm = zeros(rowSize, colSize);

for row = 1:rowSize
    for col = 1:colSize
        pixBm1 = bm1(row, col);
        pixBm2 = bm2(row, col);
        %XOR'ing between the pixels
        if(pixBm1 == pixBm2)
            xorBm(row, col) = 0;
        else
            xorBm(row, col) = 1;
        end
    end
end

end

