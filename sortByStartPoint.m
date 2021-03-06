%This recursive function automatically categorizes trials by start points, 
%even without specifying what the start points are.
%Should only have 1 input arg to manually specify. Varargin is for the 
%recursion. 
%
function [dataStartPtSorted] = sortByStartPoint(Data, varargin)
    switch nargin
        case 1
            trialList = [1:length(Data)];
            %since we are just starting, initialize the sorted cell array.
            dataStartPtSorted = cell(1);
            %add the first trial to trialList. A random trial may have
            %better performance, but we want the categorized data to be
            %internally clean (sorted lists inside the cell array) as well.
            dataStartPtSorted{1} = trialList(1);
            
        case 3
            trialList = varargin{1};
            dataStartPtSorted = varargin{2};
            %add first trial number to the end of sorted data
            dataStartPtSorted{end+1}=trialList(1);
            
        otherwise
            error('Wrong number of inputs');
    end
    
    %make the first trial easier to reference instead of typing sorted{end}(1)
    first = trialList(1);
    %remove trial
    trialList(1) = [];
    trialsToRemove = [];
    
    for i=1:length(trialList)
        %if the starting points are the same, add the trial to sorted data.
        if(Data(first).Parameters.TrialTubeParameters.trajectory(1,1)==Data(trialList(i)).Parameters.TrialTubeParameters.trajectory(1,1)) && (Data(first).Parameters.TrialTubeParameters.trajectory(1,2)==Data(trialList(i)).Parameters.TrialTubeParameters.trajectory(1,2))
            dataStartPtSorted{end}(end+1) = trialList(i);
            %add trial to list of trials to be removed
            trialsToRemove(end+1) = i;
        end
    end
    
    %remove trials
    trialList(trialsToRemove) = [];
    
    %If only one trial left, put it in its own category, and we are done
    if length(trialList) == 1
        dataStartPtSorted{end+1} = trialList;
        return
    %If no trials left, we are done.
    elseif isempty(trialList)
        return
    %Still have trials? We need to compare! Recurse!
    else
        dataStartPtSorted = sortByStartPoint(Data, trialList, dataStartPtSorted);
    end
    
end