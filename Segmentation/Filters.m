%{
'average' : Averaging filter
'disk' : Circular averaging filter (pillbox)
'gaussian' :Gaussian lowpass filter. Not recommended. Use imgaussfilt or imgaussfilt3 instead.
'laplacian': Approximates the two-dimensional Laplacian operator
'log': Laplacian of Gaussian filter
'motion' : Approximates the linear motion of a camera
'prewitt': Prewitt horizontal edge-emphasizing filter
'sobel': Sobel horizontal edge-emphasizing filter

h = fspecial(type)
B = imfilter(A,h)
%}

a1= fspecial('average');
a2= fspecial('disk');
a3= fspecial('gaussian');
a4= fspecial('laplacian');
a5= fspecial('log');
a6= fspecial('motion');
a7= fspecial('prewitt');
a8= fspecial('sobel');

figure

I=imread('C:\Users\Asus\Desktop\ooo\img (29).jpg');
I=rgb2gray(I);
subplot(3,3,1);
imshow(I);
subplot(3,3,2);
imshow(imfilter(I,a1));
subplot(3,3,3);
imshow(imfilter(I,a2));
subplot(3,3,4);
imshow(imfilter(I,a3));
subplot(3,3,5);
imshow(imfilter(I,a4));
subplot(3,3,6);
imshow(imfilter(I,a5));
subplot(3,3,7);
imshow(imfilter(I,a6));
subplot(3,3,8);
imshow(imfilter(I,a7));
subplot(3,3,9);
imshow(imfilter(I,a8));
