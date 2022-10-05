clc
clf
clear all

%% UR5 DH
L1 = Link('d',0.0892,'a',0,'alpha',-pi/2,'offset',0,'qlim',[deg2rad(-360),deg2rad(360)]);
L2 = Link('d',0.1357,'a',0.425,'alpha',-pi,'offset',-pi/2,'qlim',[deg2rad(-90),deg2rad(90)]);
L3 = Link('d',0.1197,'a',0.39243,'alpha',pi,'offset',0,'qlim',[deg2rad(-170),deg2rad(170)]);
L4 = Link('d',0.093,'a',0,'alpha',-pi/2,'offset',-pi/2,'qlim',[deg2rad(-360),deg2rad(360)]);
L5 = Link('d',0.093,'a',0,'alpha',-pi/2,'offset',0,'qlim',[deg2rad(-360),deg2rad(360)]);
L6 = Link('d',0,'a',0,'alpha',0,'offset',0,'qlim',[deg2rad(-360),deg2rad(360)]);

UR5arm = SerialLink([L1 L2 L3 L4 L5 L6]);
q = zeros(1,6);
UR5arm.plot(q)

%% Reactorx 200 DH
clf

L1 = Link('d',0.10391,'a',0,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-180),deg2rad(180)]);
L2 = Link('d',0,'a',0.200,'alpha',0,'offset',0,'qlim',[deg2rad(-108),deg2rad(113)]);
L3 = Link('d',0,'a',0.050,'alpha',0,'offset',0,'qlim',[0]);
L4 = Link('d',0,'a',0.200,'alpha',0,'offset',0,'qlim',[deg2rad(-108),deg2rad(93)]);
L5 = Link('d',0,'a',0.065,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-100),deg2rad(123)]);
L6 = Link('d',0,'a',0,'alpha',pi/2,'offset',pi/2,'qlim',[0]);
L7 = Link('d',0.065,'a',0,'alpha',pi/2,'offset',0,'qlim',[deg2rad(-180),deg2rad(180)]);

scale = 0.6;
Reactorx200 = SerialLink([L1 L2 L3 L4 L5 L6 L7]);
q = zeros(1,7);
Reactorx200.plot(q, 'scale', scale)
Reactorx200.teach


