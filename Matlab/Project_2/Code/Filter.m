function result_array = Filter(pic_double,filter)
[height] = length(filter);
nd = floor(height/2);
pic_pad = padarray(pic_double,[nd,nd],'replicate');
[height1, width1] = size(pic_pad);
result_temp = zeros(height1,width1);
for i = 1+nd:height1-nd
    for j = 1+nd:width1-nd
        temp = pic_pad(i-nd:i+nd,j-nd:j+nd);
        tempval = filter.*temp;
        result_temp(i,j) =sum(sum(tempval));
    end
end
result_array = result_temp(nd+1:height1-nd,nd+1:width1-nd);
end

