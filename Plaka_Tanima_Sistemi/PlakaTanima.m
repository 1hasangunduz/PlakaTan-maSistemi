clc;
clear;
close all;

I = imread('C:Image.jpeg'); %g�r�nt�y� oku
figure, imshow(I); %okunan g�r�nt�y� g�sterir

Ig = rgb2gray(I); %renkli g�r�nt�y� gri seviyeye �evirir
figure,
subplot(2,2,1), imshow(Ig); %soldaki resim olarak g�sterir
 
Ih = histeq(Ig); %histogram� e�itleyerek kontrast� art�r�r
subplot(2,2,2), imshow(Ih); %sa�daki resim olarak g�sterir

figure,
subplot(1,2,1), imhist(Ig); %griye �evrilen g�r�nt� �zerindeki de�erlerin da��l�m�n� g�sterir
subplot(1,2,2), imhist(Ih);

Ie = edge(Ih, 'sobel'); %sobel kenar bulma algoritmas�yla kenarlar bulunur
figure, 
subplot(1,2,1), imshow(Ie);

Id = imdilate(Ie, strel('diamond',1)); %morfolojik i�lem olan geni�letme algoritmas�
subplot(1,2,2), imshow(Id); %strel yap�sal filtre eleman�d�r. morfolojik i�lemi hangi �ekil ve parametreyle yapaca��m�z� g�sterir
[adinserter block :'2'];
If = imfill(Id,'holes');%imfiil komutu resimde �ukur denilen yerleri doldurur.
figure, imshow(If); %yani gri seviyede veya binary modda a��kl�klar� doldurur
 
[lab, n] = bwlabel(If); % bwlabel komutu resimdeki nesneleri belirler. lab i�ine nesnelerin pixel de�erini
 %n i�ine ka� tane nesne oldu�u at�l�r
regions = regionprops(lab, 'All');
 regionsCount = size(regions, 1) ;
 for i = 1:regionsCount
 region = regions(i);
 RectangleOfChoice = region.BoundingBox;
 PlateExtent = region.Extent;

PlateStartX = fix(RectangleOfChoice(1));
 PlateStartY = fix(RectangleOfChoice(2));
 PlateWidth = fix(RectangleOfChoice(3));
 PlateHeight = fix(RectangleOfChoice(4));

if PlateWidth >= PlateHeight*3 && PlateExtent >= 0.7
 im2 = imcrop(I, RectangleOfChoice); 
 figure, imshow(im2);

end
end