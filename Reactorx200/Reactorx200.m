classdef Reactorx200 < handle
    properties
        model
        name = 'Reactorx200'
        workspace = [-1 2 -2 2 -1.5 2];

        % Robot plot options
        plotopts = {'fps',60,'noarrow'};
                
        %default joint settings
        jointDef = [0 0 0 0 0 0]*pi/180;
        
        gripperTr = troty(pi/2)*trotx(pi);
        
        modelGripper
    end

    methods
        %% Define Robot Function
        function self = Reactorx200(option)
            self.CreateModel();
            self.PlotAndColourRobot();
            
%             self.model.animate(self.jointDef)
            
            self.CreateGripperModel();
            self.PlotandColourGripper();
        end
        %% DH Parameters
        function CreateModel(self)
%             L(1) = Link('d',0,'a',0,'alpha',0,'offset',0,'qlim',[0]);
%             L(2) = Link('d',0.065,'a',0,'alpha',0,'offset',0,'qlim',[deg2rad(-180),deg2rad(180)]);
%             L(3) = Link('d',0,'a',0,'alpha',0,'offset',0,'qlim',[deg2rad(0),deg2rad(113)]);
%             L(4) = Link('d',0,'a',0.050,'alpha',0,'offset',0,'qlim',[-pi/2]);  %Doesn't move
%             L(5) = Link('d',0,'a',0.200,'alpha',0,'offset',0,'qlim',[deg2rad(-108),deg2rad(93)]);
%             L(6) = Link('d',0,'a',0.065,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-100),deg2rad(123)]);
%             L(7) = Link('d',0,'a',0,'alpha',pi/2,'offset',pi/2,'qlim',[0]);   %rotate the joint for end-effector
%             L(8) = Link('d',0.065,'a',0,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-180),deg2rad(180)]);

            L(1) = Link('d',0,'a',0,'alpha',0,'offset',0,'qlim',[0]);
            L(2) = Link('d',0.064,'a',0,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-180),deg2rad(180)]);
            L(3) = Link('d',0,'a',0.2,'alpha',0,'offset',0,'qlim',[deg2rad(0),deg2rad(113)]);
            L(4) = Link('d',0,'a',0.050,'alpha',0,'offset',0,'qlim',[-pi/2]);    %Doesn't move
            L(5) = Link('d',0,'a',0.200,'alpha',0,'offset',0,'qlim',[deg2rad(-108),deg2rad(93)]);
            L(6) = Link('d',0,'a',0.065,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-100),deg2rad(123)]);
            L(7) = Link('d',0,'a',0,'alpha',pi/2,'offset',pi/2,'qlim',[0]);   %rotate the joint for end-effector
%             L(8) = Link('d',0.065,'a',0,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-180),deg2rad(180)]);
            
            self.model = SerialLink(L,'name',self.name);
        end       
        %% Plot and Colour Robot
        function PlotAndColourRobot(self)
            for linkIndex = 1:3
                [faceData, vertexData, plyData{linkIndex+1} ] = plyread(['rx200_',num2str(linkIndex),'.PLY'],'tri'); %#ok<AGROW>
                self.model.faces{linkIndex+1} = faceData;
                self.model.points{linkIndex+1} = vertexData;
            end

            for linkIndex = 5:7
                [faceData, vertexData, plyData{linkIndex+1} ] = plyread(['rx200_',num2str(linkIndex),'.PLY'],'tri'); %#ok<AGROW>
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
        %% Create the gripper model
        function CreateGripperModel(self)
            % Finger 1 of Gripper
            finger1 = Link('d',0,'a',0.06,'alpha',0,'offset',0, 'qlim',[deg2rad(0),deg2rad(25)]);
            self.modelGripper{1} = SerialLink(finger1,'name','Dobot Gripper Finger 1');

            % Finger 2 of Gripper
            finger2 = Link('d',0,'a',0.06,'alpha',0,'offset',0, 'qlim',[deg2rad(-25),deg2rad(0)]);
            self.modelGripper{2} = SerialLink(finger2,'name','Dobot Gripper Finger 2');
        end
        %% Plot gripper
        function PlotandColourGripper(self)
            % Gripper Finger 1:
            for linkIndex = 0:self.modelGripper{1}.n
                [faceData, vertexData, plyData1{linkIndex+1}] = plyread(['DobotGripperFinger1_J',num2str(linkIndex),'.ply'],'tri');
                self.modelGripper{1}.faces{linkIndex+1} = faceData;
                self.modelGripper{1}.points{linkIndex+1} = vertexData;
            end

            % Gripper Finger 2:
            for linkIndex = 0:self.modelGripper{2}.n
                [faceData, vertexData, plyData2{linkIndex+1}] = plyread(['DobotGripperFinger2_J',num2str(linkIndex),'.ply'],'tri');
                self.modelGripper{2}.faces{linkIndex+1} = faceData;
                self.modelGripper{2}.points{linkIndex+1} = vertexData;
            end

            % Gripper's base on robot's end-effector
            self.modelGripper{1}.base = self.model.fkine(self.model.getpos)*self.gripperTr;
            self.modelGripper{2}.base = self.model.fkine(self.model.getpos)*self.gripperTr;

            % Display Gripper
            self.modelGripper{1}.plot3d(0, self.plotopts{:},'workspace',self.workspace);
            self.modelGripper{2}.plot3d(0, self.plotopts{:},'workspace',self.workspace);
        end
        %% Move robot function
        function MoveRobot(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.model.animate(qTrajectory(i,:));
                drawnow();
            end
        end
    end
end