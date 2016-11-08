function [] = Histogram(filename,figureTitle,number)
%��������ͼ���ֱ��ͼ���⻯
picture = imread(filename);

fig = figure(number);
%������ʾ��ͼ��Ĵ�С����
set(fig,'Position',[100+900*(number-1) 246 900 700]);
set(fig,'name',figureTitle,'Numbertitle','off');

%ͼ��ֱ��ͼ��ʾ
h=imhist(picture);
%h1 = h(1:10:256);
subplot(2,3,1);
imshow(picture);
subplot(2,3,4);
plot(h);
xlim('auto');
ylim('auto');
xlabel('pixel value');
ylabel('pixel number');
title('Fig1-Histogram');

%ֱ��ͼ���⻯
peq = histeq(picture,256);
%imwrite(heq,'../Result/heqFig1.jpg');
heq = imhist(peq);
subplot(2,3,2);

imshow(peq);
subplot(2,3,5);
plot(heq);
xlim('auto');
ylim('auto');
xlabel('pixel value');
ylabel('pixel number');
title('Fig1-Histogram Eq');

%��ֱ��ͼת������
hnorm = imhist(picture)/numel(picture);
cdf = cumsum(hnorm);
x = linspace(0,1,256);
subplot(2,3,6);
plot(x,cdf);
xlim('auto');
ylim('auto');
title('Transtormation function');