function [] = EEGMagPlot(x,fs)

x = downsample(x,128);
fs = fs./128;
fftx = fft(x)./fs;
fftx = fftx';
fftx = db(abs(fftx(1:end/2,1)));
xAxis = zeros(floor(size(x,2)/2),1);
for i = 1:size(xAxis,1)
    xAxis(i,1) = i .* fs/2/size(xAxis,1);
end
figure;
plot(xAxis,fftx);
xlabel("Hz")
ylabel("dBv")
hold on;
end

