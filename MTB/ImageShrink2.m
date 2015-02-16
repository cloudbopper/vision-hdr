function [ shrunkImg ] = ImageShrink2( image )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ImageShrink2: Shrinks the given image by a scale of 1/2
%   Argument: 
%       image - pixel values of some gray scale image
%   Return value:
%       shrunkImg - pixel values of the image shrunk to half size
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Shrinking image by half of its current size
shrunkImg = imresize(image, 'Scale', 0.5, 'Method', 'bicubic');

%imwrite(shrunkImg, '/Users/cs/Documents/MATLAB/vision-hdr/MTB/shrunkImage.jpg');

end

