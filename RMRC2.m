    %% RMRC function for chess 1v1
    
function RMRC2(robot,endPose,steps)
    % default poses of the two robot
    pose_Default= robot.model.fkine(robot.model.getpos);

    % desired joint state for the dobot at the upper picking position
    qPick = endPose;

    % required initial and final pose
    poseCurrent = robot.model.fkine(robot.model.getpos);
    poseFinal = robot.model.fkine(qPick);

    pointCurrent = poseCurrent(1:3,4);
    pointFinal = poseFinal(1:3,4);
    error_displacement = norm(pointFinal(1:3,4) - pointCurrent(1:3,4));

    % safe step of time for not exceed each joint's max speed
    timestep = 0.05;

    % manipulability threshold
    mani_threshold = 0.0044;

    % max damping coefficient 
    damping_coefficient_MAX = 0.05;


    % random collision trigger:
    %checkCollision = randi([1,steps+10],1,1);
    checkCollision = 60;

    count = 0;
    pause();

    %% Dobot tracks the trajectory by RRMC to reach the veggie
    % the closer the obstacle to the target, the less accurate of the
    % avoidance

    while error_displacement > 0.003

        % current joint state 
        qCurrent = robot.model.getpos;

        % current manipulability and Jacobian
        mani =  robot.model.maniplty(qCurrent);
        J = robot1.mode.jacob0(qCurrent);

        % retrieve the current pose
        poseCurrent = robot.model.fkine(qCurrent);

        % current difference to the final position
        distanceDiff = transl(poseFinal) - transl(poseCurrent);
        angleDiff = tr2rpy(poseFinal) - tr2rpy(poseCurrent);

        % desired spatial velocity
        u = (distanceDiff/(steps-count))/timestep;
        omega = (angleDiff/(steps-count))/timestep;

        % reduce singularity if exists
        if mani < mani_threshold
            damping_coefficient = (1-(mani/manithreshold)^2)/damping_coefficient_MAX;
            J_DLS = J'/(J*J'+ damping_coefficient*eye(6));    % damped least square Jacobian

            % joint velocity
            qd = J_DLS * [u; omega'];
        else
            % joint velocity
            qd = pinv(J) * [u; omega'];
        end

        % next position
        qNext = qCurrent + qd'*timestep;

        % check the validity of 'qNext':
        checkLimit = CheckJointLimit(robot.model,qNext);
        if  checkLimit <= robot.model.n
            disp(['Step ',num2str(count),'. Warning: exceed joint limit at joint ', num2str(checkLimit), ...
                '. A patch using IK solution is applied!']);

            % replace the invalid 'qNext' by an IK solution:
            poseNext = robot.model.fkine(qNext);
            qNext = robot.model.ikcon(poseNext,robot.model.getpos);
        end

        % move robot
        robot.MoveRobot(qNext);

        % retrieve the current pose
        poseCurrent = robot1.model.fkine(robot1.model.getpos);
        pointCurrent = poseCurrent(1:3,4);
        error_displacement = norm(pointFinal(1:3,4) - pointCurrent(1:3,4));

        count = count+1;
    end
end