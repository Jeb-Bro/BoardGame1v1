clc
clf
clear all

%%setup
scale1 = 0.3;
scale2 = 0.5;
workspace = [-1.5 1.5 -1.5 1.5 -0.65 1.5];

%% UR5 DH
UR5name = ['UR5'];

LU1 = Link('d',0.0892,'a',0,'alpha',-pi/2,'offset',0,'qlim',[deg2rad(-360),deg2rad(360)]);
LU2 = Link('d',0.1357,'a',0.425,'alpha',-pi,'offset',-pi/2,'qlim',[deg2rad(-90),deg2rad(90)]);
LU3 = Link('d',0.1197,'a',0.39243,'alpha',pi,'offset',0,'qlim',[deg2rad(-170),deg2rad(170)]);
LU4 = Link('d',0.093,'a',0,'alpha',-pi/2,'offset',-pi/2,'qlim',[deg2rad(-360),deg2rad(360)]);
LU5 = Link('d',0.093,'a',0,'alpha',-pi/2,'offset',0,'qlim',[deg2rad(-360),deg2rad(360)]);
LU6 = Link('d',0,'a',0,'alpha',0,'offset',0,'qlim',[deg2rad(-360),deg2rad(360)]);

UR5arm = SerialLink([LU1 LU2 LU3 LU4 LU5 LU6], 'name',UR5name);
qur5 = zeros(1,6);
UR5arm.base = UR5arm.base * transl(0,0.5,0);

%% Reactorx 200 DH
Reactorx200name = ['Reactorx200'];

L1 = Link('d',0.10391,'a',0,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-180),deg2rad(180)]);
L2 = Link('d',0,'a',0.200,'alpha',0,'offset',0,'qlim',[deg2rad(-108),deg2rad(113)]);
L3 = Link('d',0,'a',0.050,'alpha',0,'offset',0,'qlim',[0]);
L4 = Link('d',0,'a',0.200,'alpha',0,'offset',0,'qlim',[deg2rad(-108),deg2rad(93)]);
L5 = Link('d',0,'a',0.065,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-100),deg2rad(123)]);
L6 = Link('d',0,'a',0,'alpha',pi/2,'offset',pi/2,'qlim',[0]);
L7 = Link('d',0.065,'a',0,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-180),deg2rad(180)]);

Reactorx200 = SerialLink([L1 L2 L3 L4 L5 L6 L7], 'name',Reactorx200name);
Reactorx200.base = Reactorx200.base * transl(0,-0.5,0);
qrea = zeros(1,7);

%% plot
UR5arm.plot(qur5, 'scale', scale2,'workspace',workspace)
hold on;
Reactorx200.plot(qrea, 'scale', scale1, 'workspace',workspace)

%% ply files
ChessPieces

