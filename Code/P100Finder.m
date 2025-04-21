function [p100Location] = P100Finder(x,fs)
%P1FINDER Summary of this function goes here
%   Detailed explanation goes here

startInterval = (80/1000) * fs;
endInterval = (130/1000)*fs;

x1 = x(startInterval:endInterval,1);
xAxis = 0:1/fs:length(x1)/fs;
xAxis = xAxis(:,1:end-1)';
figure;
plot(xAxis,x1);
hold on;

z = findpeaks(x1,'NPeaks',3);
p100Location = [];
for i = 1:size(z,1)
    p100Location = [p100Location;find(x == z(i,1))];
end
p100Location = p100Location./8000;


fftx = fft(x1,fs)./fs;
fftx = db(abs(fftx(1:end/2,1)));
maxFreq = max(fftx);
xAxis = zeros(floor(size(fftx,1)),1);
for i = 1:size(xAxis,1)
    xAxis(i,1) = i .* fs/2/size(xAxis,1);
end



figure;
plot(xAxis,fftx);
hold on;
maxFreqLocation = find(fftx == maxFreq);
maxFreqValue = xAxis(maxFreqLocation,1);




end

