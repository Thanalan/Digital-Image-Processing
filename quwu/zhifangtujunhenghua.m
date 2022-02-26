%利用直方图均衡化去雾

%===========================================================

close;

clear;

wu=imread('C:\Users\14766\Desktop\雾天图像\bench_original.jpg');

%--------------------------------------------------------------------------

%对饱和度与亮度进行直方图均衡处理

%h：色度

%s：饱和度

%v：亮度

hsv=rgb2hsv(wu);

wu1=rgb2gray(wu);

h=hsv(:,:,1);

s=hsv(:,:,2);

v=hsv(:,:,3);

S=histeq(s);

V=histeq(v);

result_hsv=hsv2rgb(h,S,V);

%--------------------------------------------------------------------------

% 对RGB每个通道进行直方图均衡处理

% R：红色

% G：绿色

% B：蓝色

r=wu(:,:,1);

g=wu(:,:,2);

b=wu(:,:,3);

R=histeq(r);

G=histeq(g);

B=histeq(b);

result_rgb=cat(3,R,G,B);%将RGB三个分量放入一个矩阵

result_rgb1=rgb2gray(result_rgb);

%--------------------------------------------------------------------------

% 对YCbCr的亮度进行直方图均衡处理

%y：颜色的亮度，

%Cb：蓝色的浓度偏移成分

%Cr：红色的浓度偏移成分

ycbcr=rgb2ycbcr(wu);

y=ycbcr(:,:,1);

cb=ycbcr(:,:,2);

cr=ycbcr(:,:,3);

Y=histeq(y);

result_ycbcr=ycbcr2rgb(cat(3,Y,cb,cr));%%将RGB三个分量放入一个矩阵

result_ycbcr1=rgb2gray(result_ycbcr);

%将彩色图像转换为灰度图像后，再做直方图均衡处理

whole=rgb2gray(wu);

W=histeq(whole);

%--------------------------------------------------------------------------

% 结果显示

figure(1)

subplot(2,2,1),imshow(wu),title('原始图像')

subplot(2,2,2),imshow(result_hsv),title('HSV')

subplot(2,2,3),imhist(wu1);

subplot(2,2,4),imhist(result_hsv);

figure(2)

subplot(2,2,1),imshow(wu),title('原始图像')

subplot(2,2,2),imshow(result_rgb),title('RGB')

subplot(2,2,3),imhist(wu1);

subplot(2,2,4),imhist(result_rgb1);

figure(3)

subplot(2,2,1),imshow(wu),title('原始图像')

subplot(2,2,2),imshow(result_ycbcr),title('YCbCr')

subplot(2,2,3),imhist(wu1);

subplot(2,2,4),imhist(result_ycbcr1);

figure(4)

subplot(2,2,1),imshow(wu),title('原始图像')

subplot(2,2,2),imshow(W),title('灰度图像直方图均衡化')

subplot(2,2,3),imhist(wu1);

subplot(2,2,4),imhist(W);