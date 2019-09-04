clear all, close all, clc;
fullFileName='C:\Users\Asus\Downloads\ooo\im (17).jpg';
originalImage = imread(fullFileName);
originalImage=rgb2gray(originalImage);
subplot(2, 3, 1);
imshow(originalImage);
drawnow;
%axis image;
subplot(2, 3, 2);
imhist(originalImage);

t=graythresh(originalImage);
%manuel thresholding instead of im2bw();
%thresholdValue = 80;
%binaryImage = originalImage > thresholdValue;

binaryImage= im2bw(originalImage,t);


subplot(2, 3, 3);
imshow(binaryImage);

%imfill(binaryImage, 'holes');
labeledImage = bwlabel(binaryImage, 8); 

subplot(2, 3, 4);
%imshow(labeledImage);

imshow(labeledImage, [])

coloredLabels = label2rgb (labeledImage, 'hsv', 'k', 'shuffle'); 
subplot(2, 3, 5);
imshow(coloredLabels);
axis image;


subplot(2, 3, 6);
imshow(originalImage);

%axis image;
hold on;
boundaries = bwboundaries(binaryImage);
numberOfBoundaries = size(boundaries, 1);
for k = 1 : numberOfBoundaries
	thisBoundary = boundaries{k};
	plot(thisBoundary(:,2), thisBoundary(:,1), 'g', 'LineWidth', 2);
end
hold off;

