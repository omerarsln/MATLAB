clear
clc

image = imread('lena.png');
if(size(image,3) > 1)
    image = rgb2gray(image);
end

img = double(image);

maxRows = size(img,1);
maxColumns = size(img,2);

prewitt = ([maxRows maxColumns]);
robert = ([maxRows maxColumns]);

GX = [-1 0 1; -1 0 1; -1 0 1];
GY = [1 1 1; 0 0 0; -1 -1 -1];

for i = 2 : maxRows-1
   for j = 2 : maxColumns-1
       x = img(i-1,j-1)*GX(1,1) + img(i-1,j)*GX(1,2) + img(i-1,j+1)*GX(1,3) + img(i,j-1)*GX(2,1) + img(i,j)*GX(2,2) + img(i,j+1)*GX(2,3) + img(i+1,j-1)*GX(3,1) + img(i+1,j)*GX(3,2) + img(i+1,j+1)*GX(3,3); 
       y = img(i-1,j-1)*GY(1,1) + img(i-1,j)*GY(1,2) + img(i-1,j+1)*GY(1,3) + img(i,j-1)*GY(2,1) + img(i,j)*GY(2,2) + img(i,j+1)*GY(2,3) + img(i+1,j-1)*GY(3,1) + img(i+1,j)*GY(3,2) + img(i+1,j+1)*GY(3,3);
       
       gradient = sqrt( power(x,2) + power(y,2) );
       prewitt(i,j) = gradient;
   end
end

GX = [1 0; 0 1];
GY = [0 1; -1 0];

for i = 1 : maxRows-1
    for j = 1 : maxColumns-1
        x = img(i,j)*GX(1,1) + img(i,j+1)*GX(1,2) + img(i+1,j)*GX(2,1) + img(i+1,j+1)*GX(2,2);
        y = img(i,j)*GY(1,1) + img(i,j+1)*GY(1,2) + img(i+1,j)*GY(2,1) + img(i+1,j+1)*GY(2,2);
        
        gradient = sqrt( power(x,2) + power(y,2) );
        robert(i,j) = gradient;
    end
end

subplot(3,1,1)
imshow(image);
title('Original Image');

subplot(3,1,2)
imshow( uint8(prewitt) );
title('Prewitt');

subplot(3,1,3)
imshow( uint8(robert) );
title('Robert');
