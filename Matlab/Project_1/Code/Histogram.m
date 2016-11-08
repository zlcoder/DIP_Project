function [] = Histogram(filename,figureTitle,number)
%��������ͼ���ֱ��ͼ���⻯
pic = imread(filename);

fig = figure(number);
%������ʾ��ͼ��Ĵ�С����
set(fig,'Position',[100+900*(number-1) 246 900 700]);
set(fig,'name',figureTitle,'Numbertitle','off');

%��ʾ�Ҷ�ͼ��
subplot(2,3,1);
imshow(pic);

%����ͼ��ֱ��ͼ�ļ��㲢���л�ͼ
[height,width] = size(pic);
his = zeros(1,256); % his�����洢ÿһ������ֵ�ĸ���
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

%����ͼ��ֱ��ͼ���⻯����
equ = zeros(1,256);   %equ������������ÿһ��С�ڸ�����ֵ����������ֵ�ĺͣ�Ҳ���Ǿ��⻯֮������طֲ�
equ(1) = his(1); 
for i = 2:256
    equ(i) = equ(i-1)+his(i);
end

for i=1:256  
    equ(i) = equ(i)*255/(width*height); %��Ҷ�ӳ�亯��   
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

his_eq = zeros(1,256); % his_eq�����洢���⻯֮���ÿһ������ֵ�ĸ���
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

%��ֱ��ͼת������
cdf = equ/255;
x = linspace(0,1,256);
subplot(2,3,6);
plot(x,cdf);
xlim('auto');
ylim('auto');
title('Transtormation function');
end