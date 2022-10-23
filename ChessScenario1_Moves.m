%% Move 1
%White Move
wQueen1CurrentPose = transl([xPosMatrix(2), yPosMatrix(2), ChessHeight]);
wQueen1EndPose = transl([xPosMatrix(2), yPosMatrix(4),ChessHeight]);

q1 = UR5bot.model.ikcon(wQueen1CurrentPose*trotx(pi)*trotz(pi));

q2 = UR5bot.model.ikcon(wQueen1EndPose*trotx(pi)*trotz(pi));


RMRC(UR5bot,q1,steps);

RMRC(UR5bot,q2,steps);
Scenario1.wQueen1.base = transl([xPosMatrix(2), yPosMatrix(4),0]);
Scenario1.MovewQueen1(Scenario1.wQueen1.getpos);

RMRC(UR5bot,UR5jd,steps);

% Black Move 
bKingCurrentPose = transl([xPosMatrix(5), yPosMatrix(4), ChessHeight]);
bKingEndPose = transl([xPosMatrix(4), yPosMatrix(5),ChessHeight]);

q1 = i5bot.model.ikcon(bKingCurrentPose*trotx(pi)*trotz(pi));
q2 = i5bot.model.ikcon(bKingEndPose*trotx(pi)*trotz(pi));

RMRC(i5bot,q1,steps);

RMRC(i5bot,q2,steps);
Scenario1.bKing.base = transl([xPosMatrix(4), yPosMatrix(5),0]);
Scenario1.MovebKing(Scenario1.bKing.getpos);

RMRC(i5bot,i5jd,steps);

    %% Move 2
q1 = UR5bot.model.getpos;
T1 = transl([xPosMatrix(1), yPosMatrix(3), ChessHeight])*trotx(pi)*trotz(pi);

q2 = UR5bot.model.ikcon(T1);
T2 = transl([xPosMatrix(1), yPosMatrix(5), ChessHeight])*trotx(pi)*trotz(pi);

q3 = UR5bot.model.ikcon(T2);

q4 = i5bot.model.getpos;
T4 = transl([xPosMatrix(4), yPosMatrix(5), ChessHeight])*trotx(pi)*trotz(pi);

q5 = i5bot.model.ikcon(T4);
T5 = transl([xPosMatrix(3), yPosMatrix(6), ChessHeight])*trotx(pi)*trotz(pi);

q6 = i5bot.model.ikcon(T5);

RMRC(UR5bot,q2,steps,Scenario1,bKingCurrentPose);
RMRC(UR5bot,q3,steps,Scenario1,bKingCurrentPose);
Scenario1.wQueen2.base = transl([xPosMatrix(1), yPosMatrix(5),0]);
Scenario1.MovewQueen2(Scenario1.wQueen2.getpos);
RMRC(UR5bot,UR5jd,steps,Scenario1,bKingCurrentPose);

RMRC(i5bot,q5,steps);
RMRC(i5bot,q6,steps);
Scenario1.bKing.base = transl([xPosMatrix(3), yPosMatrix(6),0]);
Scenario1.MovebKing(Scenario1.bKing.getpos);
RMRC(i5bot,i5jd,steps);

    %% Move 3
q1 = UR5bot.model.getpos;
T1 = transl([xPosMatrix(2), yPosMatrix(4), ChessHeight])*trotx(pi)*trotz(pi);

q2 = UR5bot.model.ikcon(T1);
T2 = transl([xPosMatrix(2), yPosMatrix(6), ChessHeight])*trotx(pi)*trotz(pi);

q3 = UR5bot.model.ikcon(T2);

q4 = i5bot.model.getpos;
T4 = transl([xPosMatrix(3), yPosMatrix(6), ChessHeight])*trotx(pi)*trotz(pi);

q5 = i5bot.model.ikcon(T4);
T5 = transl([xPosMatrix(4), yPosMatrix(7), ChessHeight])*trotx(pi)*trotz(pi);

q6 = i5bot.model.ikcon(T5);

RMRC(UR5bot,q2,steps);
RMRC(UR5bot,q3,steps);
Scenario1.wQueen1.base = transl([xPosMatrix(2), yPosMatrix(6),0]);
Scenario1.MovewQueen1(Scenario1.wQueen1.getpos);
RMRC(UR5bot,UR5jd,steps);

RMRC(i5bot,q5,steps);
RMRC(i5bot,q6,steps);
Scenario1.bKing.base = transl([xPosMatrix(4), yPosMatrix(7),0]);
Scenario1.MovebKing(Scenario1.bKing.getpos);
RMRC(i5bot,i5jd,steps);

    %% Move 4
q1 = UR5bot.model.getpos;
T1 = transl([xPosMatrix(1), yPosMatrix(5), ChessHeight])*trotx(pi)*trotz(pi);

q2 = UR5bot.model.ikcon(T1);
T2 = transl([xPosMatrix(1), yPosMatrix(7), ChessHeight])*trotx(pi)*trotz(pi);

q3 = UR5bot.model.ikcon(T2);

q4 = i5bot.model.getpos;
T4 = transl([xPosMatrix(4), yPosMatrix(7), ChessHeight])*trotx(pi)*trotz(pi);

q5 = i5bot.model.ikcon(T4);
T5 = transl([xPosMatrix(3), yPosMatrix(8), ChessHeight])*trotx(pi)*trotz(pi);

q6 = i5bot.model.ikcon(T5);

RMRC(UR5bot,q2,steps);
RMRC(UR5bot,q3,steps);
Scenario1.wQueen2.base = transl([xPosMatrix(1), yPosMatrix(7),0]);
Scenario1.MovewQueen2(Scenario1.wQueen2.getpos);
RMRC(UR5bot,UR5jd,steps);

RMRC(i5bot,q5,steps);
RMRC(i5bot,q6,steps);
Scenario1.bKing.base = transl([xPosMatrix(3), yPosMatrix(8),0]);
Scenario1.MovebKing(Scenario1.bKing.getpos);
RMRC(i5bot,i5jd,steps);

    %% Move 4
q1 = UR5bot.model.getpos;
T1 = transl([xPosMatrix(2), yPosMatrix(6), ChessHeight])*trotx(pi)*trotz(pi);

q2 = UR5bot.model.ikcon(T1);
T2 = transl([xPosMatrix(2), yPosMatrix(8), ChessHeight])*trotx(pi)*trotz(pi);

q3 = UR5bot.model.ikcon(T2);

RMRC(UR5bot,q2,steps);
RMRC(UR5bot,q3,steps);
Scenario1.wQueen1.base = transl([xPosMatrix(2), yPosMatrix(8),0]);
Scenario1.MovewQueen1(Scenario1.wQueen1.getpos);
RMRC(UR5bot,UR5jd,steps);

display('Checkmate! White Wins')