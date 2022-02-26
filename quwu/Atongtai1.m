%̬ͬ�˲�����
clc;
close all;
clear all;
tic;

img=imread('C:\Users\14766\Desktop\����ͼ��\bench_original.jpg');
figure;
imshow(img);
title('ԭͼ��');

%��ʾԭʼͼ��ֱ��ͼ
figure;
II=rgb2gray(img);
imhist(II)
ylim('auto');
title('ԭͼ��ֱ��ͼ');

img=im2double(img);
lnimg=log(img+0.000001);
Fimg=fft2(lnimg);%����Ҷ�任
P=fftshift(Fimg);%��Ƶ��ԭ���Ƶ�ͼ������
[M,N]=size(P);

%̬ͬ�˲���������
D0=100;%��ֹƵ��
c=1.50;%��ϵ��
%ȷ���˲�����
x0=floor(M/2);%ȡ������M/2���������
y0=floor(N/2);
Hh=2;Hl=0.5;%Hh>1,Hl<1.����HhΪ��Ƶ���棬HlΪ��Ƶ����
for u=1;M
    for v=1;N
        D(u,v)=sqrt((u-x0)^2+(v-y0)^2);%�㣨u��v����Ƶ��ƽ��ԭ��ľ���
        H(u,v)=((Hh-Hl)*(1-exp(-c*(D(u,v)^2)/D0^2)))+Hl;%̬ͬ�˲�����
    end
end

hImg=Fimg.*H(u,v);%�˲���������
Q=fftshift(hImg);

gImg=ifft2(hImg);%����Ҷ��任
Y=exp(gImg);%ȡָ��
J=im2uint8(Y);%ת��Ϊͼ�����Ϊ�޷���8λ������256���ĻҶ�ͼ��

figure;
II=rgb2gray(J);
imhist(II)%��ʾԭʼͼ��ֱ��ͼ
ylim('auto');
%title('̬ͬ�˲���ͼ��ֱ��ͼ');

figure;
imshow(J);
title('̬ͬ�˲����ͼ��');



toc;
