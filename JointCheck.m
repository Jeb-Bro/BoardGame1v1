function JointLim = JointCheck(robot,qlim)
    jointlim = robot.qlim;
    
    for q = 1:robot.n
        JointLim  = q;
        if  jointlim(q,1) > qlim(q) || jointlim(q,2) < qlim(q)
            return
        end
    end

    JointLim = q+1;
end