function ChessEnvironment(~)
    hold on
    
    height = 2.2737*10^-14;
    tableHeight = 0;
    PlaceObject('chessBoardLight.ply', [0,0,tableHeight]);
    PlaceObject('chessBoardDark.ply', [0,0,tableHeight]);

    
    %% Table
    PlaceObject('table.ply',[0,0,-0.65]);

    %% Extinguisher
    % PlaceObject('FireExtingusher.ply',[0,0,0]);

    %% Stop Button
    PlaceObject('StopButton.ply',[-1,0.5,height]);

    %% Barrier
    PlaceObject('barrier.ply',[0,-1,0]);

    %% Concrete floor
    surf([-3,-3;3,3],[-3,3;-3,3],[-0.64,-0.64;-0.64,-0.64],'CData',imread('concrete.jpg'),'FaceColor','texturemap');

    camlight
end