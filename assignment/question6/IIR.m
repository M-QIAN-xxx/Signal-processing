function main
st=mstg;   %调用信号产生函数mstg产生由三路抑制载波调幅信号相加构成的复合信号s
Fs=10000; T=1/Fs;  %采样频率
fp=280; fs=450;wp=2*fp/Fs;ws=2*fs/Fs; %低通
   name='y_1(t)';LHL_filter(wp,ws,name,st,T,'low');
fp_L=440; fp_R=560;fs_L=275; fs_R=900;%带通
   wp=[2*fp_L/Fs,2*fp_R/Fs];ws=[2*fs_L/Fs,2*fs_R/Fs];
   name='y_2(t)'; LHL_filter(wp,ws,name,st,T,'bandpass');
fp=890; fs=600;wp=2*fp/Fs;ws=2*fs/Fs; %高通
   name='y_3(t)';LHL_filter(wp,ws,name,st,T,'high');
end
function LHL_filter(wp,ws,name,st,T,flag)
rp=0.1;rs=60; %DF指标（低通滤波器的通、阻带边界频）
[N,wp]=ellipord(wp,ws,rp,rs); %调用ellipord计算椭圆DF阶数N和通带截止频率wp?
[B,A]=ellip(N,rp,rs,wp,flag); %调用ellip计算椭圆带通DF系统函数系数向量B和A
yt=filter(B,A,st); %滤波器软件实现
 figure; freqz(B,A);%B,A分别为系统函数分子，分母多项式系数向量?
 figure;tplot(st,yt,T,name);
end
function tplot(st,xn,T,name)
%时域序列连续曲线绘图函数?
%?xn:信号数据序列，%?T为采样间隔
N=length(xn);n=0:N-1; t=n*T; Tp=N*T; f=n/Tp;
subplot(311);plot(t,xn);xlabel('t/s');ylabel(name);
axis([0,t(end),min(xn),1.2*max(xn)]);
subplot(312);stem(f,abs(fftshift(fft(st,N))));
title('原 st(t)的频谱');xlabel('f/Hz');ylabel('幅度');
subplot(313);stem(f,abs(fftshift(fft(xn,N))));
title('滤波后xn(t)的频谱');xlabel('f/Hz');ylabel('幅度');
end
function st=mstg
%产生信号序列向量st,并显示st的时域波形和频谱
%st=mstg 返回三路调幅信号相加形成的混合信号，长度N=1600
N=1600;Fs=10000;T=1/Fs;Tp=N*T; % N为信号st的长度。采样频率Fs=10kHz，Tp为采样时间
t=0:T:(N-1)*T;k=0:N-1;f=k/Tp;
fc1=Fs/10;fm1=fc1/10;%第1路调幅信号的载波频率fc1=1000Hz,调制信号频率fm1=100Hz
fc2=Fs/20;fm2=fc2/10;%第2路调幅信号的载波频率fc2=500Hz,调制信号频率fm2=50Hz
fc3=Fs/40;fm3=fc3/10;%第3路调幅信号的载波频率fc3=250Hz,调制信号频率fm3=25Hz                  
xt1=cos(2*pi*fm1*t).*cos(2*pi*fc1*t); %产生第1路调幅信号
xt2=cos(2*pi*fm2*t).*cos(2*pi*fc2*t); %产生第2路调幅信号
xt3=cos(2*pi*fm3*t).*cos(2*pi*fc3*t); %产生第3路调幅信号
st=xt1+xt2+xt3;         %三路调幅信号相加
fxt=fft(st,N);          %计算信号st的频谱
subplot(211);plot(t,st);xlabel('t/s');ylabel('s(t)');
axis([0,Tp/2,min(st),max(st)]);title('(a) s(t)的波形');
subplot(212);stem(f,abs(fxt)./max(abs(fxt)));
title('(频谱');xlabel('f/Hz');ylabel('幅度');
end