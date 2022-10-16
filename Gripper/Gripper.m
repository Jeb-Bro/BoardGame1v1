classdef Gripper < handle
    
    properties
        
        modelGripper
        gripperTr = trotx(0) * troty(0) *trotz(0);
        workspace = [-1 2 -2 2 -1 2];
        
    end
    
    %% Define Robot Function
    function self = Gripper(option)
    
        self.GripperModel();
        self.PlotandColourGripper();
        self.MoveGripper(0);
        
    end

    
        %% Model gripper
    function GripperModel(self)
        % Finger 1
        finger1 = Link('d',0.02,'a',0,'alpha',0,'offset',0, 'qlim',[deg2rad(0),deg2rad(25)]);
        self.modelGripper{1} = SerialLink(finger1,'name','Gripper finger 1');

        % Finger 2
        finger2 = Link('d',-0.02,'a',0,'alpha',0,'offset',0, 'qlim',[deg2rad(-25),deg2rad(0)]);
        self.modelGripper{2} = SerialLink(finger2,'name','Gripper finger 2');
    end

%% Plot and Colour gripper fingers
function PlotandColourGripper(self)
    % Gripper Finger 1:
    for linkIndex = 1:self.modelGripper{1}.n
        [faceData, vertexData, plyData1{linkIndex+1}] = plyread(['Gripper1_',num2str(linkIndex),'.PLY'],'tri');
        self.modelGripper{1}.faces{linkIndex+1} = faceData;
        self.modelGripper{1}.points{linkIndex+1} = vertexData;
    end

    % Gripper Finger 2:
    for linkIndex = 1:self.modelGripper{2}.n
        [faceData, vertexData, plyData2{linkIndex+1}] = plyread(['Gripper2_',num2str(linkIndex),'.PLY'],'tri');
        self.modelGripper{2}.faces{linkIndex+1} = faceData;
        self.modelGripper{2}.points{linkIndex+1} = vertexData;
    end

    % Gripper's base on robot's end-effector
    self.modelGripper{1}.base = self.model.fkine(self.model.getpos)*self.gripperTr;
    self.modelGripper{2}.base = self.model.fkine(self.model.getpos)*self.gripperTr;

    % Display Gripper
    self.modelGripper{1}.plot3d(0, self.plotopts{:},'workspace',self.workspace);
    self.modelGripper{2}.plot3d(0, self.plotopts{:},'workspace',self.workspace);

    % Colour 
%             for linkIndex = 1:self.modelGripper{1}.n
%                 handles = findobj('Tag', self.model.name);
%                 h = get(handles,'UserData');
%                 try 
%                     h.link(linkIndex+1).Children.FaceVertexCData = [plyData{linkIndex+1}.vertex.red ...
%                                                                   , plyData{linkIndex+1}.vertex.green ...
%                                                                   , plyData{linkIndex+1}.vertex.blue]/255;
%                     h.link(linkIndex+1).Children.FaceColor = 'interp';
%                 catch ME_1
%                     disp(ME_1);
%                     continue;
%                 end
%             end
    end

    %% Update the gripper position by the robot's end joint
%     function UpdateGripper(self)
%         self.modelGripper{1}.base = self.model.fkine(self.model.getpos)*self.gripperTr;
%         self.modelGripper{2}.base = self.model.fkine(self.model.getpos)*self.gripperTr;
% 
%         self.modelGripper{1}.animate(self.modelGripper{1}.getpos());
%         self.modelGripper{2}.animate(self.modelGripper{2}.getpos());
%     end

     %% Function to open/close gripper
%     function MoveGripper(self,gripperAngle)
%         % limit the input angle for gripper
%         if gripperAngle > 25 || gripperAngle < 0
%             gripperAngle = 0;
%         end

%             % current position (angle in rad) of the gripper
%             pos1 = self.modelGripper{1}.getpos;
%             pos2 = self.modelGripper{2}.getpos;
% 
%             steps = 20;
%             % trajectory for finger 1
%             q1 = lspb(pos1,gripperAngle*pi/180,steps);
% 
%             % trajectory for finger 2
%             q2 = lspb(pos2,-gripperAngle*pi/180,steps);
% 
%             % move gripper's fingers by created trajectory
%             for i =1:steps
%                 self.modelGripper{1}.animate(q1(i,:));
%                 self.modelGripper{2}.animate(q2(i,:));
%                 drawnow()
%             end
    end
