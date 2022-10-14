%%
% 1. DH-params for robots. Model 2nd robot

% 2. Include a GUI. Individual joint movement, Cartesian movements. Try to
% implement joystick/gamepad implementation.

% 3. Functional e-stop. Must be able to resume after e-stop. using uiwait() 
% NOT allowed. 

% 4. Simulate environment including safety hardware. Have active sensors (BONUS)

% 5. Safety: Prevent Collisions (stop when 'simulated' object is placed in 
% path of arm trajectory), To make one robot retreat from a simulated safety 
% symbol that is held by the second robot using visual servoing and RMRC

%%
clc
clf
clear all
startup_rvc;

%% Setup
scale1 = 0.3;
scale2 = 0.5;
workspace = [-1.5 1.5 -1.5 1.5 -0.65 1.5];

%% Call robots
hold on;

UR5bot = UR5arm;
Reactorbot = Reactorx200;

%Move robot bases
UR5bot.model.base = transl([0,0.3,0])* trotz(pi);
UR5bot.MoveRobot(UR5bot.model.getpos);

Reactorbot.model.base = transl([0,-0.3,0])* trotz(pi);
Reactorbot.MoveRobot(Reactorbot.model.getpos);

% Reactorx200name = ['Reactorx200'];
% 
% L1 = Link('d',0.10391,'a',0,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-180),deg2rad(180)]);
% L2 = Link('d',0,'a',0.200,'alpha',0,'offset',0,'qlim',[deg2rad(-108),deg2rad(113)]);
% L3 = Link('d',0,'a',0.050,'alpha',0,'offset',0,'qlim',[0]);
% L4 = Link('d',0,'a',0.200,'alpha',0,'offset',0,'qlim',[deg2rad(-108),deg2rad(93)]);
% L5 = Link('d',0,'a',0.065,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-100),deg2rad(123)]);
% L6 = Link('d',0,'a',0,'alpha',pi/2,'offset',pi/2,'qlim',[0]);
% L7 = Link('d',0.065,'a',0,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-180),deg2rad(180)]);
% 
% Reactorx200 = SerialLink([L1 L2 L3 L4 L5 L6 L7], 'name',Reactorx200name);
% Reactorx200.base = Reactorx200.base * transl(0,-0.5,0);
% qrea = zeros(1,7);

%% plot
% Reactorx200.plot(qrea, 'scale', scale1, 'workspace',workspace)
% hold on;
% UR5arm.plot(qur5, 'scale', scale2,'workspace',workspace)
% UR5bot.MoveRobot(UR5bot.model.getpos);
%% ply files
ChessPieces

