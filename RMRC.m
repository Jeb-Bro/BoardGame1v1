%% RMRC function for chess 1v1
 
function RMRC(robot,endPose,steps)
    % robot
    % poseFinal: desired final pose
    % steps
    timestep = 0.05; % Discrete timestep
    
    % current pose + pose to go to
    currentpos = robot.model.fkine(robot.model.getpos);
    gotopose = robot.model.fkine(endPose);
    
    T = trinterp(currentpos,gotopose,linspace(0,1,steps)); %interpolate waypoints

    % USing RMRC to track trajectory 
    for i = 1:steps-1
        q_Current = robot.model.getpos;
       
        % Calculate velocity at discrete time step
        u = (transl(T(:,:,i+1)) - transl(T(:,:,i)))/timestep;
        omega = (tr2rpy(T(:,:,i+1)) - tr2rpy(T(:,:,i)))/timestep;

        % Solve joint velocitities via RMRC
        qdot = pinv(robot.model.jacob0(q_Current)) * [u; omega'];

        % next position
        qNext = q_Current + qdot'*timestep;
        
        % chck if the joint-states in next pose exceed its qlims
        checkLimit = JointCheck(robot.model,qNext);
        if  checkLimit <= robot.model.n
            nextpose = robot.model.fkine(qNext); % fkine for next state
            qNext = robot.model.ikcon(nextpose,robot.model.getpos);
        end
        
        qdot = (qNext - q_Current)/timestep;
        
        % move to final pose
        if i == steps - 1
            currentPose = robot.model.fkine(robot.model.getpos);
            % error between end pose & current pose
            error_disp = norm(gotopose(1:3,4) - currentPose(1:3,4));

            % if error>10mm, correct position then move it 
            if error_disp > 0.010
                qCorrect = jtraj(robot.model.getpos,endPose,steps);
                robot.MoveRobot(qCorrect);          
            end
        end
    end
end