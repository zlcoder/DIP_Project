pic = imread('../resource/skeleton_orig.tif');
pic_double = im2double(pic);
laplasse_filter =[-1,-1,-1;-1,8,-1;-1,-1,-1];
laplasse_array = Filter(pic_double,laplasse_filter);
laplasse_show = laplasse_array-min(min(laplasse_array));
laplasse_show = laplasse_show/max(max(laplasse_show));

%两图像相加锐化图像
sharpen_pic = pic_double+laplasse_array;

%Sobel算子中的x方向的滤波操作
sobel_xfilter = [-1 -2 -1;0 0 0;1 2 1];
sobel_x = Filter(pic_double,sobel_xfilter);

%Sobel算子中的y方向的滤波操作
sobel_yfilter = [-1 0 1;-2 0 2;-1 0 1];
sobel_y = Filter(pic_double,sobel_yfilter);

%取绝对值整合
sobel_pic = abs(sobel_x)+abs(sobel_y);
sobel_show = sobel_pic-min(min(sobel_pic));
sobel_show = sobel_show/max(max(sobel_show));

%均值滤波
average_filter = 0.04*ones(5,5);
average_pic = Filter(sobel_pic,average_filter);
average_show = average_pic-min(min(average_pic));
average_show = average_show/max(max(average_show));

%拉普拉斯与均值滤波的图像乘积增强
multi_pic = sharpen_pic.*average_pic;

%乘积图像与原图像相加
add_multi_pic = multi_pic+pic_double;

%gamma变换
gamma_pic = add_multi_pic.^0.5;

%结果展示
subplot(241)
imshow(pic_double);
title('a');
subplot(242);
imshow(laplasse_show);
title('b');
subplot(243);
imshow(sharpen_pic);
title('c');
subplot(244);
imshow(sobel_show);
title('d');
subplot(245);
imshow(average_show);
title('e');
subplot(246);
imshow(multi_pic);
title('f');
subplot(247);
imshow(add_multi_pic);
title('g');
subplot(248);
imshow(real(gamma_pic));
title('h');