fo = 500; % frequency of the sine wave
Fs = 100; % sampling rate
Ts = 1/Fs; % sampling time interval
t = 0:Ts:1-Ts; % sampling period
n = length(t); % number of samples
x = 10*sin(2*pi*fo*t); % the sine curve

% plot the cosine curve in the time domain
sinePlot = figure;
plot(t,x);
xlabel('time (seconds)')
ylabel('x(t)')
title('Sample Sine Wave')
grid

% plot the frequence spectrum using the MATLAB fft command
matlabFFT = figure; % create a new figure
XfreqDomain = fft(x); % take the fft of our cos wave, x(t)

stem(abs(XfreqDomain)); % use abs command to get the magnitude
% similary, we would use angle command to get the phase plot!

xlabel('Sample Number')
ylabel('Amplitude')
title('Using the Matlab fft command')
grid