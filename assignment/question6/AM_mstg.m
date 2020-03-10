function AM_mstg
N=2000; Fs=10000;T=1/Fs;Tp=N*T;t=0:T:(N-1)*T;k=0:N-1;f=k/Tp;
fc1=Fs/10;fm1=fc1/10;%第1路调幅信号的载波频率fc1=1000Hz,调制信号频率fm1=100Hz
fc2=Fs/20;fm2=fc2/10;%第2路调幅信号的载波频率fc2=500Hz,调制信号频率fm2=50Hz
fc3=Fs/40;fm3=fc3/10;%第3路调幅信号的载波频率fc3=250Hz,调制信号频率fm3=25Hz
xt1=[1+cos(2*pi*fm1*t)].*cos(2*pi*fc1*t);
xt2=[1+cos(2*pi*fm2*t)].*cos(2*pi*fc2*t);
xt3=[1+cos(2*pi*fm3*t)].*cos(2*pi*fc3*t);
st=xt1+xt2+xt3;fxt=fft(st,N);
subplot(211);plot(t,st);xlabel('t/s');ylabel('s(t)');
axis([0,Tp/8,min(st),max(st)]);title(['N=',num2str(N),' AM s(t)波形图'])
subplot(212);stem(f,abs(fxt)/max(abs(fxt)));title(['N= ',num2str(N),'频谱图'])
axis([0,Fs/5,0,1.2]);xlabel('f/Hz');ylabel('幅度');
end