im=imread('C:\Users\yangdonglai\Desktop\gray_images\source\gray.jpg');
% im=imread('cell.jpg');
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
saveas(gcf,'C:\Users\yangdonglai\Desktop\gray_save.jpg')