# Linear-Algebra-Projecct
Image Compression

Introduction

A brief exploration of the World Wide Web shows that preserving a digitized image, especially one of high resolution, necessitates a large amount of memory. Even with a high-speed link, viewing specific homepages is a painfully slow operation. The problem the team is solving is image compression. The report would include the background of the problem, theories and concepts, general applications of linear algebra methods, final results and a discussion about key findings. Linear Algebra is very powerful too which can be used for linear models in economics and engineering, computer models in aircraft design, space flight and control systems, and multichannel image processing.

Background
Since the inception of social media, image sharing has become a norm. From sharing pictures with loved ones on WhatsApp to posting travel tours on Instagram, social media has become a safe haven for picture sharing. According to Thomson, Angus, and Dootson, social media users share about three billion images daily (Thomson, Angus, and Dootson, 2020). We like sharing our quality images with friends and family, but when we share our pictures on some platforms, we see a reduction in picture quality sometimes based on the platform we share our pictures on or low internet based on location. When these images are shared depending on the platform some are compressed in order to de delivered at fast speeds to the recipient and because of low internet bandwidth at certain locations. However, when this compression is done the quality of the image reduces. The team has come to test two popular methods of image compression, of which we will conclude on which is the best method to use with better compression quality.

Methods
Image compression is the reduction of size in bytes of a graphic file without degrading the quality of the image. Singular Value Decomposition (SVD) is the decomposition that involves an m x n “diagonal” matrix ƹ. SVD is used to estimate the rank of a matric, which can be used in an application for image processing. In using SVD for image compression, we first have to convert the image into matrix form.

![image](https://user-images.githubusercontent.com/61565391/203327190-bc157420-b135-4ba8-8a8c-2f6e16c0dc92.png)


In SVD, we split the image matrix into its red, green, and blue components. Then in each of the matrix, it is then split into its three different matrixes according to the SVD formula, that is compressed individually using the inbuilt SVD function. Then we choose the block size between any number higher than one but less than 125. Once this is done, the compressed color matrix with the specified block size is then reconstructed into the compressed image. The interpretation of SVD is represented in the Matlab code below.


![image](https://user-images.githubusercontent.com/61565391/203327293-89006463-730c-462b-8554-0d186ee32e8c.png)


Open further research, we found that Discrete Cosine Transform Technique (DCT) is also using in image compression. In order to process the image, we first need to compute the size of the image. We use the formula [m, n, numberOfColorChannels]=size(a).
Images are stored in Matlab using three matrices, each representing red, green and blue attributes of pixels. The three matrices are specified by the third indexing number. The horizontal and vertical dimensions of each color matrix match the size of the image in unit of pixels. This representation can be seen in figure 1.a below.

![image](https://user-images.githubusercontent.com/61565391/203327377-779cecaf-ec3d-4d32-9b4e-9b397e42f110.png)


The red, blue, and green components can be represented by using 8 bits which are unsigned 8-bit, or ‘unit8’, which is a Matlab data type for representing the scale of 0 to 255. This representation can be seen in figure 2.b below.

![image](https://user-images.githubusercontent.com/61565391/203327466-670ea260-59ad-42b6-bc44-5216dab93826.png)

To obtain the image compression, we used the DCT formula, which can be seen in figure 3.c below. The DCT helps separate the image into parts of spectral sub-bands of differing importance with respect to the image’s visual quality (Marshall, 2001).

![image](https://user-images.githubusercontent.com/61565391/203327550-9252fe21-e2c6-4c98-8ceb-76eebe576a9e.png)



Results
Image compression with SVD

Original Image

![image](https://user-images.githubusercontent.com/61565391/203327625-9ae2c392-23df-4159-8bd9-e2770418b78e.png)


Compressed Image with a compression ratio of 0.205
![image](https://user-images.githubusercontent.com/61565391/203327712-0ac1dac6-57ce-49a2-8a79-e576abb388ea.png)

Image compression with DCT
ORIGINAL IMAGE (538 KB)

![image](https://user-images.githubusercontent.com/61565391/203327808-d5a24d26-72a2-408b-95a5-b318540fb011.png)

COMPRESSED IMAGE (91.8 KB)

![image](https://user-images.githubusercontent.com/61565391/203327884-5af2125c-a477-4e94-89ac-44ee89f66bd5.png)



