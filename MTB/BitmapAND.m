function [ andBm ] = BitmapAND( bm1, bm2 )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BitmapAND: AND's the given two bitmaps
%   Argument: 
%       bm1 & bm2 - bitmaps of the two images
%   Return value:
%       xorBm - AND'ed result between bm1 and bm2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rowSize = size(bm1, 1);
colSize = size(bm1, 2);
andBm = zeros(rowSize, colSize);

for row = 1:rowSize
    for col = 1:colSize
        pixBm1 = bm1(row, col);
        pixBm2 = bm2(row, col);
        %AND'ing between the pixels
        if(pixBm1 == 1 && pixBm2 == 1)
            andBm(row, col) = 1;
        else
            andBm(row, col) = 0;
        end
    end
end

end

