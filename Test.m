0%%
%Look at tube types
for n=1:length(Data)
    testArray(n,1) = Data(n).Parameters.TrialTubeParameters.tubeType;
end
%%
%Plot a tube specified by n
n = 75;
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
%plot multiple tubes on same graph
figure; hold on;
trialsToPlot = testing2{1}; %insert trial list here
for i = 1:length(trialsToPlot)
    n = trialsToPlot(i);
    x = Data(n).Parameters.TrialTubeParameters.trajectory(:,1);
    y = Data(n).Parameters.TrialTubeParameters.trajectory(:,2);
    plot(x,y);
    %plot start with green
    plot(Data(n).Parameters.TrialTubeParameters.trajectory(1,1), Data(n).Parameters.TrialTubeParameters.trajectory(1,2),'o');
end
