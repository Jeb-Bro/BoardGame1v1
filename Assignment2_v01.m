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
clc
clf
clear all
startup_rvc;

%% Setup
workspace = [-1 2 -2 2 -1 2];
qrx = [0 0 0 -pi/2 0 0 0 0];
scale1 = 0.4;
hold on;

%% Environment + Chess board& pieces creation 
ChessPieces;

%% Call robots

UR5bot = UR5arm;
i5bot = AUBOi5;

% UR5 plot and translate
UR5bot.model.base = transl([0,0.5,-0.03]);
UR5bot.MoveRobot(UR5bot.model.getpos);
% UR5bot.model.teach;

% i5 plot and translate
i5bot.model.base = transl([0,-0.5,-0.03]);
i5bot.MoveRobot(UR5bot.model.getpos);
i5bot.model.teach;

%% Change workplace view 
xlim([-1.5 1.5])
ylim([-1.5 1.5])
zlim([-0.1 1])

%% Movement tests
% x1 = 0;
% y1 = 0;
% steps=100;
% q = zeros(1,6);
% 
% T2 = transl(0.1246,0.1351,0.04024) * trotx(pi), q, [0,0,0,1,1,1];         
% q2 = UR5bot.model.ikine(T2);                                    
% qMatrix = jtraj(q,q2,steps);
% 
%  for i = 1:steps
%     pause(0.1);
% 
%     %i,: is just the saying the current 'i'th row and all columns
%     UR5bot.model.animate(qMatrix(i,:));
% 
%     %displays the arm movement 
%     drawnow()
% end

%% UR5 RMRC test
% qPick = [115 -12.6 133 57.6 274 14.4]*pi/180;
% 
% T1 = UR5bot.model.fkine(UR5bot.model.getpos);
% T2 = UR5bot.model.fkine(qPick);
% 
% steps = 100;
% T = trinterp(T1,T2,linspace(0,1,steps));
% timestep = 0.05;
% 
% % track the trajectory by RRMC
% for i = 1:steps-1
%     qCurrent = UR5bot.model.getpos;
%     currentPose = UR5bot.model.fkine(qCurrent);
% 
%     % trace the end-effector
%     plot3(currentPose(1,4),currentPose(2,4),currentPose(3,4),'r.');
% 
%     % spatial velocity
%     u = (transl(T(:,:,i+1)) - transl(T(:,:,i)))/timestep;
%     omega = (tr2rpy(T(:,:,i+1)) - tr2rpy(T(:,:,i)))/timestep;
% 
%     % joint velocity
%     qd = pinv(UR5bot.model.jacob0(qCurrent)) * [u; omega'];
% 
%     % next position
%     qNext = qCurrent + qd'*timestep;
% 
%     % move the robot
%     UR5bot.MoveRobot(qNext);
% 
%     % try to correct the final position:
%     if i == steps - 1
%         currentPose = UR5bot.model.fkine(UR5bot.model.getpos);
%         % current error between the desired pose and the current pose
%         error_displacement = norm(T2(1:3,4) - currentPose(1:3,4));
% 
%         % try to correct the position by jtraj if the error  > 5mm
%         if error_displacement > 0.005
%             disp(['Last step error is ',num2str(1000*error_displacement),'mm > 5mm. A jtraj correction is applied!']);
%             qCorrect = jtraj(UR5bot.model.getpos,qPick,steps);
%             UR5bot.MoveRobot(qCorrect);
%         end
% 
%         % display the final error
%         currentPose = UR5bot.model.fkine(UR5bot.model.getpos);
%         error_displacement = norm(T2(1:3,4) - currentPose(1:3,4));
%         disp(['Current error is ',num2str(1000* error_displacement),'mm.']);
%     end
% end

%% i5 RMRC test
% qPick = [60 111 -90 -59.9 -49.1 0 50]*pi/180;
% 
% T1 = Reactorbot.model.fkine(Reactorbot.model.getpos);
% T2 = Reactorbot.model.fkine(qPick);
% 
% steps = 100;
% T = trinterp(T1,T2,linspace(0,1,steps));
% timestep = 0.05;
% 
% % track the trajectory by RRMC
% for i = 1:steps-1
%     qCurrent =Reactorbot.model.getpos;
%     currentPose = Reactorbot.model.fkine(qCurrent);
% 
%     % trace the end-effector
%     plot3(currentPose(1,4),currentPose(2,4),currentPose(3,4),'r.');
% 
%     % spatial velocity
%     u = (transl(T(:,:,i+1)) - transl(T(:,:,i)))/timestep;
%     omega = (tr2rpy(T(:,:,i+1)) - tr2rpy(T(:,:,i)))/timestep;
% 
%     % joint velocity
%     qd = pinv(Reactorbot.model.jacob0(qCurrent)) * [u; omega'];
% 
%     % next position
%     qNext = qCurrent + qd'*timestep;
% 
%     % move the robot
%     Reactorbot.MoveRobot(qNext);
% 
%     % try to correct the final position:
%     if i == steps - 1
%         currentPose = Reactorbot.model.fkine(Reactorbot.model.getpos);
%         % current error between the desired pose and the current pose
%         error_displacement = norm(T2(1:3,4) - currentPose(1:3,4));
% 
%         % try to correct the position by jtraj if the error  > 5mm
%         if error_displacement > 0.005
%             disp(['Last step error is ',num2str(1000*error_displacement),'mm > 5mm. A jtraj correction is applied!']);
%             qCorrect = jtraj(Reactorbot.model.getpos,qPick,steps);
%             Reactorbot.MoveRobot(qCorrect);
%         end
% 
%         % display the final error
%         currentPose = Reactorbot.model.fkine(Reactorbot.model.getpos);
%         error_displacement = norm(T2(1:3,4) - currentPose(1:3,4));
%         disp(['Current error is ',num2str(1000* error_displacement),'mm.']);
%     end
% end
