function JointLim = JointCheck(robot,q)
    jointlim = robot.qlim;
    
    for x = 1:robot.n
        JointLim  = x;
        if q(x) < jointlim(x,1) || jointlim(x,2) < q(x)
            return
        end
    end

    JointLim = x+1;
end