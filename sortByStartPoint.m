%This recursive function automagically categorizes trials by start points, 
%even without specifying what the start points are.
%Should only have 1 input arg to manually specify. Varargin is for the 
%recursion.

%Author
%
function[sorted] = sortByStartPoint(Data, varargin)
    switch nargin
        case 0
            trialList = [1:length(Data)];
            %since we are just starting, initialize the sorted cell array.
            sorted = cell(1);
            %add the first trial to trialList. A random trial may have
            %better performance, but we want the categorized data to be
            %internally clean (sorted lists inside the cell array) as well.
            sorted{1} = trialList(1);
            
        case 1
            trialList = varargin(1);
            %add first trial number to the end of sorted data
            sorted(end+1)=trialList(1);
            
        otherwise
            error('Too many inputs to sortByStartPoint()');
    end
    
    %remove trial
    trialList(1) = [];

    for i=1:length(Data)
        if(Data(n).Parameters.TrialTubeParameters.trajectory(1,1)==Data(i).Parameters.TrialTubeParameters.trajectory(1,1)) && (Data(n).Parameters.TrialTubeParameters.trajectory(1,2)==Data(i).Parameters.TrialTubeParameters.trajectory(1,2))
            zeroCount = zeroCount + 1;
            internal(zeroCount,1) = n;
            internal(zeroCount,2) = i;
        end
    end

    %If only one trial left, put it in its own category, and we are done
    if length(trialList) == 1
        sorted{end+1} = trialList();
        return;
    %If no trials left, we are done.
    elseif length(trialList) == 0
        return;
    %Still have trials? We need to compare! Recurse!
    else
        sortByStartPoint(Data, trialList);
    end
    
end

%{ 
Pseudocode	
Function[sorted] = sort(Data, triallist)
		Trial = triallist(1)
		Remove Trial from triallist
		Add trial to sorted
		Tempremove =[], count=0
		For n = 1:length(triallist)
			If (Data(trial).x == Data(trialist(n)).x) &&( Data(trial).y == Data(triallist(n)).y)

Tempremove(n), count = 1
}%