## Author: zahra <zahra@zahra-Lenovo-ideapad-500-15ISK>
## Created: 2019-06-06

[x, fs] = audioread('v0.wav'); ##data and sampling frequency
y = fft(x); ##fast fourier transfer on signal data
n = length(x);
f = (0:n-1)*(fs/n); ##fs/n: frequency increment --> frequency range
power = (abs(y) .^ 2)/n;

plot(f,power)
xlabel('Frequency')
ylabel('Power')