%同态滤波方法
clc;
close all;
clear all;
tic;

img=imread('C:\Users\14766\Desktop\雾天图像\bench_original.jpg');
figure;
imshow(img);
title('原图像');

%显示原始图像直方图
figure;
II=rgb2gray(img);
imhist(II)
ylim('auto');
title('原图像直方图');

img=im2double(img);
lnimg=log(img+0.000001);
Fimg=fft2(lnimg);%傅里叶变换
P=fftshift(Fimg);%将频率原点移到图像中心
[M,N]=size(P);

%同态滤波参数设置
D0=100;%截止频率
c=1.50;%锐化系数
%确定滤波中心
x0=floor(M/2);%取不大于M/2的最大整数
y0=floor(N/2);
Hh=2;Hl=0.5;%Hh>1,Hl<1.其中Hh为高频增益，Hl为低频增益
for u=1;M
    for v=1;N
        D(u,v)=sqrt((u-x0)^2+(v-y0)^2);%点（u，v）到频率平面原点的距离
        H(u,v)=((Hh-Hl)*(1-exp(-c*(D(u,v)^2)/D0^2)))+Hl;%同态滤波函数
    end
end

hImg=Fimg.*H(u,v);%滤波，矩阵点乘
Q=fftshift(hImg);

gImg=ifft2(hImg);%傅里叶逆变换
Y=exp(gImg);%取指数
J=im2uint8(Y);%转换为图像矩阵为无符号8位数，即256级的灰度图像

figure;
II=rgb2gray(J);
imhist(II)%显示原始图像直方图
ylim('auto');
%title('同态滤波后图像直方图');

figure;
imshow(J);
title('同态滤波后的图像');



toc;
