P=peaks(30);

subplot(2,1,1);

mesh(P);

title('�ü�ǰ����ͼ')

subplot(2,1,2);

P(20:23,9:15)=NaN*ones(4,7); %����

meshz(P) %��������ͼ

title('�ü������ͼ')

colormap([0 0 1]) %��ɫ����

saveas(gcf,'C:\Users\yangdonglai\Desktop\gray.jpg')