% Contrast-limited adaptive histogram equalization (CLAHE)

I = imread('C:\Users\Asus\Desktop\ooo\img (17).jpg');
I = rgb2gray(I);
J = adapthisteq(I,'clipLimit',0.01,'Distribution','rayleigh');
imshowpair(I,J,'montage');
title('Original Image (left) and Contrast Enhanced Image (right)')

