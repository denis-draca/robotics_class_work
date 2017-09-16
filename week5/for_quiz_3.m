%% given ax + by + cz + d = 0
a = 0;
b = 0;
c = 0;

Normal = [a,b,c];

%% given z = f(x,y)

normal = [fx(x0,y0), fy(x0, y0), -1];

%where fx and fy are partial derivatives (df/dx and df,dy)



%% point 1 in point 2 co ordinates frame
point1 = transl(0,0,0) * rpy2tr(0,0,0);
point2 = transl(0,0,0) * rpy2tr(0,0,0);

new_p1 = inv(point2) * point1
%% collision checking
planeNormal = [3,0,0];
pointOnPlane = [3,0,0];

point1OnLine = [4.3301,2.5000,1.0000];
point2OnLine = [1.7321,1,1];

[intersectionPoint,check] = LinePlaneIntersection(planeNormal,pointOnPlane,point1OnLine,point2OnLine)

if check == 1
    point1 = transl(intersectionPoint(1,1), intersectionPoint(1,2), intersectionPoint(1,3));
    point2 = transl(point2OnLine(1,1),point2OnLine(1,2),point2OnLine(1,3));

    new_p1 = inv(point2) * point1;

    norm(new_p1(1:3,4))
end

%% distance from one point to another

point1 = transl(0,0,0) * rpy2tr(0,0,0);
point2 = transl(0,0,0) * rpy2tr(0,0,0);

new_p1 = inv(point2) * point1

norm(new_p1(1:3,4))

%% Point In Puma End Effector Coordinate Frame
mdl_puma560

pose =   [0, 45, 80, 0, 45, 0].*pi/180;
% 
% [-0.2008, -0.1500, 0.9632]
% 		
% [-0.2321, -0.1500, 1.1607]
% 		
% All are invalid
% 		
% [-0.2165, -0.1500, 1.0620]



point1 = transl(-0.2165, -0.1500, 1.0620) 

point2 = p560.fkine(pose);

new_p1 = inv(point2) * point1
norm(new_p1(1:3,4))
%% Puma Distance To Wall Along Z

%...............................
%    REMEMBER TO CHANGE THE NORMAL TO THE PLANE
a = -1;
b = 0;
c = 0;
mdl_puma560

%.............................
%       CHOOSE WHICH LINE TO USE DEPENDING ON THE QUESTION
pose = [-pi/10,0,-pi/2,0,0,0];
%pose = p560.getpos;

%...........................................
%       REMEMBER TO SET THE POINT ON THE PLANE
pointOnPlane = [1.2,0,0];
planeNormal = [a,b,c];


point2 = p560.fkine(pose);

point1 = point2 * transl(0,0,50);

point1OnLine = point1(1:3,4)';
point2OnLine = point2(1:3,4)';

[intersectionPoint,check] = LinePlaneIntersection(planeNormal,pointOnPlane,point1OnLine,point2OnLine)

if check == 1
    point1 = transl(intersectionPoint(1,1), intersectionPoint(1,2), intersectionPoint(1,3));

    new_p1 = inv(point2) * point1;

    norm(new_p1(1:3,4))
end

%% Create 5DOF Planar
L1 = Link('d', 0, 'a', 1, 'alpha', 0, 'qlim', [-pi pi], 'offset', 0);
L2 = Link('d', 0, 'a', 1, 'alpha', 0, 'qlim', [-pi pi], 'offset', 0);
L3 = Link('d', 0, 'a', 1, 'alpha', 0, 'qlim', [-pi pi], 'offset', 0);
L4 = Link('d', 0, 'a', 1, 'alpha', 0, 'qlim', [-pi pi], 'offset', 0);
L5 = Link('d', 0, 'a', 1, 'alpha', 0, 'qlim', [-pi pi], 'offset', 0);

L = [L1 L2 L3 L4 L5];


robot = SerialLink(L, 'name', 'bot');

q0 = [60,-60,60,-60,0].*pi/180;
robot.plot(q0);

%% move 5DOF planar to point

xPoint = -0.75;
yPoint = -0.5; 
mask = [1,1,0,0,0,0];
q1 = robot.ikine(transl(xPoint, yPoint, 0), robot.getpos, mask);

robot.plot(q1);

%% puma Ikine
mdl_puma560;

steps = 30;

point1 = transl(0.1,0,0.5);
point2 = transl(0,0.5,0.1);

q1 = p560.ikine(point1);
q2 = p560.ikine(point2);

%% jtraj
p560.plot(q1);
jListOfAngles = jtraj(q1,q2,steps);
p560.plot(jListOfAngles, 'trail', 'r-');

%% Trap
p560.plot(q1);
s = lspb(0,1, steps);
matrix = nan(steps,6);

for i = 1:steps
    matrix(i,:) = (1-s(i)) * q1 + s(i)*q2;
end

p560.plot(matrix, 'trail', 'r-');

%% create plane
xlim([-2,2]);
ylim([-2,2]);
zlim([-2,2]);
hold on;
x = -10:0.1:10;
[Z,Y] = meshgrid(x);

d = -1.5;
a = 1;
b = 0;
c = 0;

% Z = (d - a*X - b*Y)/c;
X = 0*Y + 0 * Z + 1.5;

surf(X,Y,Z);


