root = 'C:\Users\yangdonglai\Desktop\gray_images\';
source = strcat(root,'source\');
target = strcat(root,'target\');
source_files = dir(source);
gray_limit = 100;
file_count = size(source_files,1);
real_file_count = num2str(file_count-2);
for file_index = 3:file_count
    file_name  = source_files(file_index).name;
    image_name = strcat(source,file_name)
    export_name = strcat(target,file_name);
    title_name = strcat('灰度图-',file_name);
    z_name = '单位/nm';
    real_file_index = num2str(file_index -2);
    progress = strcat(real_file_index,strcat('/',real_file_count));
    begin_tip = strcat('正在导出',progress);
    finish_tip = strcat('完成导出',progress);
    
 
    i=imread(image_name);
    [width,height,z] = size(i);
    if(size(i,3)>1);
        i  = rgb2gray(i);
    end
    i= double(i);

    for x = 1:width,
        for y = 1:height,
            gray = i(x,y);
            if(gray > gray_limit)
                i(x,y) = NaN;
            else
                i(x,y) = (256 - gray)/256*70;
            end
        end
    end
    i = flipdim(i,1);
    i(1:120,1:120) = NaN*ones(120,120);
 
    
    mesh(i);
    title(title_name);
    zlabel(z_name);
    colormap gray;
    %xlim([0,width]);
    %ylim([0,height]);
    %axis([0,width,0,height,0,100]);
    %set(gca,'ZTick',[10:10:46]);

    
    disp(begin_tip);
    saveas(gcf,export_name);
    disp(finish_tip);
end

disp('finished!!!');
