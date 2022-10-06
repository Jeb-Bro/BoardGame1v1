classdef Gripper < handle
    %UR3 Compatible Three Finger Gripper
    %Creates and has functions for the three gripper fingers
    %Based on Robot Cows and UR3
    
    properties (Constant)
        %> Number of Gripper Fingers
        FingerCount = 3;
    end
    
    properties
        
        %> workspace
         workspace = [-4 4 -4 4 -4 4];
         
        %Scale
%         scale = 0.19;
        
        %> A cell structure of \c FingerCount Finger models
        Finger;
        
        %Location of Gripper End Effector
        GripperEndEffector = [0 0 0 deg2rad(0) deg2rad(0) deg2rad(0)]; %XYZRPY, meters & radians
        
    end
    
    methods %% Class for UR3 robot simulation
        function self = Gripper(GripperEndEffector) %Gripper([1 2 3 4 5 6])
            if nargin < 1
                self.GripperEndEffector = zeros(1,6);
                disp('Warning! No End Effector Location Set');
                disp('Location set to Origin');
            end
            
            hold on;
            % Create the required number of fingers
            for i = 1:1:self.FingerCount
                %Load D-H Parameters
                self.Finger{i} = self.GetFingerModel(['Finger_',num2str(i)]); 
                                
                %Set Known Spawn Locations for the three fingerso
                %Rotate if needed
                if i == 1 %Double Finger Side
                    self.Finger{i}.base = se3(se2(0,0.05,2));               
%                     self.model.base = self.model.base * trotx(GripperEndEffector(4)) * troty(GripperEndEffector(5))* trotz(GripperEndEffector(6));
                end
                if i == 2 %Middle Finger/Single Finger side
                    self.Finger{i}.base = se3(se2(0,0,2));               
%                     self.model.base = self.model.base * trotx(GripperEndEffector(4)) * troty(GripperEndEffector(5))* trotz(GripperEndEffector(6));
                end
                if i == 3 %Double Finger Side
                    self.Finger{i}.base = se3(se2(0,-0.05,2));               
%                     self.model.base = self.model.base * trotx(GripperEndEffector(4)) * troty(GripperEndEffector(5))* trotz(GripperEndEffector(6));

                end
                display(num2str(i), 'Base of Finger No');
                display(num2str(self.Finger{i}.base(1:3,4)));
                
                %Plot 3D Model
                 q = zeros(1,3);
                 plot3d(self.Finger{i},q);
                
            end
             
%             drawnow %Updates all figures
            axis equal
            camlight;
        end
    end
    
    methods (Static)
         %% GetGripperFinger
        function model = GetFingerModel(name) 
            if nargin < 1
                name = 'BrokenFinger';
            end
            L1 = Link('d',0,'a',0.055,'alpha',0,'qlim',[deg2rad(-11.1474) deg2rad(50)], 'offset',0);
            L2 = Link('d',0,'a',0.040,'alpha',0,'qlim',[0 deg2rad(70)], 'offset',0);
            L3 = Link('d',0,'a',0.035,'alpha',0,'qlim',[deg2rad(11.1474) deg2rad(140), 'offset',0]);
            
            model = SerialLink([L1 L2 L3],'name',name);

%             for linkIndex = model.n
%                  [ faceData, vertexData, plyData{linkIndex + 1} ] = plyread(['LinUR3Link_',num2str(linkIndex),'.ply'],'tri'); %I need better .ply files              
%                  model.faces{linkIndex + 1} = faceData;
%                  model.points{linkIndex + 1} = vertexData;
%             end
        end
    end
end
