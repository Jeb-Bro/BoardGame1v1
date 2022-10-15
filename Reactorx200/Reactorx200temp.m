classdef Reactorx200temp < handle
    properties
        model
        name = 'Reactorx200'
        workspace = [-1 2 -2 2 -1 2];

        % Robot plot options
        plotopts = {'fps',60,'noarrow'};
                
        %default joint settings
%         jointDef = [0 0 0 0 0 0]*pi/180;
    end

    methods
        %% Define Robot Function
        function self = Reactorx200temp(option)
            self.CreateModel();
%             self.model.animate(self.jointDef)
        end

        %% DH Parameters
        function CreateModel(self)
            L(1) = Link('d',0.10391,'a',0,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-180),deg2rad(180)]);
            L(2) = Link('d',0,'a',0.200,'alpha',0,'offset',0,'qlim',[deg2rad(-108),deg2rad(113)]);
            L(3) = Link('d',0,'a',0.050,'alpha',0,'offset',0,'qlim',[-pi/2]);
            L(4) = Link('d',0,'a',0.200,'alpha',0,'offset',0,'qlim',[deg2rad(-108),deg2rad(93)]);
            L(5) = Link('d',0,'a',0.065,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-100),deg2rad(123)]);
            L(6) = Link('d',0,'a',0,'alpha',pi/2,'offset',pi/2,'qlim',[0]);   %rotate the joint for end-effector
            L(7) = Link('d',0.065,'a',0,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-180),deg2rad(180)]);
            
            self.model = SerialLink(L,'name',self.name);
        end

        %% Move robot function
        function MoveRobot(self,qTrajectory)
            for i=1:numrows(qTrajectory)
                self.model.animate(qTrajectory(i,:));
                drawnow();
            end
        end

    end
end