%plot multiple tubes on same graph with decreasing thickness and changing color
function plotTubes(Data, tubes)
    figure; hold on;
    thickness = 20;
    rainbow = genRandColor;
    for i = 1:length(tubes)
        n = tubes(i);
        x = Data(n).Parameters.TrialTubeParameters.trajectory(:,1);
        y = Data(n).Parameters.TrialTubeParameters.trajectory(:,2);
        plot(x,y, 'LineWidth', thickness, 'Color', rainbow);
        if thickness ~= 1
            thickness = thickness-1;
        end
        rainbow = genRandColor;
        %plot start location with circle
        plot(Data(n).Parameters.TrialTubeParameters.trajectory(1,1), Data(n).Parameters.TrialTubeParameters.trajectory(1,2),'o');
    end
end