%%


%% Sample Point Cloud

hold on;
qlim = robot.model.qlim;

% stepRads = deg2rad(60);
stepRads = 60*pi/180;

pointCloudSize = prod(floor((qlim(1:6,1))/stepRads + 1));
pointCloud = zeros(pointCloudSize,3);
counter = 1;
tic
for q1 = qlim(1,1):0.1:qlim(1,2)
    for q2 = qlim(2,1):stepRads:qlim(2,2)
        for q3 = qlim(3,1):stepRads:qlim(3,2)
            for q4 = qlim(4,1):stepRads:qlim(4,2)
                for q5 = qlim(5,1):stepRads:qlim(5,2)
                    for q6 = qlim(6,1):stepRads:qlim(6,2)
                        q7 = 0;
                        q = [q1,q2,q3,q4,q5,q6,q7];
                        tr = robot.model.fkine(q);
                        pointCloud(counter,:) = tr(1:3,4);
                        counter = counter + 1;
                    end
                end
            end
        end
    end
end

plot3(pointCloud(:,1),pointCloud(:,2),pointCloud(:,3),'r.');




%%Calculate Max Reach
Min_x = min(pointCloud(:,1)) - robot.model.base(1,4);
Max_x = max(pointCloud(:,1)) - robot.model.base(1,4);
Min_y = min(pointCloud(:,2)) - robot.model.base(2,4);
Max_y = max(pointCloud(:,2)) - robot.model.base(2,4);
Min_z = min(pointCloud(:,3)) - robot.model.base(3,4);
Max_z = max(pointCloud(:,3)) - robot.model.base(3,4);

reach_x = max(Max_x, abs(Min_x));
reach_y = max(Max_y, abs(Min_y));
reach_z = max(Max_z, abs(Min_z));
horizontal = max(reach_x, reach_y);

%calculate cylinder
Volume = 4/3*pi*horizontal^2*reach_z;
disp('Workspace Volume');
disp(volumebounds);
disp('Max horizontal reach:');
disp(horizontal);

disp('Max Vertical reach:');
disp(reach_z);

input('Press enter to continue')



%% Simulate the Environment
clear all
close all
clc


set(0, 'DefualtFigureWindowStyle', 'docked');

o = [0,0,0];
base = [0,0,1.5] + o;

