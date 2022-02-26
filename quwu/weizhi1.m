clear;
close all;
%读入图像
I=imread('C:\Users\14766\Desktop\雾天图像\bench_original.jpg');
%取输入图像的R分量
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

R0=double(R);
G0=double(G);
B0=double(B);
[N1,M1]=size(R);

Rlog=log(R0+1);
%对R分量进行二维傅里叶变换
Rfft2=fft2(R0);
%形成高斯滤波函数
sigma=128;
F=zeros(N1,M1);
for i=1:N1
    for j=1:M1
        F(i,j)=exp(-((i-N1/2)^2+(j-M1/2)^2)/(2*sigma*sigma));
    end
end
F=F./(sum(F(:)));
%对高斯滤波函数进行二维傅里叶变换
Ffft=fft2(double(F));
%对R分量与高斯滤波函数进行卷积运算
DR0=Rfft2.*Ffft;
DR=ifft2(DR0);
%在对数域中，用原函数图像减去低通滤波后的图像，得到高频增强的图像
DRdouble=double(DR);
DRlog=log(DRdouble+1);
Rr0=Rlog-DRlog;

sigma=256;
F=zeros(N1,M1);
for i=1:N1
    for j=1:M1
        F(i,j)=exp(-((i-N1/2)^2+(j-M1/2)^2)/(2*sigma*sigma));
    end
end
F=F./(sum(F(:)));
Ffft=fft2(double(F));
DR0=Rfft2.*Ffft;
DR=ifft2(DR0);
DRdouble=double(DR);
DRlog=log(DRdouble+1);
Rr1=Rlog-DRlog;

sigma=512;
F=zeros(N1,M1);
for i=1:N1
    for j=1:M1
        F(i,j)=exp(-((i-N1/2)^2+(j-M1/2)^2)/(2*sigma*sigma));
    end
end
F=F./(sum(F(:)));
Ffft=fft2(double(F));
DR0=Rfft2.*Ffft;
DR=ifft2(DR0);
DRdouble=double(DR);
DRlog=log(DRdouble+1);
Rr2=Rlog-DRlog;
Rr=(1/3)*(Rr0+Rr1+Rr2);

a=125;
II=imadd(R0,G0);
II=imadd(II,B0);
Ir=immultiply(R0,a);
C=imdivide(Ir,II);
C=log(C+1);
Rr=immultiply(C,Rr);
EXPRr=exp(Rr);
MIN=min(min(EXPRr));
MAX=max(max(EXPRr));
EXPRr=(EXPRr-MIN)/(MAX-MIN);
EXPRr=adapthisteq(EXPRr);

%对G分量
[N1,M1]=size(G);
G0=double(G);
Glog=log(G0+1);
Gfft2=fft2(G0);
sigma=128;
F=zeros(N1,M1);
for i=1:N1
    for j=1:M1
        F(i,j)=exp(-((i-N1/2)^2+(j-M1/2)^2)/(2*sigma*sigma));
    end
end
F=F./(sum(F(:)));
Ffft=fft2(double(F));
DG0=Gfft2.*Ffft;
DG=ifft2(DG0);
DGdouble=double(DG);
DGlog=log(DGdouble+1);
Gg0=Glog-DGlog;

sigma=256;
F=zeros(N1,M1);
for i=1:N1
    for j=1:M1
        F(i,j)=exp(-((i-N1/2)^2+(j-M1/2)^2)/(2*sigma*sigma));
    end
end
F=F./(sum(F(:)));
Ffft=fft2(double(F));
DG0=Gfft2.*Ffft;
DG=ifft2(DG0);
DGdouble=double(DG);
DGlog=log(DGdouble+1);
Gg1=Glog-DGlog;

sigma=512;
F=zeros(N1,M1);
for i=1:N1
    for j=1:M1
        F(i,j)=exp(-((i-N1/2)^2+(j-M1/2)^2)/(2*sigma*sigma));
    end
end
F=F./(sum(F(:)));
Ffft=fft2(double(F));
DG0=Gfft2.*Ffft;
DG=ifft2(DG0);
DGdouble=double(DG);
DGlog=log(DGdouble+1);
Gg2=Glog-DGlog;

Gg=(1/3)*(Gg0+Gg1+Gg2);

a=125;
II=imadd(R0,G0);
II=imadd(II,B0);
Ir=immultiply(R0,a);
C=imdivide(Ir,II);
C=log(C+1);
Gg=immultiply(C,Gg);
EXPGg=exp(Gg);
MIN=min(min(EXPGg));
MAX=max(max(EXPGg));
EXPGg=(EXPGg-MIN)/(MAX-MIN);
EXPGg=adapthisteq(EXPGg);

%对B分量
[N1,M1]=size(B);
B0=double(B);
Blog=log(B0+1);
Bfft2=fft2(B0);
sigma=128;
F=zeros(N1,M1);
for i=1:N1
    for j=1:M1
        F(i,j)=exp(-((i-N1/2)^2+(j-M1/2)^2)/(2*sigma*sigma));
    end
end
F=F./(sum(F(:)));
Ffft=fft2(double(F));
DB0=Bfft2.*Ffft;
DB=ifft2(DB0);
DBdouble=double(DB);
DBlog=log(DBdouble+1);
Bb0=Blog-DBlog;

sigma=256;
F=zeros(N1,M1);
for i=1:N1
    for j=1:M1
        F(i,j)=exp(-((i-N1/2)^2+(j-M1/2)^2)/(2*sigma*sigma));
    end
end
F=F./(sum(F(:)));
Ffft=fft2(double(F));
DB0=Bfft2.*Ffft;
DB=ifft2(DB0);
DBdouble=double(DB);
DBlog=log(DBdouble+1);
Bb1=Blog-DBlog;

sigma=512;
F=zeros(N1,M1);
for i=1:N1
    for j=1:M1
        F(i,j)=exp(-((i-N1/2)^2+(j-M1/2)^2)/(2*sigma*sigma));
    end
end
F=F./(sum(F(:)));
Ffft=fft2(double(F));
DB0=Bfft2.*Ffft;
DB=ifft2(DB0);
DBdouble=double(DB);
DBlog=log(DBdouble+1);
Bb2=Blog-DBlog;

Bb=(1/3)*(Bb0+Bb1+Bb2);

a=125;
II=imadd(R0,G0);
II=imadd(II,B0);
Ir=immultiply(R0,a);
C=imdivide(Ir,II);
C=log(C+1);
Bb=immultiply(C,Bb);
EXPBb=exp(Bb);
MIN=min(min(EXPBb));
MAX=max(max(EXPBb));
EXPBb=(EXPBb-MIN)/(MAX-MIN);
EXPBb=adapthisteq(EXPBb);
I0(:,:,1)=EXPRr;
I0(:,:,2)=EXPGg;
I0(:,:,3)=EXPBb;
figure(1)
subplot(1,2,1),imshow(I),title('原图');
subplot(1,2,2),imshow(I0),title('去雾图');