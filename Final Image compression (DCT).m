%Image compression using Discrete Cosine Transform Technigue (DCT).
warning off;
clear all;
close all;
clc;

% Reading an input image 
% Read Color image

image=double((imread('car.jpg')));

% Computing the size of an image

[m1,n1,dim]=size(image);
z=min(m1,n1);

% Check is the image to determine if it is colored or greyscale
% If dimension is greater than 2 then the image is colored.

if(dim>2)
    display('Loaded image is coloured ')
else
    display('Loaded image is grayscale ');
end


%Selection of threshold value for DCT coefficients
% For coloured image we used thresh value of 5,50 and 500 
% The higher the threshold value the higher the image compression.
% Ask the user for the threshold value

prompt = 'Enter the threshold value?  ';
thresh = input(prompt);

% For colored images 

if(dim==3)   
    
% Resize the image to make it square

image_square=(imresize(image,[z z]));

% Computing the size of a square image

[m2,n2]=size(image_square);

% Calculation the DCT basis matrix with a for loop.

for i=1:m2   
    for j=1:m2
        if(i==1)
          z(i,j)=sqrt(1/n2)*cos(((2*j-1)*(i-1)*pi)/(2*n2));
        else
          z(i,j)=sqrt(2/n2)*cos(((2*j-1)*(i-1)*pi)/(2*n2)); 
        end
    end
end

% Calculating the DCT coefficents for each RGB components of the 
% colored image.

DCT_red=z*image_square(:,:,1)*z';
DCT_green=z*image_square(:,:,2)*z';
DCT_blue=z*image_square(:,:,3)*z';


% Approximating the DCT coefficients to achieve compression 
% for each channel.

DCT_red(abs(DCT_red)<thresh)=0;
DCT_green(abs(DCT_green)<thresh)=0;
DCT_blue(abs(DCT_blue)<thresh)=0;

DCT(:,:,1)=DCT_red;
DCT(:,:,2)=DCT_green;
DCT(:,:,3)=DCT_blue;

% Reconstruction of the compresed image from each channel

image_compressed(:,:,1)=z'*DCT_red*z;
image_compressed(:,:,2)=z'*DCT_green*z;
image_compressed(:,:,3)=z'*DCT_blue*z;

imwrite(uint8(image_compressed),'Compressed_image_coloured.jpeg');

% Compression ratio

data_orig=imfinfo('car.jpg');

%Getting the image file.

original_file_size=data_orig.FileSize;
data_comp=imfinfo('Compressed_image_coloured.jpeg');
compressed_file_size=data_comp.FileSize;

%Compression ratio formula.

Compression_ratio=floor(original_file_size/compressed_file_size);


% The plots the results of the image using matlab data type 'unit8'

imshow(uint8(image_square)),title('Original image');
figure;
imshow(uint8(image_compressed)),title('Compressed image');


% Saving the images into the directory.

imwrite(uint8(image_square),'original_image_colored.jpeg');
imwrite(uint8(image_compressed),'Compressed_image_coloured.jpeg');



end



