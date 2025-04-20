function [] = labelPeaksOnEEGPlot(x, fs, peakName, rowInx)
%Data
peakTableName = [peakName 'Data'];
peakTable = evalin('base', peakTableName); 
%Find latency
latPos_ms = peakTable{rowInx, [peakName '_LatPos_ms_']};
latNeg_ms = peakTable{rowInx, [peakName '_LatNeg_ms_']};
%Not labeling the NaN values
validPosIdx = ~isnan(latPos_ms);
validNegIdx = ~isnan(latNeg_ms);
latPos_s = latPos_ms(validPosIdx) / 1000;
latNeg_s = latNeg_ms(validNegIdx) / 1000;
%get amplitude
pos_idx = round(latPos_s * fs);
neg_idx = round(latNeg_s * fs);
pos_amps = x(pos_idx);
neg_amps = x(neg_idx);
latPos_s = (pos_idx - 1) / fs;
latNeg_s = (neg_idx - 1) / fs;
%Plot the markers
hold on;
plot(latPos_s, pos_amps, 'v', 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r'); 
plot(latNeg_s, neg_amps, '^', 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r'); 
%Add text for Peak Name
for i = 1:length(latPos_s)
    text(latPos_s(i), pos_amps(i) + 0.2, peakName, 'Color', 'k');
end

end