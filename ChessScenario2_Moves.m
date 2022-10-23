%% Fastest Known Checkmate
%% Move 1
% White Move
wPawn6StartPose = transl([xPos(6), yPos(2), ChessHeight]);
wPawn6EndPose = transl([xPos(6), yPos(3),ChessHeight]);

q1 = i5bot.model.ikcon(wPawn6StartPose*trotx(pi)*trotz(pi));

q2 = i5bot.model.ikcon(wPawn6EndPose*trotx(pi)*trotz(pi));


RMRC(i5bot,q1,steps);

RMRC(i5bot,q2,steps);
Scenario2.wPawn6.base = transl([xPos(6), yPos(3),0]);
Scenario2.MovewPawn6(Scenario2.wPawn6.getpos());

RMRC(i5bot,UR5jd,steps);

% Black Move 
bPawn5StartPose = transl([xPos(5), yPos(7), ChessHeight]);
bPawn5EndPose = transl([xPos(5), yPos(5),ChessHeight]);

q1 = UR5bot.model.ikcon(bPawn5StartPose*trotx(pi)*trotz(pi));
q2 = UR5bot.model.ikcon(bPawn5EndPose*trotx(pi)*trotz(pi));

RMRC(UR5bot,q1,steps);

RMRC(UR5bot,q2,steps);
Scenario2.bPawn5.base = transl([xPos(5), yPos(5),0]);
Scenario2.MovebPawn5(Scenario2.bPawn5.getpos());

RMRC(UR5bot,i5jd,steps);

%% Move 2
% White Move
wPawn6StartPose = transl([xPos(7), yPos(2), ChessHeight]);
wPawn6EndPose = transl([xPos(7), yPos(4),ChessHeight]);

q1 = i5bot.model.ikcon(wPawn6StartPose*trotx(pi)*trotz(pi));

q2 = i5bot.model.ikcon(wPawn6EndPose*trotx(pi)*trotz(pi));


RMRC(i5bot,q1,steps);

RMRC(i5bot,q2,steps);
Scenario2.wPawn7.base = transl([xPos(7), yPos(4),0]);
Scenario2.MovewPawn7(Scenario2.wPawn7.getpos());

RMRC(i5bot,UR5jd,steps);

% Black Move 
bQueen1StartPose = transl([xPos(4), yPos(8), ChessHeight]);
bQueen1EndPose = transl([xPos(8), yPos(4),ChessHeight]);

q1 = UR5bot.model.ikcon(bQueen1StartPose*trotx(pi)*trotz(pi));
q2 = UR5bot.model.ikcon(bQueen1EndPose*trotx(pi)*trotz(pi));

RMRC(UR5bot,q1,steps);

RMRC(UR5bot,q2,steps);
Scenario2.bQueen1.base = transl([xPos(8), yPos(4),0]);
Scenario2.MovebQueen1(Scenario2.bQueen1.getpos());

RMRC(UR5bot,i5jd,steps);

display('Checkmate! Black Wins')