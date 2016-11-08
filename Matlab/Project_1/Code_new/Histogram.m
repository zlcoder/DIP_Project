function [] = Histogram(filename,figureTitle,number)
%用来进行图像的直方图均衡化
pic = imread(filename);

fig = figure(number);
%进行显示的图像的大小设置
set(fig,'Position',[100+900*(number-1) 246 900 700]);
set(fig,'name',figureTitle,'Numbertitle','off');

%显示灰度图像
subplot(2,3,1);
imshow(pic);

%进行图像直方图的计算并进行画图
[height,width] = size(pic);
his = zeros(1,256); % his用来存储每一个像素值的个数
for i = 1:height
    for j = 1:width
        his(pic(i,j)+1) = his(pic(i,j)+1)+1;
    end
end
subplot(2,3,4);
plot(his);
xlim('auto');
ylim('auto');
xlabel('pixel value');
ylabel('pixel number');
title('Fig1-Histogram');

%进行图像直方图均衡化计算
equ = zeros(1,256);   %equ矩阵用来计算每一个小于该像素值的所有像素值的和，也就是均衡化之后的像素分布
equ(1) = his(1); 
for i = 2:256
    equ(i) = equ(i-1)+his(i);
end

for i=1:256  
    equ(i) = equ(i)*255/(width*height); %求灰度映射函数   
end
pic_equ = pic;
for i = 1:height
    for j = 1:width
        pic_equ(i,j) = equ(pic(i,j)+1);
    end
end
pic_eq = round(pic_equ);
%imwrite(pic_equ,'../Result/heqFig1.jpg');
subplot(2,3,2);
imshow(pic_eq);

his_eq = zeros(1,256); % his_eq用来存储均衡化之后的每一个像素值的个数
for i = 1:height
    for j = 1:width
        his_eq(pic_eq(i,j)+1) = his_eq(pic_eq(i,j)+1)+1;
    end
end
subplot(2,3,5);
plot(his_eq);
xlim('auto');
ylim('auto');
xlabel('pixel value');
ylabel('pixel number');
title('Fig1-Histogram Eq');

%画直方图转化函数
cdf = equ/255;
x = linspace(0,1,256);
subplot(2,3,6);
plot(x,cdf);
xlim('auto');
ylim('auto');
title('Transtormation function');
end