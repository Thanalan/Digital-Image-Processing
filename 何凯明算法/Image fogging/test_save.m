% ��ȡԭͼ MSRCR �����˲� �����㷨�������Ϣ�� ��������excel���
clc
clear
letter={'1','2','3','4','5'};
for j=1:size(letter,2),
     Y{j}=imread('D:\B13090101_���㷲_���ݼ�����\ͼƬ\14.jpg');%����ԭͼ
    M{j}=imread('D:1.jpg');%����MSRCR������ͼ
   % H{j}=imread('D:\1304.jpg');%����MSRCR������ͼ
%     G{j}=imread('C:\Users\Administrator\Desktop\��ҵ�������\������\r=24.jpg');%���������˲�������ͼ
%     B{j}=imread('C:\Users\Administrator\Desktop\��ҵ�������\������\r=40.jpg');%���뱾���㷨������ͼ
%     C{j}=imread('C:\Users\Administrator\Desktop\��ҵ�������\������\r=60.jpg');%��
%     �뱾���㷨������ͼ
    junzhi(j,1) = mean2(Y{j});   %ԭͼ�����ڵ�һ��
    junzhi(j,2) = mean2(M{j});
   % junzhi(j,3) = mean2(H{j});
%     junzhi(j,4) = mean2(G{j});
%     junzhi(j,5) = mean2(B{j});
%     junzhi(j,6) = mean2(C{j});
 
    biaozhuncha(j,1) = std2(Y{j});   %ԭͼ�����ڵ�һ��
    biaozhuncha(j,2) = std2(M{j});
   % biaozhuncha(j,3) = std2(H{j});
%     biaozhuncha(j,4) = std2(G{j});
%     biaozhuncha(j,5) = std2(B{j});
%     biaozhuncha(j,6) = std2(C{j});

    fangcha(j,1) = std2(Y{j})^2;   %ԭͼ�����ڵ�һ��
    fangcha(j,2) = std2(M{j})^2;
    %fangcha(j,3) = std2(H{j})^2;
%     fangcha(j,4) = std2(G{j})^2;
%     fangcha(j,5) = std2(B{j})^2;
%     fangcha(j,6) = std2(C{j})^2;

end
 xlswrite('D:\����������\��ֵ8.xls',junzhi,'sheet1');
 xlswrite('D:\����������\��׼��8.xls',biaozhuncha,'sheet1');
 xlswrite('D:\����������\����8.xls',fangcha,'sheet1');
 t=2

