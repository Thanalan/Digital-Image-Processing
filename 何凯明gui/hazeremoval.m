
clear all

clc

blocksize=3;               %ÿ��blockΪ15������

w0=0.6;                    

t0=0.1;

I=imread('C:\Users\linghuxiongkun\p\test11.jpg');

figure(1);
imshow(I);
title('ԭʼͼ��');


 grayI=rgb2gray(I);
%ͳ��<50��������ռ�ı���

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

        dark_I(i,j)=min(I(i,j,:));%ȡÿ���������ΪRGB��������͵��Ǹ�ͨ����ֵ

    end

end

Radius = (blocksize-1)/2;

figure(2);
imshow(dark_I);
title('ÿ����RGBͨ����Сֵ');

dark_channel = double(ordfilt2(dark_I,1,ones(blocksize,blocksize)));  %���д��ڴ�СΪblocksize����Сֵ�˲�
figure(3);
imshow(uint8(dark_channel));
title('��Сֵ�˲������Сֵ');

Max_dark_channel=double(max(max(dark_I)))
w0= 0.96
A = 200;
t=1-w0*(dark_channel/Max_dark_channel);  %���͸����
t=max(t,t0);
T=uint8(t*255);

figure(4);
imshow(T);
title('δ���������˲���͸���ʷֲ�');

I_guide_norm = double(rgb2gray(I))/255;  %�ԻҶ�ͼ��Ϊ����ͼ�������й�һ��
t_norm = t/255;
eps = 0.0005;
r = 8*Radius;
t = guidedfilter(I_guide_norm,t,r,eps);

T=uint8(t*255);
figure(5);
imshow(T);
title('���������˲���͸���ʷֲ�');

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
title('ȥ����ͼ��');

figure(7);
imshow(1.5*J);
title('ȥ���ͼ��');
% J = 2*J;

figure(8);
imshow(2*I);
title('ԭͼ������ֱ�Ӽӱ���Ľ��');

