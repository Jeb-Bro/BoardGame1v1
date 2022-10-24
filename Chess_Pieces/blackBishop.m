%% Scenario 1 for chess https://lichess.org/study/wukLYIXj : Ladder Mate, Step 4
classdef blackBishop < handle
    properties
        model
        name = 'blackBishop'
        workspace = [-1 1 -1 1 -1 1];

        % Robot plot options
        plotopts = {'fps',60,'noarrow'};
        pose
        vertexCount
        verts
        mesh_h       

    end

    methods
        %% Define Robot Function
        function self = blackBishop(option)
            self.CreateModel();
            self.PlotAndColourRobot();

        end

        %% DH Parameters
        function CreateModel(self)
            L(1) = Link('d',0.061,'a',0,'alpha',0,'offset',0);

            self.model = SerialLink(L,'name',self.name);
        end
        
        %% Plot and Colour Robot
        function PlotAndColourRobot(self)
            self.pose = transl(-0.0562,-0.1313,-0.061)    %Default pose
            linkIndex = 1;
            [faceData, vertexData, plyData{linkIndex+1} ] = plyread(['bBishop.ply'],'tri');
            self.model.faces{linkIndex+1} = faceData;
            self.model.points{linkIndex+1} = vertexData;

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
        
        %% update the current position of the object. by pos = [x y]
        function UpdatePiece(self,T) % T is an input object.Pose
            self.pose = T;
%             updatedPoints = (T * [self.verts,ones(self.vertexCount,1)]')';
% %             self.mesh_h.Vertices = updatedPoints(:,1:3);
%             drawnow()
            self.model.base = self.model.fkine(self.model.getpos);            
            self.model.animate(self.model.getpos());
        end

        %% Move robot function
        function MovePiece(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.model.animate(qTrajectory(i,:));
                drawnow();
            end
        end

    end
end