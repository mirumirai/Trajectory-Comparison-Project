%After making trimList, this function is redundant.
%Returns trial numbers in a cell array with 2 lists. 1st list has
%0-deg trials, second has 179-deg trials.
function [dataRotSorted] = sortByRotation(Data)
    %initialize the sorted data cell array
    dataRotSorted = cell(1,2);
    
    %Preallocation of matrices for speed
    zeroDeg = zeros(length(Data),1);
    oneEightyDeg = zeros(length(Data),1);
    
    %Counting variables
    [zeroCount, oneEightyCount] = deal(0);
    
    %Trials are sorted into the two lists, since there are only 2 values for rotation
    for TrialNum=1:length(Data)
        if(Data(TrialNum).Parameters.TrialTubeParameters.rotation) == 0
            zeroCount = zeroCount + 1;
            zeroDeg(zeroCount,1) = TrialNum;            
        elseif(Data(TrialNum).Parameters.TrialTubeParameters.rotation) == 179
            oneEightyCount = oneEightyCount + 1;
            oneEightyDeg(oneEightyCount,1) = TrialNum;            
        else
            error(['Non-0 or 179 degree rotation detected at Trial ' num2str(TrialNum)]);
        end
    end
    
    %Trim after allocation
    zeroDeg = zeroDeg(1:zeroCount,1);
    oneEightyDeg = oneEightyDeg(1:oneEightyCount,1);
    
    %Assign to cell array to be returned
    dataRotSorted{1,1} = zeroDeg;
    dataRotSorted{1,2} = oneEightyDeg;
end
	
