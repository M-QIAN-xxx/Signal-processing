function st=mstg
%产生信号序列向量st,并显示st的时域波形和频谱
%st=mstg; 返回三路调幅信号相加形成的混合信号，长度N=1600
N=2000;Fs=10000;T=1/Fs;Tp=N*T; % N为信号st的长度。采样频率Fs=10kHz，Tp为采样时间
t=0:T:(N-1)*T;k=0:N-1;f=k/Tp;
fc1=Fs/10;fm1=fc1/10;%第1路调幅信号的载波频率fc1=1000Hz,调制信号频率fm1=100Hz
fc2=Fs/20;fm2=fc2/10;%第2路调幅信号的载波频率fc2=500Hz,调制信号频率fm2=50Hz
fc3=Fs/40;fm3=fc3/10;%第3路调幅信号的载波频率fc3=250Hz,调制信号频率fm3=25Hz                  
xt1=cos(2*pi*fm1*t).*cos(2*pi*fc1*t); %产生第1路调幅信号
xt2=cos(2*pi*fm2*t).*cos(2*pi*fc2*t); %产生第2路调幅信号
xt3=cos(2*pi*fm3*t).*cos(2*pi*fc3*t); %产生第3路调幅信号
st=xt1+xt2+xt3;         %三路调幅信号相加
fxt=fft(st,N);          %计算信号st的频谱
subplot(2,1,1);plot(t,st);xlabel('t/s');ylabel('s(t)');
title(['N=',num2str(N),'s(t)的波形']);axis([0,Tp/8,min(st),max(st)]);
subplot(2,1,2);stem(f,abs(fxt)/max(abs(fxt)));
title(['N=',num2str(N),'s(t)的频谱']);xlabel('f/Hz');ylabel('幅度');
 axis([0,Fs/5,0,1.2]);
end