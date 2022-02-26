% 提取原图 MSRCR 引导滤波 本文算法处理的信息熵 并保存在excel表格
clc
clear
letter={'1','2','3','4','5'};
for j=1:size(letter,2),
     Y{j}=imread('D:\B13090101_卜筱凡_数据及代码\图片\14.jpg');%读入原图
    M{j}=imread('D:1.jpg');%读入MSRCR处理后的图
   % H{j}=imread('D:\1304.jpg');%读入MSRCR处理后的图
%     G{j}=imread('C:\Users\Administrator\Desktop\毕业设计论文\毕设结果\r=24.jpg');%读入引导滤波处理后的图
%     B{j}=imread('C:\Users\Administrator\Desktop\毕业设计论文\毕设结果\r=40.jpg');%读入本文算法处理后的图
%     C{j}=imread('C:\Users\Administrator\Desktop\毕业设计论文\毕设结果\r=60.jpg');%读
%     入本文算法处理后的图
    junzhi(j,1) = mean2(Y{j});   %原图保存在第一列
    junzhi(j,2) = mean2(M{j});
   % junzhi(j,3) = mean2(H{j});
%     junzhi(j,4) = mean2(G{j});
%     junzhi(j,5) = mean2(B{j});
%     junzhi(j,6) = mean2(C{j});
 
    biaozhuncha(j,1) = std2(Y{j});   %原图保存在第一列
    biaozhuncha(j,2) = std2(M{j});
   % biaozhuncha(j,3) = std2(H{j});
%     biaozhuncha(j,4) = std2(G{j});
%     biaozhuncha(j,5) = std2(B{j});
%     biaozhuncha(j,6) = std2(C{j});

    fangcha(j,1) = std2(Y{j})^2;   %原图保存在第一列
    fangcha(j,2) = std2(M{j})^2;
    %fangcha(j,3) = std2(H{j})^2;
%     fangcha(j,4) = std2(G{j})^2;
%     fangcha(j,5) = std2(B{j})^2;
%     fangcha(j,6) = std2(C{j})^2;

end
 xlswrite('D:\何恺明评价\均值8.xls',junzhi,'sheet1');
 xlswrite('D:\何恺明评价\标准差8.xls',biaozhuncha,'sheet1');
 xlswrite('D:\何恺明评价\方差8.xls',fangcha,'sheet1');
 t=2

