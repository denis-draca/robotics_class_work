robot = SchunkUTSv2_0;
robot.base = robot.base * transl(-0.4,0,0);

pose = [1 0 0 0 0 0 ];

robot.teach
% robot.animate(pose);
% 
hold on;
triangleSurfacePlot(point1, point2, point3);

environment{1}.point1 = point1;
environment{1}.point2 = point2;
environment{1}.point3 = point3;


end_transform = transl(0.3, 0.5, 0.5);

qList = jtraj(robot.getpos,robot.ikine(end_transform), 50);
xPoints = zeros(1, length(qList));
yPoints = zeros(1, length(qList));
zPoints = zeros(1, length(qList));

for i = 1:length(qList)
   
    [check, point] = checkCollisionLinear(robot, qList(i,:), environment);
    
    robot.animate(qList(i,:));
    
    if (check)
       
        xPoints(1,i) = point(1,1);
        yPoints(1,i) = point(1,2);
        zPoints(1,i) = point(1,3);
        
    end
    
    plot3(xPoints,yPoints,zPoints, '.', 'color','r');
    
    pause(0.1);
    drawnow();
    
end

