%% Simulation Models
% Place both Chessboard models on (x,y,z) = (0,0,tableHeight)
camlight

hold on

squareSize = 0.0375;
height = 2.2737*10^-14;
tableHeight = 0.65-0.004928;
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
    
zOnChessboard = height + tableHeight;
zOffChessboard = tableHeight;
    
    
    %% Improved Placement Code
for i = 1:8
    
    % Pawns
% wPawn = PlaceObject('wPawn.ply', [xPos(i), yPos(2),zOnChessboard]);

%% White Pawn Placement Test Code   
    wPawn(i) = whitePawn;
    wPawn(i).model.base = transl([xPos(i),yPos(2),zOnChessboard]); %* trotz(pi);
    wPawn(1,i).model.plot(0.046, 'noarrow', 'nobase', 'nojoints', 'notiles', 'nowrist')

    bPawn = PlaceObject('bPawn.ply', [xPos(i), yPos(7),zOnChessboard]);
    
    
    % Rooks
    if i == 1 || i == 8
        wRook = PlaceObject('wRook.ply', [xPos(i), yPos(1), zOnChessboard]);
        bRook = PlaceObject('bRook.ply', [xPos(i), yPos(8), zOnChessboard]);
    end
    
    % Knights
    if i == 2 || i == 7
        wKnight = PlaceObject('wKnight.ply', [xPos(i), yPos(1), zOnChessboard]);
        bKnight = PlaceObject('bKnight.ply', [xPos(i), yPos(8), zOnChessboard]);
    end
    
    % Bishops
    if i == 3 || i == 6
        wBishop = PlaceObject('wBishop.ply', [xPos(i), yPos(1), zOnChessboard]);
        bBishop = PlaceObject('bBishop.ply', [xPos(i), yPos(8), zOnChessboard]); 
    end
    
    % Queens
    if i == 4
        wQueen = PlaceObject('wQueen.ply', [xPos(i), yPos(1), zOnChessboard]);
        bQueen = PlaceObject('bQueen.ply', [xPos(i), yPos(8), zOnChessboard]); 
    end

    % Kings
    if i == 5
        wKing = PlaceObject('wKing.ply', [xPos(i), yPos(1), zOnChessboard]);
        bKing = PlaceObject('bKing.ply', [xPos(i), yPos(8), zOnChessboard]);
    end
    

end

%% Table
PlaceObject('table.ply',[0,0,0]);

%% Extinguisher
% PlaceObject('FireExtingusher.ply',[0,0,0]);

%% Stop Button
PlaceObject('StopButton.ply',[-1,0.5,height]);

%% Barrier
PlaceObject('barrier.ply',[0,-1,0]);

%% Concrete floor
surf([-3,-3;3,3],[-3,3;-3,3],[-0.64,-0.64;-0.64,-0.64],'CData',imread('concrete.jpg'),'FaceColor','texturemap');





