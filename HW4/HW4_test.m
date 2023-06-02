close all
clear
%% read image and define n
n=4;
img = imread('nature.jpg');
figure;
imshow(img),title('original image');
%% define filter
filter_bic = 1/64*[1 4 6 4 1;4 16 24 16 4;6 24 36 24 6;4 16 24 16 4;1 4 6 4 1];% bicubic  filter
filter_bil = 1/4*[1 2 1;2 4 2;1 2 1];% bilinear filter

%% enlarge 
img_enl_S = imenlarge(img,n,filter_bic);
img_enl_F = imenlarge_fre(img,n,filter_bic);
figure
montage({img_enl_S,img_enl_F}),title('enlarged image by spatial filtering(left) VS enlarged image by filtering in frequenct domain');

%% rescale
img_re_S = imresize(img_enl_S,1/(n*n),'bicubic');
img_re_F = imresize(img_enl_F,1/(n*n),'bicubic');
figure
montage({img_re_S,img_re_F}),title('rescaled image by spatial filtering(left) VS rescaled image by filtering in frequenct domain');

%% PSNR
PSNR_1 = psnr(img,img_re_S);
PSNR_2 = psnr(img,img_re_F);