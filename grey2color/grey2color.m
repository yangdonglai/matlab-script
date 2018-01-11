root = 'C:\Users\yangdonglai\Desktop\gray2color\';
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
    real_file_index = num2str(file_index -2);
    progress = strcat(real_file_index,strcat('/',real_file_count));
    begin_tip = strcat('正在导出',progress);
    finish_tip = strcat('完成导出',progress);
    
 
    im=imread(image_name);
    gray=rgb2gray(im);  
    I=double(gray);  
    [m,n]=size(I);  
    L=256;  
    for i=1:m  
        for j=1:n  
    if I(i,j)<=L/4  
        R(i,j)=0;  
        G(i,j)=4*I(i,j);  
        B(i,j)=L;  
    else if I(i,j)<=L/2  
            R(i,j)=0;  
            G(i,j)=L;  
            B(i,j)=-4*I(i,j)+2*L;  
        else if I(i,j)<=3*L/4  
                R(i,j)=4*I(i,j)-2*L;  
                G(i,j)=L;  
                B(i,j)=0;  
            else  
                R(i,j)=L;  
                G(i,j)=-4*I(i,j)+4*L;  
                B(i,j)=0;  
            end  
        end  
    end  
        end  
    end  
    for i=1:m  
        for j=1:n  
            rgbim(i,j,1)=R(i,j);  
            rgbim(i,j,2)=G(i,j);  
            rgbim(i,j,3)=B(i,j);  
        end  
    end  
    rgbim=rgbim/256;  
    figure;  
    imshow(rgbim);     
    disp(begin_tip);
    saveas(gcf,export_name);
    disp(finish_tip);
end

disp('finished!!!');
