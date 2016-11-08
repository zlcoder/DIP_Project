w = [-1 -1 -1;-1 8 -1;-1 -1 -1];
pic = imread('../resource/skeleton_orig.tif');
class(pic)
pic2 = im2double(pic);
pic_array = imfilter(pic2,w,'replicate')
imshow(pic_array,[]);