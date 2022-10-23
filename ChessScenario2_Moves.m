%% Fastest Known Checkmate
%% Move 1
% White Move
wPawn6StartPose = transl([xPosMatrixMatrix(6), yPosMatrix(2), ChessHeight]);
wPawn6EndPose = transl([xPosMatrix(6), yPosMatrix(3),ChessHeight]);

q1 = i5bot.model.ikcon(wPawn6StartPose*trotx(pi)*trotz(pi));

q2 = i5bot.model.ikcon(wPawn6EndPose*trotx(pi)*trotz(pi));


RMRC(i5bot,q1,steps);

RMRC(i5bot,q2,steps);
Scenario2.wPawn6.base = transl([xPosMatrix(6), yPosMatrix(3),0]);
Scenario2.MovewPawn6(Scenario2.wPawn6.getpos());

RMRC(i5bot,UR5jd,steps);

% Black Move 
bPawn5StartPose = transl([xPosMatrix(5), yPosMatrix(7), ChessHeight]);
bPawn5EndPose = transl([xPosMatrix(5), yPosMatrix(5),ChessHeight]);

q1 = UR5bot.model.ikcon(bPawn5StartPose*trotx(pi)*trotz(pi));
q2 = UR5bot.model.ikcon(bPawn5EndPose*trotx(pi)*trotz(pi));

RMRC(UR5bot,q1,steps);

RMRC(UR5bot,q2,steps);
Scenario2.bPawn5.base = transl([xPosMatrix(5), yPosMatrix(5),0]);
Scenario2.MovebPawn5(Scenario2.bPawn5.getpos());

RMRC(UR5bot,i5jd,steps);

%% Move 2
% White Move
wPawn6StartPose = transl([xPosMatrix(7), yPosMatrix(2), ChessHeight]);
wPawn6EndPose = transl([xPosMatrix(7), yPosMatrix(4),ChessHeight]);

q1 = i5bot.model.ikcon(wPawn6StartPose*trotx(pi)*trotz(pi));

q2 = i5bot.model.ikcon(wPawn6EndPose*trotx(pi)*trotz(pi));


RMRC(i5bot,q1,steps);

RMRC(i5bot,q2,steps);
Scenario2.wPawn7.base = transl([xPosMatrix(7), yPosMatrix(4),0]);
Scenario2.MovewPawn7(Scenario2.wPawn7.getpos());

RMRC(i5bot,UR5jd,steps);

% Black Move 
bQueen1StartPose = transl([xPosMatrix(4), yPosMatrix(8), ChessHeight]);
bQueen1EndPose = transl([xPosMatrix(8), yPosMatrix(4),ChessHeight]);

q1 = UR5bot.model.ikcon(bQueen1StartPose*trotx(pi)*trotz(pi));
q2 = UR5bot.model.ikcon(bQueen1EndPose*trotx(pi)*trotz(pi));

RMRC(UR5bot,q1,steps);

RMRC(UR5bot,q2,steps);
Scenario2.bQueen1.base = transl([xPosMatrix(8), yPosMatrix(4),0]);
Scenario2.MovebQueen1(Scenario2.bQueen1.getpos());

RMRC(UR5bot,i5jd,steps);

display('Checkmate! Black Wins')