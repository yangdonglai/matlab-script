i=imread('C:\Users\yangdonglai\Desktop\gray_images\source\gray.jpg');
gray_limit = 100;
max_height = 68;
[width,height,z] = size(i);
if(size(i,3)>1);
    i  = rgb2gray(i);
end
i=double(i);
for x = 1:width,
    for y = 1:height,
        gray = i(x,y);
        if(gray > gray_limit)
            i(x,y) = NaN;
        else
            i(x,y) = (256 - gray)/256*max_height;
        end
    end
end

tmp2 = i(1:2,1:2);
disp(tmp2);

mesh(i);
title('ª“∂»Õº')
zlabel('∏ﬂ∂»')
set(gcf,'position',[0,100,500,200])
set(gca,'ZTick',[40;50;60;70]);
colormap gray;

%saveas(gcf,'C:\Users\yangdonglai\Desktop\gray_save.jpg')