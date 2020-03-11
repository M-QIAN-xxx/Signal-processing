n = normrnd(0,sqrt(0.3),1,40);

x1 = cos(1 * n);
x2 = cos(5 * n);
g1 = x1 + n;
g2 = x2 + n;

noise = figure;
plot(n);
title('noise')

% signal = figure;
% plot(x);
% title('original signal')
% 
% newsignal = figure;
% plot(g);
% title('new signal')

m = 40;

fn1 = (x1 - g1).^2;
fn2 = (x2 - g2).^2;

Eem1 = sum(fn1);
Eem2 = sum(fn2);

M1 = Eem1 / m;
M2 = Eem2 / m;