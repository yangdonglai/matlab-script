P=peaks(30);

subplot(2,1,1);

mesh(P);

title('裁剪前的网图')

subplot(2,1,2);

P(20:23,9:15)=NaN*ones(4,7); %剪孔

meshz(P) %垂帘网线图

title('裁剪后的网图')

colormap([0 0 1]) %蓝色网线

saveas(gcf,'C:\Users\yangdonglai\Desktop\gray.jpg')