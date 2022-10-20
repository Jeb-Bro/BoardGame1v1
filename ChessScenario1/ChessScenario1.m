% https://lichess.org/study/wukLYIXj - Staircase mate
classdef ChessScenario1 < handle 
    properties
        % Pieces Required
        wQueen1;
        wQueen2;

        bKing;
        wKing;

        workspace = [-1 2 -2 2 -1 2];
        
    end

    methods%% Class for Shape robot simulation
        function self = ChessScenario1()
            
            self.GetwQueen1();
            self.GetwQueen2();

            self.GetbKing();
            self.GetwKing();

            self.PlotAndColourRobot();
        end

        %% Plot and Colour Pieces
        function PlotAndColourRobot(self)
            % Chess Pos Matrix
            xPosMatrix = zeros(8,1);
            yPosMatrix = zeros(8,1);
            squareSize = 0.0375;
            height = 2.2737*10^-14;
            tableHeight = 0;  

            for j = 1
                for i = -7:2:7
                xPosMatrix(j) = i*squareSize*0.5;
                yPosMatrix(j) = i*squareSize*0.5;
                j = j+1;
                end
            end      
            
            %Queens
            wQueen1Index = self.wQueen1.n;
            [ faceData, vertexData, plyData1{wQueen1Index+1} ] = plyread('wQueen.ply','tri'); %#ok<AGROW>
            self.wQueen1.faces{wQueen1Index+1} = faceData;
            self.wQueen1.points{wQueen1Index+1} = vertexData;

            wQueen2Index = self.wQueen2.n;
            [ faceData, vertexData, plyData2{wQueen2Index+1} ] = plyread('wQueen.ply','tri'); %#ok<AGROW>
            self.wQueen2.faces{wQueen2Index+1} = faceData;
            self.wQueen2.points{wQueen2Index+1} = vertexData;

             % Display Queens
            self.wQueen1.plot3d(zeros(1,self.wQueen1.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wQueen1.delay = 0;
            self.wQueen1.base = transl([xPosMatrix(2),yPosMatrix(2),0]); % Move to default pos
            self.MovewQueen1(self.wQueen1.getpos);

            self.wQueen2.plot3d(zeros(1,self.wQueen2.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wQueen2.delay = 0;
            self.wQueen2.base = transl([xPosMatrix(1),yPosMatrix(3),0]); % Move to default pos
            self.MovewQueen2(self.wQueen2.getpos);    
            
            % Kings
            bKingIndex = self.bKing.n;
            [ faceData, vertexData, plyData3{bKingIndex+1} ] = plyread('bKing.ply','tri'); %#ok<AGROW>
            self.bKing.faces{bKingIndex+1} = faceData;
            self.bKing.points{bKingIndex+1} = vertexData;

            wKingIndex = self.wKing.n;
            [ faceData, vertexData, plyData4{wKingIndex+1} ] = plyread('wKing.ply','tri'); %#ok<AGROW>
            self.wKing.faces{wKingIndex+1} = faceData;
            self.wKing.points{wKingIndex+1} = vertexData;

             % Display Kings
            self.bKing.plot3d(zeros(1,self.bKing.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.bKing.delay = 0;
            self.bKing.base = transl([xPosMatrix(5),yPosMatrix(4),0]); % Move to default pos
            self.MovebKing(self.bKing.getpos); 

            self.wKing.plot3d(zeros(1,self.wKing.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wKing.delay = 0;
            self.wKing.base = transl([xPosMatrix(5),yPosMatrix(1),0]); % Move to default pos
            self.MovewKing(self.wKing.getpos); 

            %Colour wqueen1
            for wQueen1Index = 0:self.wQueen1.n
                handles = findobj('Tag', self.wQueen1.name);
                h = get(handles,'UserData');
                try 
                    h.link(wQueen1Index+1).Children.FaceVertexCData = [plyData1{wQueen1Index+1}.vertex.red ...
                                                                  , plyData1{wQueen1Index+1}.vertex.green ...
                                                                  , plyData1{wQueen1Index+1}.vertex.blue]/255;
                    h.link(wQueen1Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
            
            %Colour wQueen2
            for wQueen2Index = 0:self.wQueen2.n
                handles = findobj('Tag', self.wQueen2.name);
                h = get(handles,'UserData');
                try 
                    h.link(wQueen2Index+1).Children.FaceVertexCData = [plyData2{wQueen2Index+1}.vertex.red ...
                                                                  , plyData2{wQueen2Index+1}.vertex.green ...
                                                                  , plyData2{wQueen2Index+1}.vertex.blue]/255;
                    h.link(wQueen2Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end  
            
            %Colour bKing
            for bKingIndex = 0:self.bKing.n
                handles = findobj('Tag', self.bKing.name);
                h = get(handles,'UserData');
                try 
                    h.link(bKingIndex+1).Children.FaceVertexCData = [plyData3{bKingIndex+1}.vertex.red ...
                                                                  , plyData3{bKingIndex+1}.vertex.green ...
                                                                  , plyData3{bKingIndex+1}.vertex.blue]/255;
                    h.link(bKingIndex+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end 
            
            %Colour wKing
            for wKingIndex = 0:self.wKing.n
                handles = findobj('Tag', self.wKing.name);
                h = get(handles,'UserData');
                try 
                    h.link(wKingIndex+1).Children.FaceVertexCData = [plyData4{wKingIndex+1}.vertex.red ...
                                                                  , plyData4{wKingIndex+1}.vertex.green ...
                                                                  , plyData4{wKingIndex+1}.vertex.blue]/255;
                    h.link(wKingIndex+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end  
        end
        
        %% Piece Functions
        function GetwQueen1(self)
            name = 'wQueen1';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.wQueen1 = SerialLink(L1, 'name', name);
        end

        function GetwQueen2(self)
            name = 'wQueen2';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.wQueen2 = SerialLink(L1, 'name', name);
        end

        function GetbKing(self)
            name = 'bKing';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.bKing = SerialLink(L1, 'name', name);
        end

        function GetwKing(self)
            name = 'wKing';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.wKing = SerialLink(L1, 'name', name);
        end
        
         %% Functions to move pieces
         %wQueen1
        function MovewQueen1(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wQueen1.animate(qTrajectory(i,:));
                drawnow()
            end
        end
         %wQueen2
        function MovewQueen2(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wQueen2.animate(qTrajectory(i,:));
                drawnow()
            end
        end       
         %bKing
        function MovebKing(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.bKing.animate(qTrajectory(i,:));
                drawnow()
            end
        end       
         %wKing
        function MovewKing(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wKing.animate(qTrajectory(i,:));
                drawnow()
            end
        end       
    end    
end
