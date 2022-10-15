classdef Reactorx200 < handle
    properties
        model
        name = 'Reactorx200'
        workspace = [-1 2 -2 2 -1.5 2];

        % Robot plot options
        plotopts = {'fps',60,'noarrow'};
                
        %default joint settings
        jointDef = [0 0 0 0 0]*pi/180;
    end

    methods
        %% Define Robot Function
        function self = Reactorx200(option)
            self.CreateModel();
            self.PlotAndColourRobot();
            self.model.animate(self.jointDef)
        end

        %% DH Parameters
        function CreateModel(self)
            L(1) = Link('d',0.10391,'a',0,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-180),deg2rad(180)]);
            L(2) = Link('d',0,'a',0.200,'alpha',0,'offset',0,'qlim',[deg2rad(-108),deg2rad(113)]);
            L(3) = Link('d',0,'a',0.050,'alpha',0,'offset',0,'qlim',[0]);
            L(4) = Link('d',0,'a',0.200,'alpha',0,'offset',0,'qlim',[deg2rad(-108),deg2rad(93)]);
            L(5) = Link('d',0,'a',0.065,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-100),deg2rad(123)]);
%             L(6) = Link('d',0,'a',0,'alpha',pi/2,'offset',pi/2,'qlim',[0]);
%             L(7) = Link('d',0.065,'a',0,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-180),deg2rad(180)]);
            
%             qrea = zeros(1,7);
            self.model = SerialLink(L,'name',self.name);
        end
        
        %% Plot and Colour Robot
        function PlotAndColourRobot(self)
            for linkIndex = 0:self.model.n
                [faceData, vertexData, plyData{linkIndex+1} ] = plyread(['rx200_',num2str(linkIndex),'.ply'],'tri'); %#ok<AGROW>
                self.model.faces{linkIndex+1} = faceData;
                self.model.points{linkIndex+1} = vertexData;
            end

            % Display robot
            self.model.plot3d(zeros(1,self.model.n),self.plotopts{:},'workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.model.delay = 0;

%             % Colour 
%             for linkIndex = 0:self.model.n
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


        %% Move robot function
        function MoveRobot(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.model.animate(qTrajectory(i,:));
                drawnow();
            end
        end

    end
end