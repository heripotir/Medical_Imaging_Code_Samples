close all; clear all
clc

srcFile = dir('C:\Users\Asus\Downloads\dicom\*.dcm');
%running a loop for reading of each file and save its information
%parameters in info
for i=1:length(srcFile)
    filename = strcat('C:\Users\Asus\Downloads\dicom\',srcFile(i).name);
    I = dicomread(filename);
    info = dicomread(filename);
    %forming structural element to perform dilation and erosion
    %thresholding
    se = strel('line',1,1);
    erodedI = imerode(I,se);
    
    image_thresholded=I;
    image_thresholded(I<100)=255;
    image_thresholded(I>100)=0;

    se= strel('disk',1);
    dilatedI = imdilate(image_thresholded,se);
    b = edge(dilatedI)
    se= strel('disk',1);
    dilatedI2=imdilate(b,se);
  
    figure()
    subplot(1,4,1)
    imshow(I,[])
    title('original image')
    subplot(1,4,2) 
    imshow(dilatedI, [])
    title('dilated image')
    subplot(1,4,3) 
    imshow(image_thresholded, [])
    title('thresholded image')
    subplot(1,4,4) 
    imshow(dilatedI2, [])
    title('edge detected')
    
    
    %metadata = dicominfo('CT-MONO2-16-ankle.dcm');
    %dicomwrite(X, 'ct_file.dcm', metadata);
    %dicomwrite(dilatedI2, filename, info)
    
   
end
