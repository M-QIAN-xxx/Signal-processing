clc;
clear;
TuneJazz = load('TuneJazz.mat'); %Replace the content in quotes with the address of your TuneJazz.mat file
x = TuneJazz.TuneS; %Assign the variable Tunes referenced from TuenJazz to x

% Using Moving average filter
windowSize = 1000; % you can change the WindowSize as you like
b = (1/windowSize)*ones(1,windowSize);
a = 10;
y = filter(b,a,x);
plot(x);
hold on;
plot(y)
legend('Input Data','Filter Data');
sound(y,Fs);
