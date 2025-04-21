function [] = EEGPlot(x,fs,rowIndex,data,peakNames)
xAxis = 0:1/fs:length(x)/fs;
xAxis = xAxis(:,1:end-1)';
figure;
plot(xAxis,x);
hold on;
for i = 1:size(peakNames,1)
    pattern = strcat(peakNames(i,:),'_');
    matchingColumns = startsWith(data.Properties.VariableNames,pattern);
    peakData = data(rowIndex,find(matchingColumns == 1));
    peakMatrix = table2array(peakData);
    if ~isnan(peakMatrix(:,:))
        position = peakMatrix(:,3);
        positionInSeconds = position/1000;
        positionInSampleIndex = round(positionInSeconds*fs);
        amp = x(1,positionInSampleIndex);
        plot(positionInSeconds, amp, 'v', 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r');
        text(positionInSeconds, amp + 0.2, peakNames(i,:), 'Color', 'k');
        hold on;
    end
end
xlabel("Time (s)")
ylabel("Amplitude (uV)")
hold on;
end

