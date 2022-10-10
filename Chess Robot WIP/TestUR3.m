classdef TestUR3 < handle


    
workspace = [-2 2 -2 2 -0.3 2];

name = ['LinearUR_3_',datestr(now,'yyyymmddTHHMMSSFFF')];

% Create the UR3 model mounted on a linear rail
    L(1) = Link([pi     0           0               pi/2        1]); % PRISMATIC Link
    L(2) = Link([0      0.1519      0               pi/2        0]);
    L(3) = Link([0      0           -0.24365        0           0]);
    L(4) = Link([0      0           -0.21325        0           0]);
    L(5) = Link([0      0.11235     0               pi/2        0]);
    L(6) = Link([0      0.08535     0               -pi/2       0]);
    L(7) = Link([0      0.0819      0               0           0]);
    
    % Incorporate joint limits
    L(1).qlim = [-0.8 0];
    L(2).qlim = [-360 360]*pi/180;
    L(3).qlim = [-360 360]*pi/180;
    L(4).qlim = [-360 360]*pi/180;
    L(5).qlim = [-360 360]*pi/180;
    L(6).qlim = [-360 360]*pi/180;
    L(7).qlim = [-360 360]*pi/180;
    
    self.model = SerialLink(L,'name',name);
    
    % Rotate robot to the correct orientation
    self.model.base = self.model.base * trotx(pi/2) * troty(pi/2);
    
    
    for linkIndex = 0:self.model.n
        if self.useGripper && linkIndex == self.model.n
            [ faceData, vertexData, plyData{linkIndex+1} ] = plyread(['LinUR3Link',num2str(linkIndex),'Gripper.ply'],'tri'); %#ok<AGROW>
        else
            [ faceData, vertexData, plyData{linkIndex+1} ] = plyread(['LinUR3Link',num2str(linkIndex),'.ply'],'tri'); %#ok<AGROW>
        end
        self.model.faces{linkIndex+1} = faceData;
        self.model.points{linkIndex+1} = vertexData;
    end

    % Display robot
    self.model.plot3d(zeros(1,self.model.n),'noarrow','workspace',self.workspace);
    self.model.teach();
    if isempty(findobj(get(gca,'Children'),'Type','Light'))
        camlight
    end  
    self.model.delay = 0;

    % Try to correctly colour the arm (if colours are in ply file data)
    for linkIndex = 0:self.model.n
        handles = findobj('Tag', self.model.name);
        h = get(handles,'UserData');
        try 
            h.link(linkIndex+1).Children.FaceVertexCData = [plyData{linkIndex+1}.vertex.red ...
                                                          , plyData{linkIndex+1}.vertex.green ...
                                                          , plyData{linkIndex+1}.vertex.blue]/255;
            h.link(linkIndex+1).Children.FaceColor = 'interp';
        catch ME_1
            disp(ME_1);
            continue;
        end
    end