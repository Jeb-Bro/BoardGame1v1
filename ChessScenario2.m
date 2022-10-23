classdef ChessScenario2 < handle 
    properties
        % Pieces Required for Scenario
        wPawn1;
        wPawn2;
        wPawn3;
        wPawn4;
        wPawn5;
        wPawn6;
        wPawn7;
        wPawn8;
        
        bPawn1;
        bPawn2;
        bPawn3;
        bPawn4;
        bPawn5;
        bPawn6;
        bPawn7;
        bPawn8;
        
        wRook1;
        bRook1;
        wRook2;
        bRook2;
        
        wKnight1;
        bKnight1;
        wKnight2;
        bKnight2;
        
        wBishop1;
        bBishop1;
        wBishop2;
        bBishop2;
        
        wQueen1;
        bQueen1;

        bKing;
        wKing;

        workspace = [-1 2 -2 2 -1 2];
        
    end

    methods%% Class for Shape robot simulation
        function self = ChessScenario2()
            self.GetwPawn1();
            self.GetwPawn2();
            self.GetwPawn3();
            self.GetwPawn4();
            self.GetwPawn5();
            self.GetwPawn6();
            self.GetwPawn7();
            self.GetwPawn8();

            self.GetbPawn1();
            self.GetbPawn2();
            self.GetbPawn3();
            self.GetbPawn4();
            self.GetbPawn5();
            self.GetbPawn6();
            self.GetbPawn7();
            self.GetbPawn8();
            
            self.GetwRook1();
            self.GetbRook1();
            self.GetwRook2();
            self.GetbRook2();
            
            self.GetwBishop1();
            self.GetbBishop1();
            self.GetwBishop2();
            self.GetbBishop2();
            
            self.GetwKnight1();
            self.GetbKnight1();
            self.GetwKnight2();
            self.GetbKnight2();
            
            self.GetwQueen1();
            self.GetbQueen1();

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
            
            % White Pawns
            wPawn1Index = self.wPawn1.n;
            [ faceData, vertexData, plyData1{wPawn1Index+1} ] = plyread('wPawn.ply','tri'); %#ok<AGROW>
            self.wPawn1.faces{wPawn1Index+1} = faceData;
            self.wPawn1.points{wPawn1Index+1} = vertexData;
            
            wPawn2Index = self.wPawn2.n;
            [ faceData, vertexData, plyData2{wPawn2Index+1} ] = plyread('wPawn.ply','tri'); %#ok<AGROW>
            self.wPawn2.faces{wPawn2Index+1} = faceData;
            self.wPawn2.points{wPawn2Index+1} = vertexData;
            
            wPawn3Index = self.wPawn3.n;
            [ faceData, vertexData, plyData3{wPawn3Index+1} ] = plyread('wPawn.ply','tri'); %#ok<AGROW>
            self.wPawn3.faces{wPawn3Index+1} = faceData;
            self.wPawn3.points{wPawn3Index+1} = vertexData;
            
            wPawn4Index = self.wPawn4.n;
            [ faceData, vertexData, plyData4{wPawn4Index+1} ] = plyread('wPawn.ply','tri'); %#ok<AGROW>
            self.wPawn4.faces{wPawn4Index+1} = faceData;
            self.wPawn4.points{wPawn4Index+1} = vertexData;
            
            wPawn5Index = self.wPawn5.n;
            [ faceData, vertexData, plyData5{wPawn5Index+1} ] = plyread('wPawn.ply','tri'); %#ok<AGROW>
            self.wPawn5.faces{wPawn5Index+1} = faceData;
            self.wPawn5.points{wPawn5Index+1} = vertexData;
            
            wPawn6Index = self.wPawn6.n;
            [ faceData, vertexData, plyData6{wPawn6Index+1} ] = plyread('wPawn.ply','tri'); %#ok<AGROW>
            self.wPawn6.faces{wPawn6Index+1} = faceData;
            self.wPawn6.points{wPawn6Index+1} = vertexData;
            
            wPawn7Index = self.wPawn7.n;
            [ faceData, vertexData, plyData7{wPawn7Index+1} ] = plyread('wPawn.ply','tri'); %#ok<AGROW>
            self.wPawn7.faces{wPawn7Index+1} = faceData;
            self.wPawn7.points{wPawn7Index+1} = vertexData;
            
            wPawn8Index = self.wPawn8.n;
            [ faceData, vertexData, plyData8{wPawn8Index+1} ] = plyread('wPawn.ply','tri'); %#ok<AGROW>
            self.wPawn8.faces{wPawn8Index+1} = faceData;
            self.wPawn8.points{wPawn8Index+1} = vertexData;
            
            % Display Pawns
                % White Pawn 1
            self.wPawn1.plot3d(zeros(1,self.wPawn1.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wPawn1.delay = 0;
            self.wPawn1.base = transl([xPosMatrix(1),yPosMatrix(2),0]); % Move to default pos
            self.MovewPawn1(self.wPawn1.getpos);
                
                % White Pawn 2
            self.wPawn2.plot3d(zeros(1,self.wPawn2.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wPawn2.delay = 0;
            self.wPawn2.base = transl([xPosMatrix(2),yPosMatrix(2),0]); % Move to default pos
            self.MovewPawn2(self.wPawn2.getpos);    
                
                % White Pawn 3
            self.wPawn3.plot3d(zeros(1,self.wPawn3.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wPawn3.delay = 0;
            self.wPawn3.base = transl([xPosMatrix(3),yPosMatrix(2),0]); % Move to default pos
            self.MovewPawn3(self.wPawn3.getpos);
                
                % White Pawn 4
            self.wPawn4.plot3d(zeros(1,self.wPawn4.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wPawn4.delay = 0;
            self.wPawn4.base = transl([xPosMatrix(4),yPosMatrix(2),0]); % Move to default pos
            self.MovewPawn4(self.wPawn4.getpos);    
            
                % White Pawn 5
            self.wPawn5.plot3d(zeros(1,self.wPawn5.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wPawn5.delay = 0;
            self.wPawn5.base = transl([xPosMatrix(5),yPosMatrix(2),0]); % Move to default pos
            self.MovewPawn5(self.wPawn5.getpos);
                
                % White Pawn 6
            self.wPawn6.plot3d(zeros(1,self.wPawn6.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wPawn6.delay = 0;
            self.wPawn6.base = transl([xPosMatrix(6),yPosMatrix(2),0]); % Move to default pos
            self.MovewPawn6(self.wPawn6.getpos);    
                
                % White Pawn 7
            self.wPawn7.plot3d(zeros(1,self.wPawn7.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wPawn7.delay = 0;
            self.wPawn7.base = transl([xPosMatrix(7),yPosMatrix(2),0]); % Move to default pos
            self.MovewPawn7(self.wPawn7.getpos);
                
                % White Pawn 8
            self.wPawn8.plot3d(zeros(1,self.wPawn8.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wPawn8.delay = 0;
            self.wPawn8.base = transl([xPosMatrix(8),yPosMatrix(2),0]); % Move to default pos
            self.MovewPawn8(self.wPawn8.getpos);  
            
            % Black Pawns
            bPawn1Index = self.bPawn1.n;
            [ faceData, vertexData, plyData9{bPawn1Index+1} ] = plyread('bPawn.ply','tri'); %#ok<AGROW>
            self.bPawn1.faces{bPawn1Index+1} = faceData;
            self.bPawn1.points{bPawn1Index+1} = vertexData;
            
            bPawn2Index = self.bPawn2.n;
            [ faceData, vertexData, plyData10{bPawn2Index+1} ] = plyread('bPawn.ply','tri'); %#ok<AGROW>
            self.bPawn2.faces{bPawn2Index+1} = faceData;
            self.bPawn2.points{bPawn2Index+1} = vertexData;
            
            bPawn3Index = self.bPawn3.n;
            [ faceData, vertexData, plyData11{bPawn3Index+1} ] = plyread('bPawn.ply','tri'); %#ok<AGROW>
            self.bPawn3.faces{bPawn3Index+1} = faceData;
            self.bPawn3.points{bPawn3Index+1} = vertexData;
            
            bPawn4Index = self.bPawn4.n;
            [ faceData, vertexData, plyData12{bPawn4Index+1} ] = plyread('bPawn.ply','tri'); %#ok<AGROW>
            self.bPawn4.faces{bPawn4Index+1} = faceData;
            self.bPawn4.points{bPawn4Index+1} = vertexData;
            
            bPawn5Index = self.bPawn5.n;
            [ faceData, vertexData, plyData13{bPawn5Index+1} ] = plyread('bPawn.ply','tri'); %#ok<AGROW>
            self.bPawn5.faces{bPawn5Index+1} = faceData;
            self.bPawn5.points{bPawn5Index+1} = vertexData;
            
            bPawn6Index = self.bPawn6.n;
            [ faceData, vertexData, plyData14{bPawn6Index+1} ] = plyread('bPawn.ply','tri'); %#ok<AGROW>
            self.bPawn6.faces{bPawn6Index+1} = faceData;
            self.bPawn6.points{bPawn6Index+1} = vertexData;
            
            bPawn7Index = self.bPawn7.n;
            [ faceData, vertexData, plyData15{bPawn7Index+1} ] = plyread('bPawn.ply','tri'); %#ok<AGROW>
            self.bPawn7.faces{bPawn7Index+1} = faceData;
            self.bPawn7.points{bPawn7Index+1} = vertexData;
            
            bPawn8Index = self.bPawn8.n;
            [ faceData, vertexData, plyData16{bPawn8Index+1} ] = plyread('bPawn.ply','tri'); %#ok<AGROW>
            self.bPawn8.faces{bPawn8Index+1} = faceData;
            self.bPawn8.points{bPawn8Index+1} = vertexData;
            
            % Display Black Pawns
                % Black Pawn 1
            self.bPawn1.plot3d(zeros(1,self.bPawn1.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.bPawn1.delay = 0;
            self.bPawn1.base = transl([xPosMatrix(1),yPosMatrix(7),0]); % Move to default pos
            self.MovebPawn1(self.wPawn1.getpos);
                
                % Black Pawn 2
            self.bPawn2.plot3d(zeros(1,self.bPawn2.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.bPawn2.delay = 0;
            self.bPawn2.base = transl([xPosMatrix(2),yPosMatrix(7),0]); % Move to default pos
            self.MovebPawn2(self.bPawn2.getpos);    
                
                % Black Pawn 3
            self.bPawn3.plot3d(zeros(1,self.bPawn3.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.bPawn3.delay = 0;
            self.bPawn3.base = transl([xPosMatrix(3),yPosMatrix(7),0]); % Move to default pos
            self.MovebPawn3(self.bPawn3.getpos);
                
                % Black Pawn 4
            self.bPawn4.plot3d(zeros(1,self.bPawn4.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.bPawn4.delay = 0;
            self.bPawn4.base = transl([xPosMatrix(4),yPosMatrix(7),0]); % Move to default pos
            self.MovebPawn4(self.bPawn4.getpos);    
            
                % Black Pawn 5
            self.bPawn5.plot3d(zeros(1,self.bPawn5.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.bPawn5.delay = 0;
            self.bPawn5.base = transl([xPosMatrix(5),yPosMatrix(7),0]); % Move to default pos
            self.MovebPawn5(self.bPawn5.getpos);
                
                % Black Pawn 6
            self.bPawn6.plot3d(zeros(1,self.bPawn6.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.bPawn6.delay = 0;
            self.bPawn6.base = transl([xPosMatrix(6),yPosMatrix(7),0]); % Move to default pos
            self.MovebPawn6(self.bPawn6.getpos);    
                
                % Black Pawn 7
            self.bPawn7.plot3d(zeros(1,self.bPawn7.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.bPawn7.delay = 0;
            self.bPawn7.base = transl([xPosMatrix(7),yPosMatrix(7),0]); % Move to default pos
            self.MovebPawn7(self.bPawn7.getpos);
                
                % Black Pawn 8
            self.bPawn8.plot3d(zeros(1,self.bPawn8.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.bPawn8.delay = 0;
            self.bPawn8.base = transl([xPosMatrix(8),yPosMatrix(7),0]); % Move to default pos
            self.MovebPawn8(self.bPawn8.getpos);  
            
            
            % Rooks
            wRook1Index = self.wRook1.n;
            [ faceData, vertexData, plyData17{wRook1Index+1} ] = plyread('wRook.ply','tri'); %#ok<AGROW>
            self.wRook1.faces{wRook1Index+1} = faceData;
            self.wRook1.points{wRook1Index+1} = vertexData;

            bRook1Index = self.wRook2.n;
            [ faceData, vertexData, plyData18{bRook1Index+1} ] = plyread('bRook.ply','tri'); %#ok<AGROW>
            self.bRook1.faces{bRook1Index+1} = faceData;
            self.bRook1.points{bRook1Index+1} = vertexData;    
            
            wRook2Index = self.wRook2.n;
            [ faceData, vertexData, plyData19{wRook2Index+1} ] = plyread('wRook.ply','tri'); %#ok<AGROW>
            self.wRook2.faces{wRook2Index+1} = faceData;
            self.wRook2.points{wRook2Index+1} = vertexData;

            bRook2Index = self.bRook2.n;
            [ faceData, vertexData, plyData20{bRook2Index+1} ] = plyread('bRook.ply','tri'); %#ok<AGROW>
            self.bRook2.faces{bRook2Index+1} = faceData;
            self.bRook2.points{bRook2Index+1} = vertexData;
            
            % Display Rooks
                % White Rook 1
            self.wRook1.plot3d(zeros(1,self.wRook1.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wRook1.delay = 0;
            self.wRook1.base = transl([xPosMatrix(1),yPosMatrix(1),0]); % Move to default pos
            self.MovewRook1(self.wRook1.getpos);
            
                % Black Rook 1
            self.bRook1.plot3d(zeros(1,self.bRook1.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.bRook1.delay = 0;
            self.bRook1.base = transl([xPosMatrix(1),yPosMatrix(8),0]); % Move to default pos
            self.MovebRook1(self.bRook1.getpos);

                % White Rook 2
            self.wRook2.plot3d(zeros(1,self.wRook2.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wRook2.delay = 0;
            self.wRook2.base = transl([xPosMatrix(8),yPosMatrix(1),0]); % Move to default pos
            self.MovewRook2(self.wRook2.getpos); 

                % Black Rook 2
            self.bRook2.plot3d(zeros(1,self.bRook2.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.bRook2.delay = 0;
            self.bRook2.base = transl([xPosMatrix(8),yPosMatrix(8),0]); % Move to default pos
            self.MovebRook2(self.bRook2.getpos);
            
            % Bishops
            wBishop1Index = self.wBishop1.n;
            [ faceData, vertexData, plyData21{wBishop1Index+1} ] = plyread('wBishop.ply','tri'); %#ok<AGROW>
            self.wBishop1.faces{wBishop1Index+1} = faceData;
            self.wBishop1.points{wBishop1Index+1} = vertexData;

            bBishop1Index = self.bBishop1.n;
            [ faceData, vertexData, plyData22{bBishop1Index+1} ] = plyread('bBishop.ply','tri'); %#ok<AGROW>
            self.bBishop1.faces{bBishop1Index+1} = faceData;
            self.bBishop1.points{bBishop1Index+1} = vertexData;    
            
            wBishop2Index = self.wBishop2.n;
            [ faceData, vertexData, plyData23{wBishop2Index+1} ] = plyread('wBishop.ply','tri'); %#ok<AGROW>
            self.wBishop2.faces{wBishop2Index+1} = faceData;
            self.wBishop2.points{wBishop2Index+1} = vertexData;

            bBishop2Index = self.bBishop2.n;
            [ faceData, vertexData, plyData24{bBishop2Index+1} ] = plyread('bBishop.ply','tri'); %#ok<AGROW>
            self.bBishop2.faces{bBishop2Index+1} = faceData;
            self.bBishop2.points{bBishop2Index+1} = vertexData;
            
            % Display Bishops
                % White Bishop 1
            self.wBishop1.plot3d(zeros(1,self.wBishop1.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wBishop1.delay = 0;
            self.wBishop1.base = transl([xPosMatrix(3),yPosMatrix(1),0]); % Move to default pos
            self.MovewBishop1(self.wBishop1.getpos);
            
                % Black Bishop 1
            self.bBishop1.plot3d(zeros(1,self.bBishop1.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.bBishop1.delay = 0;
            self.bBishop1.base = transl([xPosMatrix(3),yPosMatrix(8),0]); % Move to default pos
            self.MovebBishop1(self.bBishop1.getpos);

                % White Bishop 2
            self.wBishop2.plot3d(zeros(1,self.wBishop2.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wBishop2.delay = 0;
            self.wBishop2.base = transl([xPosMatrix(6),yPosMatrix(1),0]); % Move to default pos
            self.MovewBishop2(self.wBishop2.getpos); 

                % Black Bishop 2
            self.bBishop2.plot3d(zeros(1,self.bBishop2.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.bBishop2.delay = 0;
            self.bBishop2.base = transl([xPosMatrix(6),yPosMatrix(8),0]); % Move to default pos
            self.MovebBishop2(self.bBishop2.getpos);
            
            % Knights
            wKnight1Index = self.wKnight1.n;
            [ faceData, vertexData, plyData25{wKnight1Index+1} ] = plyread('wKnight.ply','tri'); %#ok<AGROW>
            self.wKnight1.faces{wKnight1Index+1} = faceData;
            self.wKnight1.points{wKnight1Index+1} = vertexData;

            bKnight1Index = self.wKnight2.n;
            [ faceData, vertexData, plyData26{bKnight1Index+1} ] = plyread('bKnight.ply','tri'); %#ok<AGROW>
            self.bKnight1.faces{bKnight1Index+1} = faceData;
            self.bKnight1.points{bKnight1Index+1} = vertexData;    
            
            wKnight2Index = self.wKnight2.n;
            [ faceData, vertexData, plyData27{wKnight2Index+1} ] = plyread('wKnight.ply','tri'); %#ok<AGROW>
            self.wKnight2.faces{wKnight2Index+1} = faceData;
            self.wKnight2.points{wKnight2Index+1} = vertexData;

            bKnight2Index = self.bKnight2.n;
            [ faceData, vertexData, plyData28{bKnight2Index+1} ] = plyread('bKnight.ply','tri'); %#ok<AGROW>
            self.bKnight2.faces{bKnight2Index+1} = faceData;
            self.bKnight2.points{bKnight2Index+1} = vertexData;
            
            % Display Knights
                % White Knight 1
            self.wKnight1.plot3d(zeros(1,self.wKnight1.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wKnight1.delay = 0;
            self.wKnight1.base = transl([xPosMatrix(2),yPosMatrix(1),0]); % Move to default pos
            self.MovewKnight1(self.wKnight1.getpos);
            
                % Black Knight 1
            self.bKnight1.plot3d(zeros(1,self.bKnight1.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.bKnight1.delay = 0;
            self.bKnight1.base = transl([xPosMatrix(2),yPosMatrix(8),0]); % Move to default pos
            self.MovebKnight1(self.bKnight1.getpos);

                % White Knight 2
            self.wKnight2.plot3d(zeros(1,self.wKnight2.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wKnight2.delay = 0;
            self.wKnight2.base = transl([xPosMatrix(7),yPosMatrix(1),0]); % Move to default pos
            self.MovewKnight2(self.wKnight2.getpos); 

                % Black Knight 2
            self.bKnight2.plot3d(zeros(1,self.bKnight2.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.bKnight2.delay = 0;
            self.bKnight2.base = transl([xPosMatrix(7),yPosMatrix(8),0]); % Move to default pos
            self.MovebKnight2(self.bKnight2.getpos);
            
            %Queens
            wQueen1Index = self.wQueen1.n;
            [ faceData, vertexData, plyData29{wQueen1Index+1} ] = plyread('wQueen.ply','tri'); %#ok<AGROW>
            self.wQueen1.faces{wQueen1Index+1} = faceData;
            self.wQueen1.points{wQueen1Index+1} = vertexData;

            bQueen1Index = self.bQueen1.n;
            [ faceData, vertexData, plyData30{bQueen1Index+1} ] = plyread('bQueen.ply','tri'); %#ok<AGROW>
            self.bQueen1.faces{bQueen1Index+1} = faceData;
            self.bQueen1.points{bQueen1Index+1} = vertexData;

             % Display Queens
            self.wQueen1.plot3d(zeros(1,self.wQueen1.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wQueen1.delay = 0;
            self.wQueen1.base = transl([xPosMatrix(4),yPosMatrix(1),0]); % Move to default pos
            self.MovewQueen1(self.wQueen1.getpos);

            self.bQueen1.plot3d(zeros(1,self.bQueen1.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.bQueen1.delay = 0;
            self.bQueen1.base = transl([xPosMatrix(4),yPosMatrix(8),0]); % Move to default pos
            self.MovebQueen1(self.bQueen1.getpos);    
            
            % Kings
            bKingIndex = self.bKing.n;
            [ faceData, vertexData, plyData31{bKingIndex+1} ] = plyread('bKing.ply','tri'); %#ok<AGROW>
            self.bKing.faces{bKingIndex+1} = faceData;
            self.bKing.points{bKingIndex+1} = vertexData;

            wKingIndex = self.wKing.n;
            [ faceData, vertexData, plyData32{wKingIndex+1} ] = plyread('wKing.ply','tri'); %#ok<AGROW>
            self.wKing.faces{wKingIndex+1} = faceData;
            self.wKing.points{wKingIndex+1} = vertexData;

             % Display Kings
            self.bKing.plot3d(zeros(1,self.bKing.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.bKing.delay = 0;
            self.bKing.base = transl([xPosMatrix(5),yPosMatrix(8),0]); % Move to default pos
            self.MovebKing(self.bKing.getpos); 

            self.wKing.plot3d(zeros(1,self.wKing.n),'noarrow','workspace',self.workspace);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.wKing.delay = 0;
            self.wKing.base = transl([xPosMatrix(5),yPosMatrix(1),0]); % Move to default pos
            self.MovewKing(self.wKing.getpos); 

            
                % Colour White Pawns
                    % White Pawn 1
            for wPawn1Index = 0:self.wPawn1.n
                handles = findobj('Tag', self.wPawn1.name);
                h = get(handles,'UserData');
                try 
                    h.link(wPawn1Index+1).Children.FaceVertexCData = [plyData1{wPawn1Index+1}.vertex.red ...
                                                                  , plyData1{wPawn1Index+1}.vertex.green ...
                                                                  , plyData1{wPawn1Index+1}.vertex.blue]/255;
                    h.link(wPawn1Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end

                    % White Pawn 2
            for wPawn2Index = 0:self.wPawn2.n
                handles = findobj('Tag', self.wPawn2.name);
                h = get(handles,'UserData');
                try 
                    h.link(wPawn2Index+1).Children.FaceVertexCData = [plyData2{wPawn2Index+1}.vertex.red ...
                                                                  , plyData2{wPawn2Index+1}.vertex.green ...
                                                                  , plyData2{wPawn2Index+1}.vertex.blue]/255;
                    h.link(wPawn2Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end

                    % White Pawn 3
            for wPawn3Index = 0:self.wPawn3.n
                handles = findobj('Tag', self.wPawn3.name);
                h = get(handles,'UserData');
                try 
                    h.link(wPawn3Index+1).Children.FaceVertexCData = [plyData3{wPawn3Index+1}.vertex.red ...
                                                                  , plyData3{wPawn3Index+1}.vertex.green ...
                                                                  , plyData3{wPawn3Index+1}.vertex.blue]/255;
                    h.link(wPawn3Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
                    
                    % White Pawn 4
            for wPawn4Index = 0:self.wPawn4.n
                handles = findobj('Tag', self.wPawn4.name);
                h = get(handles,'UserData');
                try 
                    h.link(wPawn4Index+1).Children.FaceVertexCData = [plyData4{wPawn4Index+1}.vertex.red ...
                                                                  , plyData4{wPawn4Index+1}.vertex.green ...
                                                                  , plyData4{wPawn4Index+1}.vertex.blue]/255;
                    h.link(wPawn4Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
            
                    % White Pawn 5
            for wPawn5Index = 0:self.wPawn5.n
                handles = findobj('Tag', self.wPawn5.name);
                h = get(handles,'UserData');
                try 
                    h.link(wPawn5Index+1).Children.FaceVertexCData = [plyData5{wPawn5Index+1}.vertex.red ...
                                                                  , plyData5{wPawn5Index+1}.vertex.green ...
                                                                  , plyData5{wPawn5Index+1}.vertex.blue]/255;
                    h.link(wPawn5Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end

                    % White Pawn 6
            for wPawn6Index = 0:self.wPawn6.n
                handles = findobj('Tag', self.wPawn6.name);
                h = get(handles,'UserData');
                try 
                    h.link(wPawn6Index+1).Children.FaceVertexCData = [plyData6{wPawn6Index+1}.vertex.red ...
                                                                  , plyData6{wPawn6Index+1}.vertex.green ...
                                                                  , plyData6{wPawn6Index+1}.vertex.blue]/255;
                    h.link(wPawn6Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end

                    % White Pawn 7
            for wPawn7Index = 0:self.wPawn7.n
                handles = findobj('Tag', self.wPawn7.name);
                h = get(handles,'UserData');
                try 
                    h.link(wPawn7Index+1).Children.FaceVertexCData = [plyData7{wPawn7Index+1}.vertex.red ...
                                                                  , plyData7{wPawn7Index+1}.vertex.green ...
                                                                  , plyData7{wPawn7Index+1}.vertex.blue]/255;
                    h.link(wPawn7Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
                    
                    % White Pawn 8
            for wPawn8Index = 0:self.wPawn8.n
                handles = findobj('Tag', self.wPawn8.name);
                h = get(handles,'UserData');
                try 
                    h.link(wPawn8Index+1).Children.FaceVertexCData = [plyData8{wPawn8Index+1}.vertex.red ...
                                                                  , plyData8{wPawn8Index+1}.vertex.green ...
                                                                  , plyData8{wPawn8Index+1}.vertex.blue]/255;
                    h.link(wPawn8Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
            
                % Colour Black Pawns
                    % Black Pawn 1
            for bPawn1Index = 0:self.bPawn1.n
                handles = findobj('Tag', self.bPawn1.name);
                h = get(handles,'UserData');
                try 
                    h.link(bPawn1Index+1).Children.FaceVertexCData = [plyData9{bPawn1Index+1}.vertex.red ...
                                                                  , plyData9{bPawn1Index+1}.vertex.green ...
                                                                  , plyData9{bPawn1Index+1}.vertex.blue]/255;
                    h.link(bPawn1Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end

                    % Black Pawn 2
            for bPawn2Index = 0:self.bPawn2.n
                handles = findobj('Tag', self.bPawn2.name);
                h = get(handles,'UserData');
                try 
                    h.link(bPawn2Index+1).Children.FaceVertexCData = [plyData10{bPawn2Index+1}.vertex.red ...
                                                                  , plyData10{bPawn2Index+1}.vertex.green ...
                                                                  , plyData10{bPawn2Index+1}.vertex.blue]/255;
                    h.link(bPawn2Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end

                    % Black Pawn 3
            for bPawn3Index = 0:self.bPawn3.n
                handles = findobj('Tag', self.bPawn3.name);
                h = get(handles,'UserData');
                try 
                    h.link(bPawn3Index+1).Children.FaceVertexCData = [plyData11{bPawn3Index+1}.vertex.red ...
                                                                  , plyData11{bPawn3Index+1}.vertex.green ...
                                                                  , plyData11{bPawn3Index+1}.vertex.blue]/255;
                    h.link(bPawn3Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
                    
                    % Black Pawn 4
            for bPawn4Index = 0:self.bPawn4.n
                handles = findobj('Tag', self.bPawn4.name);
                h = get(handles,'UserData');
                try 
                    h.link(bPawn4Index+1).Children.FaceVertexCData = [plyData12{bPawn4Index+1}.vertex.red ...
                                                                  , plyData12{bPawn4Index+1}.vertex.green ...
                                                                  , plyData12{bPawn4Index+1}.vertex.blue]/255;
                    h.link(bPawn4Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
            
                    % Black Pawn 5
            for bPawn5Index = 0:self.bPawn5.n
                handles = findobj('Tag', self.bPawn5.name);
                h = get(handles,'UserData');
                try 
                    h.link(bPawn5Index+1).Children.FaceVertexCData = [plyData13{bPawn5Index+1}.vertex.red ...
                                                                  , plyData13{bPawn5Index+1}.vertex.green ...
                                                                  , plyData13{bPawn5Index+1}.vertex.blue]/255;
                    h.link(bPawn5Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end

                    % Black Pawn 6
            for bPawn6Index = 0:self.bPawn6.n
                handles = findobj('Tag', self.bPawn6.name);
                h = get(handles,'UserData');
                try 
                    h.link(bPawn6Index+1).Children.FaceVertexCData = [plyData14{bPawn6Index+1}.vertex.red ...
                                                                  , plyData14{bPawn6Index+1}.vertex.green ...
                                                                  , plyData14{bPawn6Index+1}.vertex.blue]/255;
                    h.link(bPawn6Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end

                    % Black Pawn 7
            for bPawn7Index = 0:self.bPawn7.n
                handles = findobj('Tag', self.bPawn7.name);
                h = get(handles,'UserData');
                try 
                    h.link(bPawn7Index+1).Children.FaceVertexCData = [plyData15{bPawn7Index+1}.vertex.red ...
                                                                  , plyData15{bPawn7Index+1}.vertex.green ...
                                                                  , plyData15{bPawn7Index+1}.vertex.blue]/255;
                    h.link(bPawn7Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
                    
                    % Black Pawn 8
            for bPawn8Index = 0:self.bPawn8.n
                handles = findobj('Tag', self.bPawn8.name);
                h = get(handles,'UserData');
                try 
                    h.link(bPawn8Index+1).Children.FaceVertexCData = [plyData16{bPawn8Index+1}.vertex.red ...
                                                                  , plyData16{bPawn8Index+1}.vertex.green ...
                                                                  , plyData16{bPawn8Index+1}.vertex.blue]/255;
                    h.link(bPawn8Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
            
                % Colour Rooks
                    % White Rook 1
            for wRook1Index = 0:self.wRook1.n
                handles = findobj('Tag', self.wRook1.name);
                h = get(handles,'UserData');
                try 
                    h.link(wRook1Index+1).Children.FaceVertexCData = [plyData17{wRook1Index+1}.vertex.red ...
                                                                  , plyData17{wRook1Index+1}.vertex.green ...
                                                                  , plyData17{wRook1Index+1}.vertex.blue]/255;
                    h.link(wRook1Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
            
                    % Black Rook 1
            for bRook1Index = 0:self.bRook1.n
                handles = findobj('Tag', self.bRook1.name);
                h = get(handles,'UserData');
                try 
                    h.link(bRook1Index+1).Children.FaceVertexCData = [plyData18{bRook1Index+1}.vertex.red ...
                                                                  , plyData18{bRook1Index+1}.vertex.green ...
                                                                  , plyData18{bRook1Index+1}.vertex.blue]/255;
                    h.link(bRook1Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
            
                    % White Rook 2
            for wRook2Index = 0:self.wRook2.n
                handles = findobj('Tag', self.wRook2.name);
                h = get(handles,'UserData');
                try 
                    h.link(wRook2Index+1).Children.FaceVertexCData = [plyData19{wRook2Index+1}.vertex.red ...
                                                                  , plyData19{wRook2Index+1}.vertex.green ...
                                                                  , plyData19{wRook2Index+1}.vertex.blue]/255;
                    h.link(wRook2Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
            
                    % Black Rook 2
            for bRook2Index = 0:self.bRook2.n
                handles = findobj('Tag', self.bRook2.name);
                h = get(handles,'UserData');
                try 
                    h.link(bRook2Index+1).Children.FaceVertexCData = [plyData20{bRook2Index+1}.vertex.red ...
                                                                  , plyData20{bRook2Index+1}.vertex.green ...
                                                                  , plyData20{bRook2Index+1}.vertex.blue]/255;
                    h.link(bRook2Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
            
                % Colour Bishops
                    % White Bishop 1
            for wBishop1Index = 0:self.wBishop1.n
                handles = findobj('Tag', self.wBishop1.name);
                h = get(handles,'UserData');
                try 
                    h.link(wBishop1Index+1).Children.FaceVertexCData = [plyData21{wBishop1Index+1}.vertex.red ...
                                                                  , plyData21{wBishop1Index+1}.vertex.green ...
                                                                  , plyData21{wBishop1Index+1}.vertex.blue]/255;
                    h.link(wBishop1Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
            
                    % Black Bishop 1
            for bBishop1Index = 0:self.bBishop1.n
                handles = findobj('Tag', self.bBishop1.name);
                h = get(handles,'UserData');
                try 
                    h.link(bBishop1Index+1).Children.FaceVertexCData = [plyData22{bBishop1Index+1}.vertex.red ...
                                                                  , plyData22{bBishop1Index+1}.vertex.green ...
                                                                  , plyData22{bBishop1Index+1}.vertex.blue]/255;
                    h.link(bBishop1Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
            
                    % White Bishop 2
            for wBishop2Index = 0:self.wBishop2.n
                handles = findobj('Tag', self.wBishop2.name);
                h = get(handles,'UserData');
                try 
                    h.link(wBishop2Index+1).Children.FaceVertexCData = [plyData23{wBishop2Index+1}.vertex.red ...
                                                                  , plyData23{wBishop2Index+1}.vertex.green ...
                                                                  , plyData23{wBishop2Index+1}.vertex.blue]/255;
                    h.link(wBishop2Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
                   
                    % Black Bishop 2
            for bBishop2Index = 0:self.bBishop2.n
                handles = findobj('Tag', self.bBishop2.name);
                h = get(handles,'UserData');
                try 
                    h.link(bBishop2Index+1).Children.FaceVertexCData = [plyData24{bBishop2Index+1}.vertex.red ...
                                                                  , plyData24{bBishop2Index+1}.vertex.green ...
                                                                  , plyData24{bBishop2Index+1}.vertex.blue]/255;
                    h.link(bBishop2Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
            
                % Colour Knights
                    % White Knight 1
            for wKnight1Index = 0:self.wKnight1.n
                handles = findobj('Tag', self.wKnight1.name);
                h = get(handles,'UserData');
                try 
                    h.link(wKnight1Index+1).Children.FaceVertexCData = [plyData25{wKnight1Index+1}.vertex.red ...
                                                                  , plyData25{wKnight1Index+1}.vertex.green ...
                                                                  , plyData25{wKnight1Index+1}.vertex.blue]/255;
                    h.link(wKnight1Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
            
                    % Black Knight 1
            for bKnight1Index = 0:self.bKnight1.n
                handles = findobj('Tag', self.bKnight1.name);
                h = get(handles,'UserData');
                try 
                    h.link(bKnight1Index+1).Children.FaceVertexCData = [plyData26{bKnight1Index+1}.vertex.red ...
                                                                  , plyData26{bKnight1Index+1}.vertex.green ...
                                                                  , plyData26{bKnight1Index+1}.vertex.blue]/255;
                    h.link(bKnight1Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
            
                    % White Knight 2
            for wKnight2Index = 0:self.wKnight2.n
                handles = findobj('Tag', self.wKnight2.name);
                h = get(handles,'UserData');
                try 
                    h.link(wKnight2Index+1).Children.FaceVertexCData = [plyData27{wKnight2Index+1}.vertex.red ...
                                                                  , plyData27{wKnight2Index+1}.vertex.green ...
                                                                  , plyData27{wKnight2Index+1}.vertex.blue]/255;
                    h.link(wKnight2Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
            
                    % Black Knight 2
            for bKnight2Index = 0:self.bKnight2.n
                handles = findobj('Tag', self.bKnight2.name);
                h = get(handles,'UserData');
                try 
                    h.link(bKnight2Index+1).Children.FaceVertexCData = [plyData28{bKnight2Index+1}.vertex.red ...
                                                                  , plyData28{bKnight2Index+1}.vertex.green ...
                                                                  , plyData28{bKnight2Index+1}.vertex.blue]/255;
                    h.link(bKnight2Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
            
                % Colour Queens
                    % White Queen 1
            for wQueen1Index = 0:self.wQueen1.n
                handles = findobj('Tag', self.wQueen1.name);
                h = get(handles,'UserData');
                try 
                    h.link(wQueen1Index+1).Children.FaceVertexCData = [plyData29{wQueen1Index+1}.vertex.red ...
                                                                  , plyData29{wQueen1Index+1}.vertex.green ...
                                                                  , plyData29{wQueen1Index+1}.vertex.blue]/255;
                    h.link(wQueen1Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
            
                    % Black Queen 1
            for bQueen1Index = 0:self.bQueen1.n
                handles = findobj('Tag', self.bQueen1.name);
                h = get(handles,'UserData');
                try 
                    h.link(bQueen1Index+1).Children.FaceVertexCData = [plyData30{bQueen1Index+1}.vertex.red ...
                                                                  , plyData30{bQueen1Index+1}.vertex.green ...
                                                                  , plyData30{bQueen1Index+1}.vertex.blue]/255;
                    h.link(bQueen1Index+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end  
            
                 % Colour Kings
                    % Black King
            for bKingIndex = 0:self.bKing.n
                handles = findobj('Tag', self.bKing.name);
                h = get(handles,'UserData');
                try 
                    h.link(bKingIndex+1).Children.FaceVertexCData = [plyData31{bKingIndex+1}.vertex.red ...
                                                                  , plyData31{bKingIndex+1}.vertex.green ...
                                                                  , plyData31{bKingIndex+1}.vertex.blue]/255;
                    h.link(bKingIndex+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end 
            
                   % White King
            for wKingIndex = 0:self.wKing.n
                handles = findobj('Tag', self.wKing.name);
                h = get(handles,'UserData');
                try 
                    h.link(wKingIndex+1).Children.FaceVertexCData = [plyData32{wKingIndex+1}.vertex.red ...
                                                                  , plyData32{wKingIndex+1}.vertex.green ...
                                                                  , plyData32{wKingIndex+1}.vertex.blue]/255;
                    h.link(wKingIndex+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end  
        end
        
        %% Piece Functions
            % White Pawns
                % White Pawn 1
        function GetwPawn1(self)
            name = 'wPawn1';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.wPawn1 = SerialLink(L1, 'name', name);
        end
                
                % White Pawn 2
        function GetwPawn2(self)
            name = 'wPawn2';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.wPawn2 = SerialLink(L1, 'name', name);
        end
                
                % White Pawn 3
        function GetwPawn3(self)
            name = 'wPawn3';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.wPawn3 = SerialLink(L1, 'name', name);
        end

                % White Pawn 4
        function GetwPawn4(self)
            name = 'wPawn4';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.wPawn4 = SerialLink(L1, 'name', name);
        end

                % White Pawn 5
        function GetwPawn5(self)
            name = 'wPawn5';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.wPawn5 = SerialLink(L1, 'name', name);
        end

                % White Pawn 6
        function GetwPawn6(self)
            name = 'wPawn6';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.wPawn6 = SerialLink(L1, 'name', name);
        end
        
                % White Pawn 7
        function GetwPawn7(self)
            name = 'wPawn7';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.wPawn7 = SerialLink(L1, 'name', name);
        end
                
                % White Pawn 8
        function GetwPawn8(self)
            name = 'wPawn8';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.wPawn8 = SerialLink(L1, 'name', name);
        end
        
            % Black Pawns
                % Black Pawn 1
        function GetbPawn1(self)
            name = 'bPawn1';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.bPawn1 = SerialLink(L1, 'name', name);
        end

        function GetbPawn2(self)
            name = 'bPawn2';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.bPawn2 = SerialLink(L1, 'name', name);
        end
        
        function GetbPawn3(self)
            name = 'bPawn3';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.bPawn3 = SerialLink(L1, 'name', name);
        end

        function GetbPawn4(self)
            name = 'bPawn4';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.bPawn4 = SerialLink(L1, 'name', name);
        end

        function GetbPawn5(self)
            name = 'bPawn5';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.bPawn5 = SerialLink(L1, 'name', name);
        end

        function GetbPawn6(self)
            name = 'bPawn6';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.bPawn6 = SerialLink(L1, 'name', name);
        end
        
        function GetbPawn7(self)
            name = 'bPawn7';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.bPawn7 = SerialLink(L1, 'name', name);
        end

        function GetbPawn8(self)
            name = 'bPawn8';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.bPawn8 = SerialLink(L1, 'name', name);
        end
        
        % Rooks
        function GetwRook1(self)
            name = 'wRook1';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.wRook1 = SerialLink(L1, 'name', name);
        end

        function GetbRook1(self)
            name = 'bRook1';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.bRook1 = SerialLink(L1, 'name', name);
        end        
        
        function GetwRook2(self)
            name = 'wRook2';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.wRook2 = SerialLink(L1, 'name', name);
        end

        function GetbRook2(self)
            name = 'bRook2';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.bRook2 = SerialLink(L1, 'name', name);
        end   
        
        % Bishops
        function GetwBishop1(self)
            name = 'wBishop1';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.wBishop1 = SerialLink(L1, 'name', name);
        end
        
        function GetbBishop1(self)
            name = 'bBishop1';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.bBishop1 = SerialLink(L1, 'name', name);
        end
        
        function GetwBishop2(self)
            name = 'wBishop2';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.wBishop2 = SerialLink(L1, 'name', name);
        end
        
        function GetbBishop2(self)
            name = 'bBishop2';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.bBishop2 = SerialLink(L1, 'name', name);
        end
        
        % Knights
        function GetwKnight1(self)
            name = 'wKnight1';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.wKnight1 = SerialLink(L1, 'name', name);
        end

        function GetbKnight1(self)
            name = 'bKnight1';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.bKnight1 = SerialLink(L1, 'name', name);
        end

        function GetwKnight2(self)
            name = 'wKnight2';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.wKnight2 = SerialLink(L1, 'name', name);
        end

        function GetbKnight2(self)
            name = 'bKnight2';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.bKnight2 = SerialLink(L1, 'name', name);
        end
        
        % Queens
        function GetwQueen1(self)
            name = 'wQueen1';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.wQueen1 = SerialLink(L1, 'name', name);
        end

        function GetbQueen1(self)
            name = 'bQueen1';
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            self.bQueen1 = SerialLink(L1, 'name', name);
        end

        % Kings
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
        % White Pawn 1
         function MovewPawn1(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wPawn1.animate(qTrajectory(i,:));
                drawnow()
            end
         end         
         
         % White Pawn 2
         function MovewPawn2(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wPawn2.animate(qTrajectory(i,:));
                drawnow()
            end
         end     
         
        % White Pawn 3
         function MovewPawn3(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wPawn3.animate(qTrajectory(i,:));
                drawnow()
            end
         end         
         
         % White Pawn 4
         function MovewPawn4(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wPawn4.animate(qTrajectory(i,:));
                drawnow()
            end
         end   
         
        % White Pawn 5
         function MovewPawn5(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wPawn5.animate(qTrajectory(i,:));
                drawnow()
            end
         end         
         
         % White Pawn 6
         function MovewPawn6(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wPawn6.animate(qTrajectory(i,:));
                drawnow()
            end
         end     
         
        % White Pawn 7
         function MovewPawn7(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wPawn7.animate(qTrajectory(i,:));
                drawnow()
            end
         end         
         
         % White Pawn 8
         function MovewPawn8(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wPawn8.animate(qTrajectory(i,:));
                drawnow()
            end
         end  
         
          % Black Pawn 1
         function MovebPawn1(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.bPawn1.animate(qTrajectory(i,:));
                drawnow()
            end
         end  
         
         % Black Pawn 2
          function MovebPawn2(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.bPawn2.animate(qTrajectory(i,:));
                drawnow()
            end
          end  

          % Black Pawn 3
         function MovebPawn3(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.bPawn3.animate(qTrajectory(i,:));
                drawnow()
            end
         end  
         
         % Black Pawn 4
          function MovebPawn4(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.bPawn4.animate(qTrajectory(i,:));
                drawnow()
            end
          end  
          
          % Black Pawn 5
         function MovebPawn5(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.bPawn5.animate(qTrajectory(i,:));
                drawnow()
            end
         end  
         
         % Black Pawn 6
          function MovebPawn6(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.bPawn6.animate(qTrajectory(i,:));
                drawnow()
            end
          end  

          % Black Pawn 7
         function MovebPawn7(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.bPawn7.animate(qTrajectory(i,:));
                drawnow()
            end
         end  
         
         % Black Pawn 8
          function MovebPawn8(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.bPawn8.animate(qTrajectory(i,:));
                drawnow()
            end
          end  
          
        % White Rook 1
         function MovewRook1(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wRook1.animate(qTrajectory(i,:));
                drawnow()
            end
         end  
         
         % Black Rook 1
          function MovebRook1(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.bRook1.animate(qTrajectory(i,:));
                drawnow()
            end
          end  
          
        % White Rook 2
         function MovewRook2(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wRook2.animate(qTrajectory(i,:));
                drawnow()
            end
         end  
         
         % Black Rook 2
          function MovebRook2(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.bRook2.animate(qTrajectory(i,:));
                drawnow()
            end
          end  
          
         % White Bishop 1
         function MovewBishop1(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wBishop1.animate(qTrajectory(i,:));
                drawnow()
            end
         end  

         % Black Bishop 1
         function MovebBishop1(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.bBishop1.animate(qTrajectory(i,:));
                drawnow()
            end
         end  
 
         % White Bishop 2
         function MovewBishop2(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wBishop2.animate(qTrajectory(i,:));
                drawnow()
            end
         end  

         % Black Bishop 2
         function MovebBishop2(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.bBishop2.animate(qTrajectory(i,:));
                drawnow()
            end
         end
         
          % White Knight 1
         function MovewKnight1(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wKnight1.animate(qTrajectory(i,:));
                drawnow()
            end
         end  
 
          % Black Knight 1
         function MovebKnight1(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.bKnight1.animate(qTrajectory(i,:));
                drawnow()
            end
         end  
         
          % White Knight 2
         function MovewKnight2(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wKnight2.animate(qTrajectory(i,:));
                drawnow()
            end
         end  
 
          % Black Knight 1
         function MovebKnight2(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.bKnight2.animate(qTrajectory(i,:));
                drawnow()
            end
         end  
         
        % White Queen 1
        function MovewQueen1(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wQueen1.animate(qTrajectory(i,:));
                drawnow()
            end
        end
        
        % Black Queen 1
        function MovebQueen1(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.bQueen1.animate(qTrajectory(i,:));
                drawnow()
            end
        end      
        
        % Black King
        function MovebKing(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.bKing.animate(qTrajectory(i,:));
                drawnow()
            end
        end      
        
        % White King
        function MovewKing(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.wKing.animate(qTrajectory(i,:));
                drawnow()
            end
        end       
    end    
end