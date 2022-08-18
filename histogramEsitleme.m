clear
clc

img = imread('lena.png');
if(size(img,3) > 1)
    img = rgb2gray(img);
end

maxRows = size(img,1);
maxColumns = size(img,2);
histogram = zeros([1 256]);
cumulativeHistogram = zeros([1 256]);

for r = 1 : maxRows
    for c = 1 : maxColumns
        for i = 1 : 256
            if( img(r,c) == i-1 )
                histogram(i) = histogram(i) + 1;
                break;
            end
        end
    end
end

sum=0;
for i = 1 : 256
    sum = sum + histogram(i);
    cumulativeHistogram(i) = sum;
end

normalizedHistogram = zeros([1 256]);
cdf_min = min(cumulativeHistogram);
for i = 1 : 256
    normalizedHistogram(i) = cumulativeHistogram(i) - cdf_min;
    normalizedHistogram(i) = normalizedHistogram(i) / ( (maxRows*maxColumns) - cdf_min );
    normalizedHistogram(i) = round( normalizedHistogram(i) * 255 );
end
    
equalizedImage = zeros([maxRows,maxColumns]);

for r = 1 : maxRows
    for c = 1 : maxColumns
        for i = 1 : 256
            if( img(r,c) == i-1 )
                equalizedImage(r,c) = normalizedHistogram(i);
                break;
            end
        end
    end
end

subplot(2,1,1)
imshow(img);
title('Original Image');

subplot(2,1,2)
imshow( uint8(equalizedImage) );
title('Histogram Equalized Image');
