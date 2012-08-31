0%%
%Look at tube types
for n=1:length(Data)
    testArray(n,1) = Data(n).Parameters.TrialTubeParameters.tubeType;
end
%%
%Plot a tube specified by n
n = 91;
x = Data(n).Parameters.TrialTubeParameters.trajectory(:,1);
y = Data(n).Parameters.TrialTubeParameters.trajectory(:,2);
plot(x,y); hold on;
%plot start with green
plot(Data(n).Parameters.TrialTubeParameters.trajectory(1,1), Data(n).Parameters.TrialTubeParameters.trajectory(1,2),'o');
%print out tube type
disp(Data(n).Parameters.TrialTubeParameters.tubeType);
%%
%Do any tubes start out the same?
zeroCount = 0;
for n = 1:length(Data)
    for i=1:length(Data)
        if(Data(n).Parameters.TrialTubeParameters.trajectory(1,1)==Data(i).Parameters.TrialTubeParameters.trajectory(1,1)) && (Data(n).Parameters.TrialTubeParameters.trajectory(1,2)==Data(i).Parameters.TrialTubeParameters.trajectory(1,2))
            zeroCount = zeroCount + 1;
            internal(zeroCount,1) = n;
            internal(zeroCount,2) = i;
        end
    end
end
%%
%Removing elements from a list
A = 1:10 % 1-D array
ind = [1 4 7] % indices to be removed
A(ind) = [] % remove
%%
%plot multiple tubes on same graph with decreasing thickness and changing color
figure; hold on;
trialsToPlot = trimmedList; %insert trial list here
thickness = 20;
red = 1;
[green, blue] = deal(0);
rainbow = [red green blue];
for i = 1:length(trialsToPlot)
    n = trialsToPlot(i);
    x = Data(n).Parameters.TrialTubeParameters.trajectory(:,1);
    y = Data(n).Parameters.TrialTubeParameters.trajectory(:,2);
    plot(x,y, 'LineWidth', thickness, 'Color', rainbow);
    if thickness ~= 1
        thickness = thickness-1;
    end
    if red > .2
        red = red - .1;
    end
    if blue < .9
        blue = blue + .1;
    end
    if green < .8
        green = green + .2;
    end
    rainbow = [red green blue];    
    %plot start with circle
    plot(Data(n).Parameters.TrialTubeParameters.trajectory(1,1), Data(n).Parameters.TrialTubeParameters.trajectory(1,2),'o');
end
%%
for i=1:length(Data)
    disp(Data(i).Overview.trialStatus)
end