clc; 
clear;

r1 = imread("ucak1.jpg");
r2 = imread("ucak2.jpg");

imshow(r1);
imshow(r2);

fark = imsubtract(r1,r2);
imshow(fark);

imgfark = imbinarize(fark);
imshow(imgfark);

imgfark2 = fark>20;
imshow(imgfark2);

imgfark = bwareaopen(imgfark2,30);
imshow(imgfark);

se = strel('square',4);
imgdilate = imdilate(imgfark,se);
imshow(imgdilate);

[etiketler,ucaksayisi] = bwlabel(imgdilate);
ucakozellikleri = regionprops(etiketler,'all');
merkezler = [ucakozellikleri.Centroid];

imshow(r1);
x = merkezler(1:2:end);
y = merkezler(2:2:end);

hold on;
plot(x,y,'yo','MarkerSize',35,'LineWidth',4);

figure,imshow(r2);

hold on;
plot(x,y,'bo','MarkerSize',35,'LineWidth',4);












