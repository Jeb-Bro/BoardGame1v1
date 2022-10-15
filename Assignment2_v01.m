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
workspace = [-1.5 1.5 -1.5 1.5 -0.65 1.5];
qrea = zeros(1,7);

%% Call robots
hold on;

UR5bot = UR5arm;
Reactorbot = Reactorx200;

%Move robot bases
UR5bot.model.base = transl([0,0.5,0])* trotz(pi);
UR5bot.MoveRobot(UR5bot.model.getpos);

% Reactorbot.model.plot(qrea, 'scale', scale1, 'workspace',workspace);
Reactorbot.model.base = transl([0,-50,0])* trotz(pi);
Reactorbot.MoveRobot(Reactorbot.model.getpos);
Reactorbot.model.teach

%% ply files
% ChessPieces;

