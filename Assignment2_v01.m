%%
% 1.1. DH-params for robots. Model 2nd robot
% 1.2. RMRC integration 

% 2. Include a GUI. Individual joint movement, Cartesian movements. Try to
% implement joystick/gamepad implementation.

% 3. Functional e-stop. Must be able to resume after e-stop. using uiwait() 
% NOT allowed. 

% 4. Simulate environment including safety hardware. Have active sensors (BONUS)

% 5. Safety: Prevent Collisions (stop when 'simulated' object is placed in 
% path of arm trajectory), To make one robot retreat from a simulated safety 
% symbol that is held by the second robot using visual servoing and RMRC

%%
clc;
clf;
clear all;
% startup_rvc;

%% Setup
% workspace = [-1 2 -2 2 -1 2];
% qrx = [0 0 0 -pi/2 0 0 0 0];
% scale1 = 0.4;

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
    
hold on;

%% Environment + Chess board & pieces creation 
ChessEnvironment();
% ChessPieces;

%% Call robots

UR5bot = UR5arm;
% i5bot = AUBOi5;
Scenario1 = ChessScenario1;

% UR5 translate base
UR5bot.model.base = transl([-0.3,0.4,-0.03]);
UR5bot.MoveRobot(UR5bot.model.getpos);
% UR5bot.model.teach;
% UR5bot.modelGripper{1}.teach

% i5 translate base
% i5bot.model.base = transl([0.3,-0.4,-0.03]);
% i5bot.MoveRobot(i5bot.model.getpos);
% i5bot.model.teach;

% blackbishop translate base
% piece_Type = 'bBishop';
% piece_pose = transl([xPosMatrix(3), yPosMatrix(1),0]);
% piece_Color = [0,0,0]/255;
% blackbishop = blackbish([piece_Type,'.ply'],piece_pose,piece_Color);



%% Change workplace view 
xlim([-1.5 1.5]);
ylim([-1.5 1.5]);
zlim([-0.65 1]);

% xlim([-0.6 -0.2])
% ylim([0.4 0.6])
% zlim([0.8 1.1])

% xlim([-0.2 0.2]);
% ylim([-0.2 0.2]);
% zlim([-0.1 0.1]);

%% UR5 RMRC function test
objectTr = transl(0,0,0);
steps = 50;
UR5jd= [90 0 90 0 -90 0 0]*pi/180;
i5jd = [-90 0 90 0 -90 0 0]*pi/180;

currentPiecePose = Scenario1.wQueen1.base;
currentPieceEndPose = transl([xPosMatrix(2), yPosMatrix(4),0]);

qPick = [133 0 129 40 270 43.2 0]*pi/180; % Change this to chess location 
RMRC(UR5bot,qPick,steps,Scenario1,objectTr);
pause(1);

qPick = UR5jd; % Change this to chess location 
RMRC(UR5bot,qPick,steps,Scenario1,objectTr);
pause(1);


