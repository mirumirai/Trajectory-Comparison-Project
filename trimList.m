%For use with specially formatted trial data.
%This function trims a list of trials by various user-specified parameters.
%The first input is always the list. The second is the name of the property
%to be trimmed, without the preceding "Data(x,y)." Ex. Use the string
%"Parameters.TrialTubeParameters.tubeType" to trim by tubetype. After a
%property, the next input is always a list containing the property values
%to trim. Ex. to trim tubetypes 0 and 5, use the list [0 5]. Property
%values must be the same type (['jeffy' 1] won't work).

%This example will trim tubetypes 0 and 5 as well as unsuccessful trials.
%trimmedList = trimList(Data, dataList, 'Overview.trialStatus', [0], 
%'Parameters.TrialTubeParameters.tubeType', [0 5])

%Maybe for future versions - enable boolean logic?
function [trimmedList] = trimList(Data, trialList, varargin)
    switch nargin
        case 0
            error('Wrong number of inputs');
        case 1
            error('Wrong number of inputs');
        case 2
            error('Wrong number of inputs');
        otherwise
            %Must have even number of variable input arguments. 
            if mod(length(varargin),2) == 1
                error('Wrong number of inputs');
            end 
    end
    trimmedList = trialList;
    %Super nested loop time! O(n^3) shouldn't be a speed problem though for
    %expected normal use, however, since all 3 layers should be small.
    %Loop through properties to trim and trim from the list
    for i = 1:2:length(varargin)
        %Loop through the parameters to be trimmed
        for j = 1:length(varargin{i+1})
            trialsToRemove = [];
            %loop and keep track of which trials to trim.
            for k = 1:length(trimmedList)
                %make a string for eval() to use
                property = strcat('Data(', num2str(trimmedList(k)), ').',varargin{i});
                %use string comparison in case property is a string.
                if strcmp(num2str(eval(property)),num2str(varargin{i+1}(j)))
                    trialsToRemove(end+1) = k;
                end
            end
            %trim the list
            trimmedList(trialsToRemove) = [];
        end        
    end
end