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
% hold on;

%% Environment + Chess board & pieces creation 
ChessEnvironment();
ChessPieces;

%% Call robots

UR5bot = UR5arm;
% i5bot = AUBOi5;

% UR5 plot and translate
UR5bot.model.base = transl([-0.35,0.5,-0.03]);
UR5bot.MoveRobot(UR5bot.model.getpos);
% UR5bot.model.teach;
% UR5bot.modelGripper{1}.teach

% i5 plot and translate
% i5bot.model.base = transl([0.35,-0.5,-0.03]);
% i5bot.MoveRobot(UR5bot.model.getpos);
% i5bot.model.teach;

%% Change workplace view 
xlim([-1.5 1.5]);
ylim([-1.5 1.5]);
zlim([-0.65 1]);

% xlim([-0.6 -0.2])
% ylim([0.4 0.6])
% zlim([0.8 1.1])

%% UR5 RMRC function test
qPick = [133 0 129 40 270 43.2 0]*pi/180; % Change this to chess location 
steps = 100;

RMRC(UR5bot,qPick,steps);


