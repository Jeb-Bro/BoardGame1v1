classdef UR5arm < handle
    properties
        model
        name = 'UR5bot'
        workspace = [-1 2 -2 2 -1 2];

        % Robot plot options
        plotopts = {'fps',60};
                
        %default joint settings
        jointDef = [90 0 90 0 -90 0 0]*pi/180;
        
        modelGripper
        gripper1Tr = transl([-0.02,0,0]);
        gripper2Tr = transl([0.02,0,0]);
    end

    methods
        %% Define Robot Function
        function self = UR5arm(option)
            self.CreateModel();
            self.PlotAndColourRobot();
            self.model.animate(self.jointDef);

            self.GripperModel();
            self.PlotandColourGripper();
        end

            %% DH Parameters
        function CreateModel(self)
            L(1) = Link('d',0.0892,'a',0,'alpha',-pi/2,'offset',0,'qlim',[deg2rad(-360),deg2rad(360)]);
            L(2) = Link('d',0.1357,'a',0.425,'alpha',-pi,'offset',-pi/2,'qlim',[deg2rad(-90),deg2rad(90)]);
            L(3) = Link('d',0.1197,'a',0.39243,'alpha',pi,'offset',0,'qlim',[deg2rad(-170),deg2rad(170)]);
            L(4) = Link('d',0.093,'a',0,'alpha',-pi/2,'offset',-pi/2,'qlim',[deg2rad(-360),deg2rad(360)]);
            L(5) = Link('d',0.093,'a',0,'alpha',-pi/2,'offset',0,'qlim',[deg2rad(-360),deg2rad(360)]);
            L(6) = Link('d',0,'a',0,'alpha',0,'offset',0,'qlim',[deg2rad(-360),deg2rad(360)]);
            L(7) = Link('d',0.1056+0.052,'a',0,'alpha',0,'offset',0,'qlim',[0]);
            self.model = SerialLink(L,'name',self.name);
        end

        %% Plot and Colour Robot
        function PlotAndColourRobot(self)
            for linkIndex = 0:self.model.n
                [faceData, vertexData, plyData{linkIndex+1} ] = plyread(['UR5Link',num2str(linkIndex),'.ply'],'tri');
                self.model.faces{linkIndex+1} = faceData;
                self.model.points{linkIndex+1} = vertexData;
            end

            % Display robot
            self.model.plot3d(zeros(1,self.model.n),self.plotopts{:},'workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.model.delay = 0;

            % Colour 
            for linkIndex = 0:self.model.n
                handles = findobj('Tag', self.model.name);
                h = get(handles,'UserData');
                try 
                    h.link(linkIndex+1).Children.FaceVertexCData = [plyData{linkIndex+1}.vertex.red ...
                                                                  , plyData{linkIndex+1}.vertex.green ...
                                                                  , plyData{linkIndex+1}.vertex.blue]/255;
                    h.link(linkIndex+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
        end

        %% Model gripper
        function GripperModel(self)
            % Finger 1
%             finger1 = Link('d',0,'a',0,'alpha',0,'offset',0, 'qlim',[deg2rad(0),deg2rad(25)]);
            finger1 =Link('theta', pi,'prismatic','a',0,'alpha',0,'qlim', [0 0.8], 'offset', 0.01);
            self.modelGripper{1} = SerialLink(finger1,'name','Gripper finger 1');

            % Finger 2
%             finger2 = Link('d',0,'a',0,'alpha',0,'offset',0, 'qlim',[deg2rad(-25),deg2rad(0)]);
            finger2 =Link('theta', pi,'prismatic','a',0,'alpha',0,'qlim', [-0.059 0], 'offset', 0.01);
            self.modelGripper{2} = SerialLink(finger2,'name','Gripper finger 2');
        end

        %% Plot and Colour gripper fingers
        function PlotandColourGripper(self)
            % Finger 1:
            for linkIndex = 1:self.modelGripper{1}.n
                [faceData, vertexData, plyData{linkIndex+1}] = plyread(['Gripper1_',num2str(linkIndex),'.PLY'],'tri');
                self.modelGripper{1}.faces{linkIndex+1} = faceData;
                self.modelGripper{1}.points{linkIndex+1} = vertexData;
            end

            % Finger 2:
            for linkIndex = 1:self.modelGripper{2}.n
                [faceData, vertexData, plyData{linkIndex+1}] = plyread(['Gripper2_',num2str(linkIndex),'.PLY'],'tri');
                self.modelGripper{2}.faces{linkIndex+1} = faceData;
                self.modelGripper{2}.points{linkIndex+1} = vertexData;
            end

            % attach fingers to end-effector & display fingers
            self.modelGripper{1}.base = self.model.fkine(self.model.getpos) * self.gripper1Tr;
            self.modelGripper{2}.base = self.model.fkine(self.model.getpos) * self.gripper2Tr;
            
            self.modelGripper{1}.plot3d(0, self.plotopts{:},'workspace',self.workspace);
            self.modelGripper{2}.plot3d(0, self.plotopts{:},'workspace',self.workspace);

            % Colour 
            for linkIndex = 1:self.modelGripper{1}.n
                handles = findobj('Tag', self.model.name);
                h = get(handles,'UserData');
                try 
                    h.link(linkIndex+1).Children.FaceVertexCData = [plyData{linkIndex+1}.vertex.red ...
                                                                  , plyData{linkIndex+1}.vertex.green ...
                                                                  , plyData{linkIndex+1}.vertex.blue]/255;
                    h.link(linkIndex+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
        end
        
        %% Update the gripper position by the robot's end joint
        function UpdateGripper(self)
            self.modelGripper{1}.base = self.model.fkine(self.model.getpos)* self.gripper1Tr;
            self.modelGripper{2}.base = self.model.fkine(self.model.getpos)* self.gripper2Tr;

            self.modelGripper{1}.animate(self.modelGripper{1}.getpos());
            self.modelGripper{2}.animate(self.modelGripper{2}.getpos());
        end
        

        %% Function to move UR5 + Updates gripper location to move with arm
        function MoveRobot(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.model.animate(qTrajectory(i,:));
                self.UpdateGripper();
                drawnow()
            end
        end
    end
end
