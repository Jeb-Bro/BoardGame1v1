classdef whiteKnight < handle
    properties
        model
        name = 'whiteKnight'
        workspace = [-1 1 -1 1 -1 1];

        % Robot plot options
        plotopts = {'fps',60,'noarrow'};
                

    end

    methods
        %% Define Robot Function
        function self = whiteKnight(option)
            self.CreateModel();
             self.PlotAndColourRobot();

        end

        %% DH Parameters
        function CreateModel(self)
            L(1) = Link('d',0.050,'a',0,'alpha',0,'offset',0);

            
%             qrea = zeros(1,7);
            self.model = SerialLink(L,'name',self.name);
        end
        
        %% Plot and Colour Robot
        function PlotAndColourRobot(self)
                linkIndex = 1;
                [faceData, vertexData, plyData{linkIndex+1} ] = plyread(['wKnight.ply'],'tri'); %#ok<AGROW>
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


%         %% Move robot function
%         function MoveRobot(self,qTrajectory)
%             for i=1:numrows(qTrajectory)
%                 self.model.animate(qTrajectory(i,:));
%                 drawnow();
%             end
%         end

    end
end