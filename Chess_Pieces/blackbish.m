% black bishop plot and moved by gripper - https://au.mathworks.com/matlabcentral/fileexchange/58774-putting-simulated-objects-into-the-environment
classdef blackbish < handle
    properties
        fileName
        pose
        vertexCount
        pieceverts
        Piecemesh_h
        model
        colour
        % Robot plot options
        plotopts = {'fps',60,'noarrow'};
    end
    %%
    methods
        
        %% place the object at pos = [x y] position and specify the color [r g b]
        function self = blackbish(fileName,pose,colour)
            % get the ply file's name
            self.fileName = fileName;
            
            if (nargin == 1)
                % pose of piece 
                self.pose = transl(-0.0562,-0.1313,0); 
                % black colour
                self.colour = [0,0,0]/255; 

            else
                self.pose = pose;
                self.colour = colour;
            end
            
            self.PlotBish();

        end

        %% update the current position of the object. by pos = [x y]
        function UpdateBish(self, a) % T is an input object.Pose
            self.pose = a;
            updatedPoints = (a * [self.pieceverts,ones(self.vertexCount,1)]')';
            self.Piecemesh_h.Vertices = updatedPoints(:,1:3);
            drawnow()
        end

        %% read the ply file and plot the model
        function PlotBish(self)

            [f,v,data] = plyread(self.fileName,'tri');

            % Get vertex count
            self.vertexCount = size(v,1);

            % Move center point to origin
            self.pieceverts = v;

            % Scale the colours to be 0-to-1 (they are originally 0-to-255)
            vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;

            updatedPoints = (self.pose * [self.pieceverts,ones(self.vertexCount,1)]')';

            self.Piecemesh_h = trisurf(f,updatedPoints(:,1),updatedPoints(:,2), updatedPoints(:,3) ...
                ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
            
        end


    end
end