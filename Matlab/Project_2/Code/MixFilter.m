pic = imread('../resource/skeleton_orig.tif');
pic_double = im2double(pic);
laplasse_filter =[-1,-1,-1;-1,8,-1;-1,-1,-1];
laplasse_array = Filter(pic_double,laplasse_filter);
laplasse_show = laplasse_array-min(min(laplasse_array));
laplasse_show = laplasse_show/max(max(laplasse_show));

%��ͼ�������ͼ��
sharpen_pic = pic_double+laplasse_array;

%Sobel�����е�x������˲�����
sobel_xfilter = [-1 -2 -1;0 0 0;1 2 1];
sobel_x = Filter(pic_double,sobel_xfilter);

%Sobel�����е�y������˲�����
sobel_yfilter = [-1 0 1;-2 0 2;-1 0 1];
sobel_y = Filter(pic_double,sobel_yfilter);

%ȡ����ֵ����
sobel_pic = abs(sobel_x)+abs(sobel_y);
sobel_show = sobel_pic-min(min(sobel_pic));
sobel_show = sobel_show/max(max(sobel_show));

%��ֵ�˲�
average_filter = 0.04*ones(5,5);
average_pic = Filter(sobel_pic,average_filter);
average_show = average_pic-min(min(average_pic));
average_show = average_show/max(max(average_show));

%������˹���ֵ�˲���ͼ��˻���ǿ
multi_pic = sharpen_pic.*average_pic;

%�˻�ͼ����ԭͼ�����
add_multi_pic = multi_pic+pic_double;

%gamma�任
gamma_pic = add_multi_pic.^0.5;

%���չʾ
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