classdef AUBOi5 < handle
    properties
        model
        name = 'AUBOi5'
        workspace = [-1 2 -2 2 -1 2];

        % Robot plot options
        plotopts = {'fps',60};
                
        %default joint settings
        jointDef = [-90 0 90 0 -90 0 0]*pi/180;
        
        modelGripper
        gripper1Tr = transl([-0.02,0,0]);
        gripper2Tr = transl([0.02,0,0]);
    end

    methods
        %% Define Robot Function
        function self = AUBOi5(option)
            self.CreateModel();
            self.PlotAndColourRobot();
            self.model.animate(self.jointDef);
            
            self.GripperModel();
            self.PlotandColourGripper();
%             self.MoveGripper(0);
        end

        %% DH Parameters
        function CreateModel(self)
            L(1) = Link('d',0.0985,'a',0,'alpha',-pi/2,'offset',0,'qlim',[deg2rad(-175),deg2rad(175)]);
            L(2) = Link('d',0.1405,'a',0.408,'alpha',-pi,'offset',-pi/2,'qlim',[deg2rad(-175),deg2rad(175)]);
            L(3) = Link('d',0.1197,'a',0.376,'alpha',pi,'offset',0,'qlim',[deg2rad(-175),deg2rad(175)]);
            L(4) = Link('d',0.1025,'a',0,'alpha',-pi/2,'offset',-pi/2,'qlim',[deg2rad(-175),deg2rad(175)]);
            L(5) = Link('d',0.094,'a',0,'alpha',-pi/2,'offset',0,'qlim',[deg2rad(-175),deg2rad(175)]);
            L(6) = Link('d',0,'a',0,'alpha',0,'offset',0,'qlim',[deg2rad(-175),deg2rad(175)]);
            L(7) = Link('d',0.1056+0.052,'a',0,'alpha',0,'offset',0,'qlim',[0]);
            self.model = SerialLink(L,'name',self.name);
        end

        %% Plot and Colour Robot
        function PlotAndColourRobot(self)
            for linkIndex = 0:self.model.n
                [faceData, vertexData, plyData{linkIndex+1} ] = plyread(['AUBO-i5 LINK',num2str(linkIndex),'.ply'],'tri'); %#ok<AGROW>
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
            finger1 =Link('theta', pi,'prismatic','a',0,'alpha',0,'qlim', [0 0.059], 'offset', 0.01);
            self.modelGripper{3} = SerialLink(finger1,'name','Gripper finger 1');

            % Finger 2
%             finger2 = Link('d',0,'a',0,'alpha',0,'offset',0, 'qlim',[deg2rad(-25),deg2rad(0)]);
            finger2 =Link('theta', pi,'prismatic','a',0,'alpha',0,'qlim', [-0.059 0], 'offset', 0.01);
            self.modelGripper{4} = SerialLink(finger2,'name','Gripper finger 2');
        end

        %% Plot and Colour gripper fingers
        function PlotandColourGripper(self)
            % Finger 1:
            for linkIndex = 1:self.modelGripper{3}.n
                [faceData, vertexData, plyData{linkIndex+1}] = plyread(['Gripper3_',num2str(linkIndex),'.PLY'],'tri');
                self.modelGripper{3}.faces{linkIndex+1} = faceData;
                self.modelGripper{3}.points{linkIndex+1} = vertexData;
            end

            % Finger 2:
            for linkIndex = 1:self.modelGripper{4}.n
                [faceData, vertexData, plyData{linkIndex+1}] = plyread(['Gripper4_',num2str(linkIndex),'.PLY'],'tri');
                self.modelGripper{4}.faces{linkIndex+1} = faceData;
                self.modelGripper{4}.points{linkIndex+1} = vertexData;
            end

            % attach fingers to end-effector & display fingers
            self.modelGripper{3}.base = self.model.fkine(self.model.getpos) * self.gripper1Tr;
            self.modelGripper{4}.base = self.model.fkine(self.model.getpos) * self.gripper2Tr;
            
            self.modelGripper{3}.plot3d(0, self.plotopts{:},'workspace',self.workspace);
            self.modelGripper{4}.plot3d(0, self.plotopts{:},'workspace',self.workspace);

            % Colour 
            for linkIndex = 1:self.modelGripper{3}.n
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
            self.modelGripper{3}.base = self.model.fkine(self.model.getpos)* self.gripper1Tr;
            self.modelGripper{4}.base = self.model.fkine(self.model.getpos)* self.gripper2Tr;

            self.modelGripper{3}.animate(self.modelGripper{3}.getpos());
            self.modelGripper{4}.animate(self.modelGripper{4}.getpos());
        end
        
        %% Move robot function
        function MoveRobot(self,qT)
            for i=1:numrows(qT)
                self.model.animate(qT(i,:));
                self.UpdateGripper();
                drawnow()  
            end
        end
    end
end