% placeEnvi(o);
% 
% d = surf([-2.5 + o(1,1), -2.5 + o(1,1) ; 3+o(1,1) , 3+o(1,1)], [-2 + o(1,2), 2 + o(1,2) ; ...
%     -2 + o(1,2) , 2 + o(1,2)], [0.01 + o(1,3), 0.01 + o(1,3) ; 0.01 + o(1,3), 0.01 + o(1,3)], 'CData', imread('concrete floor');

c = 1;

brickpose{1} = [0, 0.3, base(1,3) + 0.01];
brickpose{2} = [-0.15, 0.4, base(1,3) + 0.01]; 
brickpose{3} = [-0.15, 0.5, base(1,3) + 0.01];
brickpose{4} = [-0.3, 0.3, base(1,3) + 0.01];
brickpose{5} = [-0.3, 0.4, base(1,3) + 0.01];
brickpose{6} = [-0.3, 0.5, base(1,3) + 0.01];
brickpose{7} = [-0.45, 0.3, base(1,3) + 0.01];
brickpose{8} = [-0.45, 0.4, base(1,3) + 0.01];
brickpose{9} = [-0.45, 0.5, base(1,3) + 0.01];

for bpose = 1:1:9
    if j == -0.4 && i == 5
    else
        [f,v,data] = plyread('HalfSizedRedGreenBrick.ply', 'tri');
        brickVertexCount = size(v,1);
        midpoint = sum(v) / brickVertexCount;
        brickVerts = v - repmat(midPoint,brickVertexCount, 1);
        brickPose{c} = eye(4)*transl(brickpose{bpose}) * trotz(pi/2);
        vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
        brickMesh_h{c} = trisurf(f, brickVerts(:,1), brickVerts(:,2), brickVerts(:,3) ...
            ,'FaceVertexCData', vertexColours, 'EdgeColor', 'interp', 'EdgeLighting', 'flat');
        updatedPoints = [brickPose{c} * [brickVerts, ones(brickVertexCount, 1)]']';
        brickMesh_h{c}.Vertices = updatedPoints(:,1:3);
        c = c+1;
    end

end



% 
% 
% 
% 
%% Loading UR3

function PlotColourRobot(Robot, origin)
hold on;
workspace = [-2 2 -2 2 0 4];
for linkIndex = 0:robot.model.n
    [faceData, vertexData, plyData{linkIndex + 1}] = plyread(['ur3link', num2str(linkIndex), '.ply']);
    robot.model.faces{linkIndex + 1} = faceData;
    robot.model.points{linkIndex + 1} = vertexData;
end

q = [0 0 0 0 0 0 0];

% Display robot.model
robot.model.plot3d(q, 'narrow', 'workspace', workspace, 'view', ([-120, 50]));
if isempty(findobj(get(gca,'children'),'Type','Light'))
    camlight
end
robot.model.delay = 0;

% colour correctly arms
for linkIndex = 0:robot.model.n
    handles = findobj('tag', robot.model.name);
    h = get(handles,'UserData');
    try
        h.link(linkIndex + 1).Children.FaceVertexCData = [plyData{linkIndex + 1}.vertex.red ...
            , plyData{linkIndex + 1}.vertex.green ...
            , plyData{linkIndex + 1}.vertex.blue]/255;
        h.link(linkIndex + 1).Children.FaceColor = 'interp';
    catch ME_1
        disp(ME_1);
        continue;
    end
end

end


%% Setup Environment

%%



%% Move To Brick


q = [0 0 0 0 0 0 0]

workspace = [-2 2 -2 2 0 2];
hold on;
pos = robot.model.fkine(q);
steps = 15;

    by = 0;
    bz = 0;

for b = 1:1:9
    posB= brickPose{b};

    T1 = transl(pos(1:3,4));
    q1 = robot.model.ikcon(T1);
    T2 = transl(posB(1,4), posB(2,4), posB(3,4) + 0.1);
    q2 = robot.model.ikcon(T2);

    qMatrix = jtraj(q1, q2, steps);

    robot.model.plot3d(qMatrix, 'workspace', workspace, 'view', ([-120, 50]))

    newQ = q2;

    for l = 1:1:5
        posB = brickPose{b};
        tr = makehgtform('translate', [0, 0, 0.25/steps]);
        brickPose{b} = brickPose{b} * tr;
        updatedPoints = [brickPose{b} * [brickVerts,ones(brickVertexCount, 1)]']';
        brickMesh_h{b}.Vertices = updatedPoints(:,1:3);
        posB = brickPose{b};
        newQ = robot.model.ikcon(transl(posB(1,4), posB(2,4), posB(3,4) + 0.1), newQ);
        robot.model.animate(newQ);
        drawnow()
    end


    posB = brickPose{b};
    x = (-0.35 - posB(2,4))
    y = -(-0.4posB(1,4)-0.135 * by)/steps;
    z = (1.5 - posB(3,4) + bz * 0.4)/steps;
    for 1 = 1:1:steps
        tr = makehgtform('translate', [x, y, z]);
        brickPose{b} = brickPose{b} * tr;
        updatedPoints = [brickPose{b} * [bric kVerts, ones(brickVertexCount,1)]']';
        brickMesh_h{b}.Vertices = updatedPoints(:,1:3);
        posB = brickPose{b};
        newQ = robot.model.ikcon(transl(posB(1,4), posB(2,4), posB(3,4) + 0.1), newQ);
        robot.model.animate(newQ);
        drawnow()
    end
    by = by + 1;



    if (~rem(b,3) * b/3) > 0
        by = 0;
        bz = bz+1;
    end
    pos = robot.model.fkine(newQ);

end


%% Setup Environment

% function placeEnvi(origin)
% hold on:
% PlaceObject('fireextinguisher.ply', [-2, 0, 0.05] + origin);
% end