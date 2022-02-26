%暗原色去雾算法是建立在户外自然场景暗通道优先法则的基础上的去雾方法，其实就是解一个方程
%I(x)=J(x)t(x)+A(1-t(x));其中I(x)是受到雾气污染的图像。J(x)是我们需要求的去雾后的图像
%t(x)是天空中云层的透射分布率，A是天空的亮度
%暗影去雾算法
%原始图像
img_name = imread('C:\Users\14766\Desktop\雾天图像\bench_original.jpg');
I = double(img_name) / 255;
%获取图像大小
[h,w,c] = size(I);
%去雾系数
w0 = 0.95;
img_size = w*h;
%初始化结果图像
dehaze = zeros(h,w,c);
%初始化暗影通道图像
win_dark = zeros(h,w);
for i = 1:h
    for j = 1:w
        win_dark(i,j) = min(I(i,j,:));  %将三个通道中最暗的值赋给dark_I(i,j)，显然，三维图变成了二维图
    end
end
win_dark = ordfilt2(win_dark,1,ones(9,9),'symmetric');

%计算大气亮度A
dark_channel = win_dark;
A = max(max(dark_channel));
[i,j] = find(dark_channel==A);
i = i(1);
j = j(1);
A = mean(I(i,j,:));
%计算初始的transmission map
transmission = 1 - w0 * win_dark / A;
%用guided filter对transmission map做soft matting
gray_I = I(:,:,1);  %这里gray_I可以是RGB图像中任何一个通道
p = transmission;
r = 80;
eps = 10^-3;
transmission_filter = guidedfilter(gray_I,p,r,eps);
t0 = 0.1;
t1 = max(t0,transmission_filter);
for i = 1:c
    for j = 1:h
        for l = 1:w
            dehaze(j,l,i) = (I(j,l,i)-A)/t1(j,l)+A;
        end
    end
end
figure,
imshow(I);title('去雾前')
figure,
imshow(dehaze);title('去雾后')
