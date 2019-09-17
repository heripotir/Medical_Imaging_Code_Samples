% Gabor filter:
 I=imread('C:\Users\Asus\Desktop\ooo\img (29).jpg');
 I = rgb2gray(I);
 
 wavelength = 2;
orientation = 10;
[mag,phase] = imgaborfilt(I,wavelength,orientation);

figure
subplot(1,3,1);
imshow(I);
title('Original Image');
subplot(1,3,2);
imshow(mag,[])
title('Gabor magnitude');
subplot(1,3,3);
imshow(phase,[]);
title('Gabor phase');


