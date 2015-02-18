clear all;
file = dir('*.bmp');
for k=1:size(file,1)
im = imread(file(k).name);
img = imresize(im, 0.25);

imwrite(img, file(k).name);
end