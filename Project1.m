[filename,pathname]=uigetfile('*.*','Select grayscale image');
filewithpath=strcat(pathname,filename);
img=imread(filewithpath); %reading image
C = dct2(double(img)); %finding dct

figure
imshow(log(abs(C)),[]) % Displaying DCT coefficients
title('DCT coefficients. before tuncation');
colormap (gca, jet(64))
colorbar

C(abs(C)<50)=0;
figure
imshow(log(abs(C)),[]) % Displaying DCT coefficients
title('DCT coefficients. after tuncation');
colormap (gca, jet(64))
colorbar

Ct = idct2(C);%taking inverse dct

%writing images for size comparison
imwrite(img,'Original_Image.jpg','quality',100);
imwrite(uint8(Ct),'DCT_Compressed_Image.jpg','quality',100);

figure
imshowpair(img,Ct,'montage') % Displaying image
title('Original Greyscale Inage(left) and DCY compressed image(right)');
