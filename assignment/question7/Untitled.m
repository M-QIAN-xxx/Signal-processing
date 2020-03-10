n = normrnd(0,sqrt(0.3),1,100);

x = cos(1.5 * n);

g = x + n;

% noise = figure;
% plot(n);
% title('noise')
% 
% 
% signal = figure;
% plot(x);
% title('original signal')
% 
% 
% newsignal = figure;
% plot(g);
% title('new signal')

m = 50;
fn = (x - g).^2;
Eem = sum(fn);