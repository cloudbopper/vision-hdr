% HDR script

% clear all;
% close all;
clc;

tic;
%% load image metadata
% must be contained in a two-column file
% with filename in first column and shutter time in second
disp('Loading image list...');
% dir = strcat('data/1/');
dir = strcat('/Users/akshaysood/Box Sync/CS766/HDR/data/3/');
imlistfile = strcat(dir, '/image_list.txt');
imlist = importdata(imlistfile, ' ', 0);

image_names = imlist.textdata;
shutter_times = imlist.data;

% log of shutter times
B = log(shutter_times);
% lambda
l = 20;
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

%% build Z,M

% raw pixel data for all images
M = zeros(m,n,NC,P);

disp('Building Z...');
for i=1:P
    image_name = strcat(dir,image_names{i});
    A = imread(image_name);
    M(:,:,:,i) = A;
    for j=1:size(A,3)
        for k=1:N
            Z(k,i,j) = A(idx(k,1),idx(k,2),j);
        end
    end
end
disp('Done.');

%% run hdr algorithm
disp('Running HDR algorithm...');

gs = zeros(V,NC);
lEs = zeros(N,NC);
for i=1:NC
    gs(:,i) = debevec(Z(:,:,i),B,l,@(z)(128.5-abs(128.5-z)));
    % gs(:,i) = mitsunaga(Z(:,:,i),B,l,@(z)(128.5-abs(128.5-z)));
end
disp('Done.');

%% create radiance map from recovered g
disp('Creating radiance map...');
R = zeros(m,n,NC);
for k=1:NC
    g = gs(:,k);
    for x=1:m
        for y=1:n
            i = (x-1)*n+y;
            num = 0;
            den = 0;
            for j=1:P
                Zij = M(x,y,k,j) + 1;
                weight = 128.5-abs(128.5-Zij);
                num = num + weight*(g(Zij)-B(j));
                den = den + weight;
            end
            R(x,y,k) = num/den;
        end
    end
end
R = exp(R);
hdrwrite(R, 'result.hdr');
disp('Done.');

%% tonemapping
disp('Tonemapping...');
O = reinhard(R);
% O = tonemap(R);
disp('Done.');
imwrite(O,'result.png');

toc;