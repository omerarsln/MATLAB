clear
clc

original=imread('lena.png');
A=rgb2gray(original);

[m,n]=size(A);

B=A;
minp=min(min(A));
maxp=max(max(A));
for i=1:m
    for j=1:n
        B(i,j)=((250/(maxp-minp))*(A(i,j)-minp));
    end
end

subplot(2,1,1)
imshow(original);
title('Original Ýmage');

subplot(2,1,2)
imshow(B);
title('Histogram Streched Image');
