function Assignment2()
%%


% "CONTROL + ENTER" TO RUN
% "CONTROL + ENTER" TO RUN
% "CONTROL + ENTER" TO RUN
% "CONTROL + ENTER" TO RUN
% "CONTROL + ENTER" TO RUN
% "CONTROL + ENTER" TO RUN
% "CONTROL + ENTER" TO RUN
% "CONTROL + ENTER" TO RUN     ALSO CHANGE FOLDER LOCATION TO FILE!!!


%Code is slightly different to code in demonstartion, I have combined the
%two seperate codes into one file with the LinearUR3.m being called to in
%this code and the animation of the arm is no longer a seperate file, Just
%Hit ENTER to go through the various stages of the code.



surf([-1.8,-1.8;1.8,1.8],[-1.8,1.8;-1.8,1.8],[0.01,0.01;0.01,0.01],'CData',imread('concrete.jpg'),'FaceColor','texturemap'); %PLACE CONCRETE FLOOR

robot = LinearUR3(); % Run UR3 on Linear Slider

% Robot.model.teach();

% Robot.model.GetPos();

% display('Press enter to continue');


hold on;



input('Press enter to set Stage, bricks and button')


% Setup Button on floor
buttonPosition = [0.38,1,0];
PlaceObject('StopButton.ply',buttonPosition);


% % Place Fire Extingusher
% ExtingusherPosition = [0.38,-1,0];
% PlaceObject('FireExtingusher.ply',ExtingusherPosition);


% Place Barrier
barrierPosition = [0,0.8,0];
PlaceObject('barrier.ply',barrierPosition);

barrierPosition = [0.71,0.8,0];
PlaceObject('barrier.ply',barrierPosition);

barrierPosition = [-0.71,0.8,0];
PlaceObject('barrier.ply',barrierPosition);

barrierPosition = [1.42,0.8,0];
PlaceObject('barrier.ply',barrierPosition);

barrierPosition = [-1.42,0.8,0];
PlaceObject('barrier.ply',barrierPosition);


% [f,v,data] = plyread('StopButton.ply','tri')

%Stacked Bricks
PieceInitial = [0.38,0,-0.02];   %set initial brick location
PieceHeight = [0,0,0.0335];   %brick height dimention
PieceWidth = [0,0.135,0];   %brick width dimention
PieceRow2 = [0.48,0,-0.02];
PieceRow3 = [0.56,0,-0.02];

for nPiece = 1:9
    hold on

%   brick setup
    if nPiece == 1
        PiecePosition = PieceInitial + PieceHeight;
        PlaceObject('wPawn.ply',PiecePosition);
        brick1Location = PiecePosition;
    end
    if nPiece == 2
        PiecePosition = PiecePosition + PieceWidth;
        PlaceObject('wPawn.ply',PiecePosition);
        brick2Location = PiecePosition;
    end
    if nPiece == 3
        PiecePosition = PiecePosition + PieceWidth;
        PlaceObject('wPawn.ply',PiecePosition);
        brick3Location = PiecePosition;
    end
    if nPiece == 4
        PiecePosition = PiecePosition + PieceWidth;
        PlaceObject('wPawn.ply',PiecePosition);
        brick4Location = PiecePosition;
    end
    if nPiece == 5
        PiecePosition = PiecePosition + PieceWidth;
        PlaceObject('wPawn.ply',PiecePosition);
        brick5Location = PiecePosition;
    end
    if nPiece == 6
        PiecePosition = PieceRow2 + PieceHeight;
        PlaceObject('wPawn.ply',PiecePosition);
        brick6Location = PiecePosition;
    end
    if nPiece == 7
        PiecePosition = PiecePosition + PieceWidth;
        PlaceObject('wPawn.ply',PiecePosition);
        brick7Location = PiecePosition;
    end
    if nPiece == 8
        PiecePosition = PiecePosition + PieceWidth;
        PlaceObject('wPawn.ply',PiecePosition);
        brick8Location = PiecePosition;
    end
    if nPiece == 9
        PiecePosition = PieceRow3 + PieceHeight;
        PlaceObject('wPawn.ply',PiecePosition);
        brick9Location = PiecePosition;
    end

end


input('Press enter to start Animation')


getoldposofmodel = robot.model.getpos

startingpos = robot.model.fkine(getoldposofmodel)
endingpos = transl(brick1Location)

traj1 = ctraj(startingpos,endingpos,100) % Displays robot trajectory matrix positions of end effector as it moves to brick 1 Location

for i = 1:100
robot.model.animate( robot.model.ikcon( traj1(:,:,i) ));
drawnow()
end

brick1Location
