%%
% 1.1. DH-params for robots. Model 2nd robot
% 1.2. RMRC integration 

% 2. Include a GUI. Individual joint movement, Cartesian movements. Try to
% implement joystick/gamepad implementation.
% https://au.mathworks.com/help/matlab/creating_guis/create-a-simple-app-or-gui-using-app-designer.html
%  appdesigner.internal.application.openTutorial('BasicCoding')

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

%% Default phase to show pieces and arms
Default_phase();
disp('Default environment layout')
disp('Press Enter to Continue')
pause;

%% Setup
clc;
clf;
clear all;
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

ChessHeight = 0.08;
   
%% Environment + Chess board & pieces creation 
ChessEnvironment();

%% Call robots

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

% blackbishop translate base
% piece_Type = 'bBishop';
% piece_pose = transl([xPosMatrix(3), yPosMatrix(1),0]);
% piece_Color = [0,0,0]/255;
% blackbishop = blackbish([piece_Type,'.ply'],piece_pose,piece_Color);

%% Change workplace view 
xlim([-1.5 1.5]);
ylim([-1.5 1.5]);
zlim([-0.65 1]);

%% UR5 Scenario 1 test
Scenario1 = ChessScenario1;
objectTr = transl(0,0,0);
steps = 25;
% Default Joint states
UR5jd= [90 0 90 0 -90 0 0]*pi/180;
i5jd = [-90 0 90 0 -90 0 0]*pi/180;

%% Move 1
%White Move
wQueen1CurrentPose = transl([xPosMatrix(2), yPosMatrix(2), ChessHeight])
wQueen1EndPose = transl([xPosMatrix(2), yPosMatrix(4),ChessHeight])

q1 = UR5bot.model.ikcon(wQueen1CurrentPose*trotx(pi)*trotz(pi))

q2 = UR5bot.model.ikcon(wQueen1EndPose*trotx(pi)*trotz(pi))

RMRC(UR5bot,q1,steps);
RMRC(UR5bot,q2,steps);

Scenario1.wQueen1.base = transl([xPosMatrix(2), yPosMatrix(4),0]);
Scenario1.MovewQueen1(Scenario1.wQueen1.getpos);

RMRC(UR5bot,UR5jd,steps);

% Black Move 
bKingCurrentPose = transl([xPosMatrix(5), yPosMatrix(4), ChessHeight]);
bKingEndPose = transl([xPosMatrix(4), yPosMatrix(5),ChessHeight]);

q1 = i5bot.model.ikcon(bKingCurrentPose*trotx(pi)*trotz(pi));
q2 = i5bot.model.ikcon(bKingEndPose*trotx(pi)*trotz(pi));

RMRC(i5bot,q1,steps);

RMRC(i5bot,q2,steps);
Scenario1.bKing.base = transl([xPosMatrix(4), yPosMatrix(5),0]);
Scenario1.MovebKing(Scenario1.bKing.getpos);

RMRC(i5bot,i5jd,steps);

    %% Move 2
q1 = UR5bot.model.getpos
T1 = transl([xPosMatrix(1), yPosMatrix(3), ChessHeight])*trotx(pi)*trotz(pi)

q2 = UR5bot.model.ikcon(T1)
T2 = transl([xPosMatrix(1), yPosMatrix(5), ChessHeight])*trotx(pi)*trotz(pi)

q3 = UR5bot.model.ikcon(T2)

q4 = i5bot.model.getpos
T4 = transl([xPosMatrix(4), yPosMatrix(5), ChessHeight])*trotx(pi)*trotz(pi)

q5 = i5bot.model.ikcon(T4)
T5 = transl([xPosMatrix(3), yPosMatrix(6), ChessHeight])*trotx(pi)*trotz(pi)

q6 = i5bot.model.ikcon(T5)

RMRC(UR5bot,q2,steps);
RMRC(UR5bot,q3,steps);
Scenario1.wQueen2.base = transl([xPosMatrix(1), yPosMatrix(5),0]);
Scenario1.MovewQueen2(Scenario1.wQueen2.getpos);
RMRC(UR5bot,UR5jd,steps);

