function [] = EEGMagPlot(x,fs)

x = downsample(x,32);
fftx = fft(x);
fftx = fftx';
fftx = db(abs(fftx(1:end/2,1)));
figure;
plot(fftx);
hold on;
end

