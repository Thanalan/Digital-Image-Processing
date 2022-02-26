
clear all

clc

blocksize=3;               %每个block为15个像素

w0=0.6;                    

t0=0.1;

I=imread('C:\Users\linghuxiongkun\p\test11.jpg');

figure(1);
imshow(I);
title('原始图像');


 grayI=rgb2gray(I);
%统计<50的像素所占的比例

%%%%%%%%%%%%%%%%%%%%%%

[COUNT, x]=imhist(grayI);

under_50=0;

for i=0:50

    under_50=under_50+COUNT(x==i);

end

under_50

total=size(I,1)*size(I,2)*size(I,3);

percent=under_50/total

%%%%%%%%%%%%%%%%%%%%%%


if(percent>0.1)
    w0 = 0.95;

%     error('This image need not Haze-Free-Proprocessing.');

else if(percent<0.001)

        w0=0.95;

    else if (percent>0.05)

            w0=0.3;

        else

            w0=0.95;

        end

    end

end

[h,w,s]=size(I);

min_I=zeros(h,w);

for i=1:h                 

    for j=1:w

        dark_I(i,j)=min(I(i,j,:));%取每个点的像素为RGB分量中最低的那个通道的值

    end

end

Radius = (blocksize-1)/2;

figure(2);
imshow(dark_I);
title('每个点RGB通道最小值');

dark_channel = double(ordfilt2(dark_I,1,ones(blocksize,blocksize)));  %进行窗口大小为blocksize的最小值滤波
figure(3);
imshow(uint8(dark_channel));
title('最小值滤波后的最小值');

Max_dark_channel=double(max(max(dark_I)))
w0= 0.96
A = 200;
t=1-w0*(dark_channel/Max_dark_channel);  %求得透射率
t=max(t,t0);
T=uint8(t*255);

figure(4);
imshow(T);
title('未经过导向滤波的透射率分布');

I_guide_norm = double(rgb2gray(I))/255;  %以灰度图作为导向图，并进行归一化
t_norm = t/255;
eps = 0.0005;
r = 8*Radius;
t = guidedfilter(I_guide_norm,t,r,eps);

T=uint8(t*255);
figure(5);
imshow(T);
title('经过导向滤波的透射率分布');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I1=double(I);

% J(:,:,1) = uint8((I1(:,:,1) - (1-t)*Max_dark_channel)./t);
% 
% J(:,:,2) = uint8((I1(:,:,2) - (1-t)*Max_dark_channel)./t);
% 
% J(:,:,3) =uint8((I1(:,:,3) - (1-t)*Max_dark_channel)./t);
J(:,:,1) = uint8((I1(:,:,1) - (1-t)*A)./t);

J(:,:,2) = uint8((I1(:,:,2) - (1-t)*A)./t);

J(:,:,3) =uint8((I1(:,:,3) - (1-t)*A)./t);

figure(6);
imshow(J);
title('去雾后的图像');

figure(7);
imshow(1.5*J);
title('去雾的图像');
% J = 2*J;

figure(8);
imshow(2*I);
title('原图像亮度直接加倍后的结果');

