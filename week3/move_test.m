%% Puma 560 DH Model
% 41013 Robotics
% Jonathan Woolfrey
% August 2016

% Link('theta',__,'d',__,'a',__,'alpha',__,'offset',__,'qlim',[ ... ])

L1 = Link('d',0,'a',0,'alpha',pi/2,'offset',0)

L2 = Link('d',0,'a',0.4318,'alpha',0,'offset',0)

L3 = Link('d',0.15,'a',0.0203,'alpha',-pi/2,'offset',0)

L4 = Link('d',0.4318,'a',0,'alpha',pi/2,'offset',0)

L5 = Link('d',0,'a',0,'alpha',-pi/2,'offset',0)

L6 = Link('d',0,'a',0,'alpha',0,'offset',0)

myRobot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'Puma560')

q = zeros(1,6);

figure(1);

[Y,Z] = meshgrid(-2:0.1:2,-2:0.1:2);
X = repmat(1.5,size(Y,1),size(Y,2));
surf(X,Y,Z);

hold on;

myRobot.plot(q)



%myRobot.animate(myRobot.ikine(myRobot.fkine(myRobot.getpos)* trotx(-30*pi/180)))

pause(1);

end_transform = myRobot.fkine(myRobot.getpos);
move_transform = end_transform * transl(0,0,-0.5) * trotx(pi/2);


steps = 30;

angles_new = myRobot.jtraj(end_transform, move_transform, steps);

for pos_new = 1:length(angles_new)
    myRobot.animate(angles_new(pos_new, 1:6));
    pause(0.01);
end

grit_shots = 20;
x = zeros(1,grit_shots);
y = zeros(1,grit_shots);
z = zeros(1,grit_shots);


for i = 1:grit_shots
    pos = myRobot.fkine(myRobot.getpos);

    new_point = transl(1.5 - pos(1,4), 0, 0) * pos;

    length = sqrt((new_point(1,4) - pos(1,4)).^2 + (new_point(2,4) - pos(2,4)).^2 + (new_point(3,4) - pos(3,4)).^2);

    tranimate(pos, pos*transl(0,0,length), 'nsteps', 5, 'length' , 0.1);

end
