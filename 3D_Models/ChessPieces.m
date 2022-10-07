%% Simulation Models
squareSize = 0.0375;
height = 2.2737*10^-14;
PlaceObject('chessBoardLight.ply', [0,0,height]);
PlaceObject('chessBoardDark.ply', [0,0,height]);

%% Rooks
for i = -1:2:1
    PlaceObject('wRook.ply', [3.5*squareSize*i, -3.5*squareSize, height])
end

for i = -1:2:1
    PlaceObject('bRook.ply', [3.5*squareSize*i, 3.5*squareSize, height])
end

%% Knights
for i = -1:2:1
    PlaceObject('wKnight.ply', [2.5*squareSize*i, -3.5*squareSize, height])    
end

for i = -1:2:1
    PlaceObject('bKnight.ply', [2.5*squareSize*i, 3.5*squareSize, height])    
end

%% Bishops
for i = -1:2:1
    PlaceObject('wBishop.ply', [1.5*squareSize*i, -3.5*squareSize, height])    
end

for i = -1:2:1
    PlaceObject('bBishop.ply', [1.5*squareSize*i, 3.5*squareSize, height])    
end

%% Pawns
for i = -7:2:7
    PlaceObject('wPawn.ply', [squareSize*i*0.5, -2.5*squareSize, height])
end

for i = -7:2:7
    PlaceObject('bPawn.ply', [squareSize*i*0.5, 2.5*squareSize, height])
end

%% Queens
PlaceObject('wQueen.ply', [squareSize*-0.5, -3.5*squareSize, height])

PlaceObject('bQueen.ply', [squareSize*-0.5, 3.5*squareSize, height])

%% Kings
PlaceObject('wKing.ply', [squareSize*0.5, -3.5*squareSize, height])

PlaceObject('bKing.ply', [squareSize*0.5, 3.5*squareSize, height])
