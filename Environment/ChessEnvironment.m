function ChessEnvironment(~)
    hold on
    
    height = 2.2737*10^-14;
    tableHeight = 0;
    
    %% Chess board
    PlaceObject('chessBoardLight.ply', [0,0,tableHeight]);
    PlaceObject('chessBoardDark.ply', [0,0,tableHeight]);

    
    %% Furniture
    PlaceObject('table.ply',[0,0,-0.65]);
    PlaceObject('stool.ply',[0,-0.9,-0.65]);

    %% Extinguisher
    PlaceObject('Extingusher.ply',[1.5,-0.5,-0.65]);

    %% Stop Buttons
    PlaceObject('StopButton.ply',[1.3,0.5,tableHeight]);
    PlaceObject('StopButton.ply',[1.3,-0.5,tableHeight]);
    
    %% Place Humans
    PlaceObject('ColoredMan.ply',[2,-0.5,-0.65]);
%     PlaceObject('man_sit.ply',[0,-0.9,-0.65]);

    %% Barrier
%     PlaceObject('barrier.ply',[0,-1,0]);

    %% Concrete floor + Wallpaper
    surf([-3,-3;3,3],[-3,3;-3,3],[-0.64,-0.64;-0.64,-0.64],'CData',imread('concrete.jpg'),'FaceColor','texturemap');
    surf([-3,-3;3,3],[3,3;3,3],[-0.64,1.5;-0.64,1.5],'CData',imread('brick.jpg'),'FaceColor','texturemap');
    surf([-3,-3;-3,-3],[-3,-3;3,3],[-0.64,1.5;-0.64,1.5],'CData',imread('brick.jpg'),'FaceColor','texturemap');

    camlight
end