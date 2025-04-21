function [p100Location] = P100Finder(x,fs)
%P1FINDER Summary of this function goes here
%   Detailed explanation goes here

startInterval = (80/1000) * fs;
endInterval = (130/1000)*fs;

[zAmp,zLoc] = findpeaks(x,'NPeaks',100);

p100Location = [zAmp,zLoc];

subP100Location = [];
for i = 1:size(p100Location,1)
    if p100Location(i,2) >= startInterval && p100Location(i,2) <= endInterval
        subP100Location = [subP100Location ; [p100Location(i,:)];                                                                                                                                                        ]
    end
end

p100Location = subP100Location;

subP100Location = p100Location(1,:);
for i = 1 : size(p100Location,1)
    if subP100Location(1,1) < p100Location(i,1)
        subP100Location = p100Location(i,:);
    end    
end

p100Location = subP100Location;
end

