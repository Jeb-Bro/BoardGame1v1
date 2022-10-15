%% Simulation Models
% Place both Chessboard models on (x,y,z) = (0,0,tableHeight)

hold on

squareSize = 0.0375;
height = 2.2737*10^-14;
tableHeight = 0;
PlaceObject('chessBoardLight.ply', [0,0,tableHeight]);
PlaceObject('chessBoardDark.ply', [0,0,tableHeight]);
    
%% Chess Pos Matrix
xPosMatrix = zeros(8,1);
yPosMatrix = zeros(8,1);

    for j = 1
        for i = -7:2:7
        xPosMatrix(j) = i*squareSize*0.5;
        yPosMatrix(j) = i*squareSize*0.5;
        j = j+1;
        end
    end
    
    
    %% Improved Placement Code
for i = 1:8
    
    % Pawns
    PlaceObject('wPawn.ply', [xPosMatrix(i), yPosMatrix(2), height+tableHeight]);
    PlaceObject('bPawn.ply', [xPosMatrix(i), yPosMatrix(7), height+tableHeight]);
    
    % Rooks
    if i == 1 || i == 8
        PlaceObject('wRook.ply', [xPosMatrix(i), yPosMatrix(1), height+tableHeight]);
        PlaceObject('bRook.ply', [xPosMatrix(i), yPosMatrix(8), height+tableHeight]);
    end
    
    % Knights
    if i == 2 || i == 7
        PlaceObject('wKnight.ply', [xPosMatrix(i), yPosMatrix(1), height+tableHeight]);
        PlaceObject('bKnight.ply', [xPosMatrix(i), yPosMatrix(8), height+tableHeight]);
    end
    
    % Bishops
    if i == 3 || i == 6
        PlaceObject('wBishop.ply', [xPosMatrix(i), yPosMatrix(1), height+tableHeight]);
        PlaceObject('bBishop.ply', [xPosMatrix(i), yPosMatrix(8), height+tableHeight]); 
    end
    
    % Queens
    if i == 4
        PlaceObject('wQueen.ply', [xPosMatrix(i), yPosMatrix(1), height+tableHeight]);
        PlaceObject('bQueen.ply', [xPosMatrix(i), yPosMatrix(8), height+tableHeight]); 
    end

    % Kings
    if i == 5
        PlaceObject('wKing.ply', [xPosMatrix(i), yPosMatrix(1), height+tableHeight]);
        PlaceObject('bKing.ply', [xPosMatrix(i), yPosMatrix(8), height+tableHeight]); 
    end
    

end

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





