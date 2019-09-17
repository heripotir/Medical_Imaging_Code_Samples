I=imread('C:\Users\Asus\Desktop\ooo\img (29).jpg');
I=rgb2gray(I);
a6= fspecial('motion');
I=imfilter(I,a6);

figure
subplot(3,3,1);
imshow(I);

for(i=2:9)
subplot(3,3,i);
[L,Centers] = imsegkmeans(I,i);
B = labeloverlay(I,L);
imshow(B)
end

