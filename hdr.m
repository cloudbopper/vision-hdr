% HDR script

clear all;
close all;
clc;

%% load image metadata
% must be contained in a two-column file
% with filename in first column and shutter time in second
disp('Loading image list...');
dir = 'data/1/';
imlistfile = strcat(dir, 'image_list.txt');
imlist = importdata(imlistfile, ' ', 0);

image_names = imlist.textdata;
shutter_times = imlist.data;

% log of shutter times
B = log(shutter_times);
% lambda
l = 0.5;
% number of sampled points
Nx = 10;
Ny = 10;
N = Nx*Ny;
% number of images
P = size(image_names,1);
% sampled pixel data for all channels
NC = 3;
Z = zeros(N,P,NC);
% number of values per pixel
V = 256;

disp('Done.');

%% decide points to sample
disp('Selecting sample points...');
image_name = strcat(dir,image_names{1});
A = imread(image_name);
m = size(A,1);
n = size(A,2);
idx = zeros(N,2);
for i=1:Nx
    x = floor(i*m/(Nx+1));
    for j=1:Ny
        y = floor(j*n/(Ny+1));
        k = (i-1)*Ny+j;
        idx(k,1) = x;
        idx(k,2) = y;
    end
end
disp('Done.');

%% build Z
disp('Building Z...');
for i=1:P
    image_name = strcat(dir,image_names{i});
    A = imread(image_name);
    for j=1:size(A,3)
        for k=1:N
            Z(k,i,j) = A(idx(k,1),idx(k,2),j);
        end
    end
end
disp('Done.');

%% run hdr optimization
disp('Running HDR optimization...');

% run HDR algorithm
gs = zeros(V,NC);
lEs = zeros(N,NC);
for i=1:NC
    [g, lE] = gsolve(Z(:,:,i),B,l,@w);
    gs(:,i) = g;
    lEs(:,i) = lE;
end

disp('Done.');