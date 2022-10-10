close all
clf
clc
%% Selection
opts.Interpreter = 'tex';
% Include the desired Default answer
opts.Default = 'error';
% Use the TeX interpreter to format the question
quest = 'Which task do you want to execute?';
answer = questdlg(quest, '41013 AS1', 'Build Wall', 'Show Reach & Safety', 'Transform Base Location', opts);

switch answer
%% Build Wall Section
case 'Build Wall'
    display('Build 3x3 Wall Selected.');

%%Load Linear UR3 Class, Gripper, Enviornment
dumE = UR3Linear();
% brickGroup = Bricks(7);
% test2 = Gripper([0 0 0 0 0 0]);

dumE.model.GetPos();
% q = dumE.GetPos();

% newQ = dumE.ikine(transl(-1.0,-0.4,0.4),q,[1,1,1,1,1,1]); %Mask Enables Anything
% dumE.plot(newQ,'trail','-');




% T1 = transl(0.5,-0.4,0.5);                                                  % Create translation matrix
% q1 = test.model.ikine(T1);                                                        % Derive joint angles for required end-effector transformation
% T2 = transl(0.5,0.4,0.1);                                                   % Define a translation matrix            
% q2 = test.model.ikine(T2);  
% 
% steps = 40;
% qMatrix = TVP(q1,q2,steps);

% 
% %Load fingers
% %f1 = fingerrobot
% 
% 
% figure(1)
% % surf([-1.8,-1.8;1.8,1.8],[-1.8,1.8;-1.8,1.8],[0.01,0.01;0.01,0.01],'CData',imread('concrete.jpg'),'FaceColor','texturemap');
% test.model.animate(qMatrix,'trail','r-') 

    case 'Reach & Safety?'
        display('tbd');
        %You can display 2D circles on the ground to show clearance
        
    case 'error'
        display('Error! Please run again and make a selection.');
end

%Trapezoidal Velocity Profile Function
%Input: (q1,q2,steps)
%Output: qMatrix
function qFunctionMatrix = TVP(q_a,q_b,steps_function)
    s = lspb(0,1,steps_function); % First, create the scalar function
    qFunctionMatrix = nan(steps_function,6); % Create memory allocation for variables
         for i = 1:steps
             qFunctionMatrix(i,:) = (1-s(i))*q_a + s(i)*q_b;    % Generate interpolated joint angles
         end
end