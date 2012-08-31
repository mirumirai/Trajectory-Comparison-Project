clear;
%if not loaded yet,
load('20110420tubes.mat')

startPtData = sortByStartPoint(Data);

%groupedData will have 0 degree groups on the first row and 180 degree
%groups on the second row
groupedData = cell(0);

%loop through startPtData. Trim unsuccessful, 0 & 5 tubetype, and 180
%degrees. Then trim 0 degrees. Not efficient, but it works.

for i = 1:length(startPtData)
    %trim and add to horizontal end of groupedData
    groupedData{1,i} = trimList(Data, startPtData{i},...
        'Parameters.TrialTubeParameters.rotation', 179,...
        'Parameters.TrialTubeParameters.tubeType', [0 5],...
        'Overview.trialStatus', 0);
    groupedData{2,i} = trimList(Data, startPtData{i},...
        'Parameters.TrialTubeParameters.rotation', 0,...
        'Parameters.TrialTubeParameters.tubeType', [0 5],...
        'Overview.trialStatus', 0);
end

%example plot of tubes in both orientations starting from the same point
plotTubes(Data, groupedData{1,1});
plotTubes(Data, groupedData{2,1});