RMRC(i5bot,q5,steps);
RMRC(i5bot,q6,steps);
Scenario1.bKing.base = transl([xPosMatrix(3), yPosMatrix(6),0]);
Scenario1.MovebKing(Scenario1.bKing.getpos);
RMRC(i5bot,i5jd,steps);

    %% Move 3
q1 = UR5bot.model.getpos
T1 = transl([xPosMatrix(2), yPosMatrix(4), ChessHeight])*trotx(pi)*trotz(pi)

q2 = UR5bot.model.ikcon(T1)
T2 = transl([xPosMatrix(2), yPosMatrix(6), ChessHeight])*trotx(pi)*trotz(pi)

q3 = UR5bot.model.ikcon(T2)

q4 = i5bot.model.getpos
T4 = transl([xPosMatrix(3), yPosMatrix(6), ChessHeight])*trotx(pi)*trotz(pi)

q5 = i5bot.model.ikcon(T4)
T5 = transl([xPosMatrix(4), yPosMatrix(7), ChessHeight])*trotx(pi)*trotz(pi)

q6 = i5bot.model.ikcon(T5)

RMRC(UR5bot,q2,steps);
RMRC(UR5bot,q3,steps);
Scenario1.wQueen1.base = transl([xPosMatrix(2), yPosMatrix(6),0]);
Scenario1.MovewQueen1(Scenario1.wQueen1.getpos);
RMRC(UR5bot,UR5jd,steps);

RMRC(i5bot,q5,steps);
RMRC(i5bot,q6,steps);
Scenario1.bKing.base = transl([xPosMatrix(4), yPosMatrix(7),0]);
Scenario1.MovebKing(Scenario1.bKing.getpos);
RMRC(i5bot,i5jd,steps);

    %% Move 4
q1 = UR5bot.model.getpos
T1 = transl([xPosMatrix(1), yPosMatrix(5), ChessHeight])*trotx(pi)*trotz(pi)

q2 = UR5bot.model.ikcon(T1)
T2 = transl([xPosMatrix(1), yPosMatrix(7), ChessHeight])*trotx(pi)*trotz(pi)

q3 = UR5bot.model.ikcon(T2)

q4 = i5bot.model.getpos
T4 = transl([xPosMatrix(4), yPosMatrix(7), ChessHeight])*trotx(pi)*trotz(pi)

q5 = i5bot.model.ikcon(T4)
T5 = transl([xPosMatrix(3), yPosMatrix(8), ChessHeight])*trotx(pi)*trotz(pi)

q6 = i5bot.model.ikcon(T5)

RMRC(UR5bot,q2,steps);
RMRC(UR5bot,q3,steps);
Scenario1.wQueen2.base = transl([xPosMatrix(1), yPosMatrix(7),0]);
Scenario1.MovewQueen2(Scenario1.wQueen2.getpos);
RMRC(UR5bot,UR5jd,steps);

RMRC(i5bot,q5,steps);
RMRC(i5bot,q6,steps);
Scenario1.bKing.base = transl([xPosMatrix(3), yPosMatrix(8),0]);
Scenario1.MovebKing(Scenario1.bKing.getpos);
RMRC(i5bot,i5jd,steps);

    %% Move 4
q1 = UR5bot.model.getpos
T1 = transl([xPosMatrix(2), yPosMatrix(6), ChessHeight])*trotx(pi)*trotz(pi)

q2 = UR5bot.model.ikcon(T1)
T2 = transl([xPosMatrix(2), yPosMatrix(8), ChessHeight])*trotx(pi)*trotz(pi)

q3 = UR5bot.model.ikcon(T2)

RMRC(UR5bot,q2,steps);
RMRC(UR5bot,q3,steps);
Scenario1.wQueen1.base = transl([xPosMatrix(2), yPosMatrix(8),0]);
Scenario1.MovewQueen1(Scenario1.wQueen1.getpos);
RMRC(UR5bot,UR5jd,steps);

display('Checkmate! White Wins')