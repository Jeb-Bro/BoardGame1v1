clf;
hold on;
squareSize = 0.0375;
height = 2.2737*10^-14;
tableHeight = 0;
    
% Chess Pos Matrix
xPosMatrix = zeros(8,1);
yPosMatrix = zeros(8,1);

for j = 1
    for i = -7:2:7
    xPosMatrix(j) = i*squareSize*0.5;
    yPosMatrix(j) = i*squareSize*0.5;
    j = j+1;
    end
end
   

ChessEnvironment();
ChessPieces;

UR5bot = UR5arm;
i5bot = AUBOi5;

% UR5 translate base
UR5bot.model.base = transl([-0.4,0.3,-0.03]);
UR5bot.MoveRobot(UR5bot.model.getpos);
% UR5bot.model.teach;
% UR5bot.modelGripper{1}.teach

% i5 translate base
i5bot.model.base = transl([0.4,-0.3,-0.03]);
i5bot.MoveRobot(i5bot.model.getpos);
% i5bot.model.teach;