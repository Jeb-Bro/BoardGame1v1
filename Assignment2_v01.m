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
% clc;
% clf;
% clear all;
% startup_rvc;

%% Default phase to show pieces and arms
% Default_phase();
% disp('Default environment layout')
% disp('Press Enter to Continue')
% pause;

%% Setup
tic

clc;
clf;
clear all;
% squareSize = 0.0375;
% height = 2.2737*10^-14;
% tableHeight = 0;
%    
% % Chess Pos Matrix
% xPosMatrix = zeros(8,1);
% yPosMatrix = zeros(8,1);
% 
% for j = 1
%     for i = -7:2:7
%     xPosMatrix(j) = i*squareSize*0.5;
%     yPosMatrix(j) = i*squareSize*0.5;
%     j = j+1;
%     end
% end
% 
% ChessHeight = 0.08;
   
%% Environment + Chess board & pieces creation 
% ChessEnvironment();

%% Call robots

% UR5bot = UR5arm;
% i5bot = AUBOi5;

% UR5 translate base
% UR5bot.model.base = transl([-0.4,0.3,-0.03]);
% UR5bot.MoveRobot(UR5bot.model.getpos);
% UR5bot.model.teach;
% UR5bot.modelGripper{1}.teach

% i5 translate base
% i5bot.model.base = transl([0.4,-0.3,-0.03]);
% i5bot.MoveRobot(i5bot.model.getpos);
% i5bot.model.teach;

%% GUI Start

% ChessGUI = Chess_GUI;

%% Change workplace view 
% xlim([-1.5 1.5]);
% ylim([-1.5 1.5]);
% zlim([-0.65 1]);

%% UR5 Scenarios
% Scenario1 = ChessScenario1;
% Scenario2 = ChessScenario2;
% Default Joint states
% UR5jd= [90 0 90 0 -90 0 0]*pi/180;
% i5jd = [-90 0 90 0 -90 0 0]*pi/180;
% steps = 30;

% Scenario = 3;
% % EStopCheck(ChessGUI.ESTOPButton.Value)
% switch Scenario
%     case 1
%         Scenario1 = ChessScenario1;
%         ChessScenario1_Moves
% 
%     case 2
%         Scenario2 = ChessScenario2;
%         ChessScenario2_Moves
% 
%     case 3
%         Scenario3 = ChessScenario1;
%         ChessScenario3_Moves
% 
% end

timeElasped = toc/60;
