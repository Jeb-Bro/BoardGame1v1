    %% RMRC function for chess 1v1
    
    
function RMRC(robot,poseFinal,steps)
    % robot
    % poseFinal: desired final pose
    % steps

    timestep = 0.05; % Discrete time step
     
    % current pose + pose to go to
    currentpos = robot.model.fkine(robot.model.getpos);
    Gotopose = robot.model.fkine(poseFinal);
    
    T = trinterp(currentpos,Gotopose,linspace(0,1,steps)); %interpolate waypoints
    

    % track the trajectory by RRMC
    for i = 1:steps-1
        qCurrent = robot.model.getpos;
        currentPose = robot.model.fkine(qCurrent);

        % Calculate velocity at discrete time step
        u = (transl(T(:,:,i+1)) - transl(T(:,:,i)))/timestep;
        omega = (tr2rpy(T(:,:,i+1)) - tr2rpy(T(:,:,i)))/timestep;

        % Solve velocitities via RMRC
        qdot = pinv(robot.model.jacob0(qCurrent)) * [u; omega'];

        % next position
        qNext = qCurrent + qdot'*timestep;
        
        % check the validity of the next joint state:
        checkLimit = JointCheck(robot.model,qNext);
        if  checkLimit <= robot.model.n
            poseNext = robot.model.fkine(qNext);
            qNext = robot.model.ikcon(poseNext,robot.model.getpos);% replace the invalid 'qNext' by an IK solution
        end

        % move to final pose
        if i == steps - 1
            currentPose = robot.model.fkine(robot.model.getpos);
            % error between final pose & current pose
            error_disp = norm(Gotopose(1:3,4) - currentPose(1:3,4));

            % if error>10mm, correct position
            if error_disp > 0.01
                qCorrect = jtraj(robot.model.getpos,poseFinal,steps);
                robot.MoveRobot(qCorrect);
            end

            % write final error in cmd window
            currentPose = robot.model.fkine(robot.model.getpos);
            error_disp = norm(Gotopose(1:3,4) - currentPose(1:3,4));
            disp(['Current error is ',num2str(1000* error_disp),'mm.']);
        end
    end
end