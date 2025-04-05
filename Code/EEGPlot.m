function [] = EEGPlot(x,fs)
xAxis = 0:1/fs:length(x)/fs;
xAxis = xAxis(:,1:end-1)';
figure;
plot(xAxis,x);
xlabel("Time (s)")
ylabel("Amplitude (uV)")
hold on;
end

