function ChessEnvironment(~)
    hold on
    
    height = 2.2737*10^-14;
    tableHeight = 0;
    itemtableheight= -0.03;
    floor = -0.65;
    
    %% Chess board
    PlaceObject('chessBoardLight.ply', [0,0,tableHeight]);
    PlaceObject('chessBoardDark.ply', [0,0,tableHeight]);

    
    %% Furniture
    PlaceObject('table.ply',[0,0,floor]);
    PlaceObject('stool.ply',[0,-0.9,floor]);
    PlaceObject('timer.ply',[-0.25,0,itemtableheight]);

    %% Extinguisher
    PlaceObject('Extingusher.ply',[1.5,-0.5,floor]);

    %% Stop Buttons
    PlaceObject('StopButton.ply',[1.3,0.5,itemtableheight]);
    PlaceObject('StopButton.ply',[1.3,-0.5,itemtableheight]);
    
    %% Place Humans
    PlaceObject('ColoredMan.ply',[2,-0.5,floor]);
    PlaceObject('man_sit.ply',[0,-0.9,floor]);

    %% Barrier
    PlaceObject('barrier.ply',[1,-2,floor]);
    PlaceObject('barrier.ply',[-1,-2,floor]);
    PlaceObject('barrier.ply',[1,2,floor]);
    PlaceObject('barrier.ply',[-1,2,floor]);
    PlaceObject('barrier1.ply',[-2,1,floor]);
    PlaceObject('barrier1.ply',[-2,-1,floor]);
    
    %% Curtain
    PlaceObject('Curtain.ply',[0,-0.55,itemtableheight]);
    PlaceObject('Curtain.ply',[0,0.55,itemtableheight]);
    
    %% Concrete floor + Wallpaper
    surf([-3,-3;3,3],[-3,3;-3,3],[-0.64,-0.64;-0.64,-0.64],'CData',imread('concrete.jpg'),'FaceColor','texturemap');
    surf([-3,-3;3,3],[3,3;3,3],[-0.64,1.5;-0.64,1.5],'CData',imread('brick.jpg'),'FaceColor','texturemap');
    surf([-3,-3;-3,-3],[-3,-3;3,3],[-0.64,1.5;-0.64,1.5],'CData',imread('brick.jpg'),'FaceColor','texturemap');

    camlight
end