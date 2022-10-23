for z=1
    %% Move 1
    x=0;
    %White Move
    wQueen1CurrentPose = transl([xPosMatrix(2), yPosMatrix(2), ChessHeight]);
    wQueen1EndPose = transl([xPosMatrix(2), yPosMatrix(4),ChessHeight]);

    q1 = UR5bot.model.ikcon(wQueen1CurrentPose*trotx(pi)*trotz(pi));

    q2 = UR5bot.model.ikcon(wQueen1EndPose*trotx(pi)*trotz(pi));

    if x == 1
        z=0;
    end
    
    RMRC(UR5bot,q1,steps);
    if x == 1
        z=0;
    end
    RMRC(UR5bot,q2,steps);
    Scenario1.wQueen1.base = transl([xPosMatrix(2), yPosMatrix(4),0]);
    Scenario1.MovewQueen1(Scenario1.wQueen1.getpos);
    collisionDect; %Collision Detect break
    if x == 1
        z=0;
    end
    RMRC(UR5bot,UR5jd,steps);
    if x == 1
        z=0;
    end

    % Black Move 
    bKingCurrentPose = transl([xPosMatrix(5), yPosMatrix(4), ChessHeight]);
    bKingEndPose = transl([xPosMatrix(4), yPosMatrix(5),ChessHeight]);

    q1 = i5bot.model.ikcon(bKingCurrentPose*trotx(pi)*trotz(pi));
    q2 = i5bot.model.ikcon(bKingEndPose*trotx(pi)*trotz(pi));

    RMRC(i5bot,q1,steps);
    if x == 1
        z=0;
    end

    RMRC(i5bot,q2,steps);
    Scenario1.bKing.base = transl([xPosMatrix(4), yPosMatrix(5),0]);
    Scenario1.MovebKing(Scenario1.bKing.getpos);
    if x == 1
        z=0;
    end

    RMRC(i5bot,i5jd,steps);
    if x == 1
        z=0;
    end
end
