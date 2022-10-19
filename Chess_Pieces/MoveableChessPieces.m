%% Scenario 1 for chess
classdef MoveableChessPieces <handle
    properties
        xPosMatrix = zeros(8,1);
        yPosMatrix = zeros(8,1);
    end
    
    methods
        
        function PlotPiece(self)

            gcf;
            [f,v,~] = plyread(self.fileName,'tri');

            % Get vertex count
            self.vertexCount = size(v,1);

            % Move center point to origin
            self.verts = v;

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
        
        %% Placing Pieces at certain location 
        function self = Pieces(self)
            
        for i = 1:8

            % Pawns
            PlaceObject('wPawn.ply', [xPosMatrix(i), yPosMatrix(2), height+tableHeight]);
            PlaceObject('bPawn.ply', [xPosMatrix(i), yPosMatrix(7), height+tableHeight]);

            % Rooks
            if i == 1 || i == 8
                PlaceObject('wRook.ply', [xPosMatrix(i), yPosMatrix(1), height+tableHeight]);
                PlaceObject('bRook.ply', [xPosMatrix(i), yPosMatrix(8), height+tableHeight]);
            end

            % Knights
            if i == 2 || i == 7
                PlaceObject('wKnight.ply', [xPosMatrix(i), yPosMatrix(1), height+tableHeight]);
                PlaceObject('bKnight.ply', [xPosMatrix(i), yPosMatrix(8), height+tableHeight]);
            end

            % Bishops
            if i == 3 || i == 6
                PlaceObject('wBishop.ply', [xPosMatrix(i), yPosMatrix(1), height+tableHeight]);
                PlaceObject('bBishop.ply', [xPosMatrix(i), yPosMatrix(8), height+tableHeight]); 
            end

            % Queens
            if i == 4
                PlaceObject('wQueen.ply', [xPosMatrix(i), yPosMatrix(1), height+tableHeight]);
                PlaceObject('bQueen.ply', [xPosMatrix(i), yPosMatrix(8), height+tableHeight]); 
            end

            % Kings
            if i == 5
                PlaceObject('wKing.ply', [xPosMatrix(i), yPosMatrix(1), height+tableHeight]);
                PlaceObject('bKing.ply', [xPosMatrix(i), yPosMatrix(8), height+tableHeight]); 
            end
        end
        end
    end
end