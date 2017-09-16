point1 = [2 -1 3];
point2 = [1 4 -3];

vec = point1 - point2;

t = zeros(1, 100);

for i = 1:100
    t(1,i) =  i;
end

x = point1(1,1) + vec(1,1).*t;
y = point1(1,2) + vec(1,2).*t;
z = point1(1,3) + vec(1,3).*t;

% plot3(x,y,z,'*');
% hold on;
% 
% plot3(2,-1,3, '*');
% plot3(1,4,-3, '*');

x_given = 3;

constant = (x_given - point1(1,1))./vec(1,1);

Y = (constant * vec(1,2)) + point1(1,2)
Z = (constant * vec(1,3)) + point1(1,3)

%% given surface of z = (3/2)*(x^2 + y^2) find intersect along z axis

clear;

endefector_pose = transl(1, 6, 150) * trotx(pi/2); %based on fkine(robot.getpos)
point2 = endefector_pose * transl(0,0,20); %point translated 20 along the z axis

trplot(endefector_pose, 'frame', '1', 'color', 'b', 'length' ,1);
trplot(point2, 'frame', '1', 'color', 'b', 'length' ,1);

%extracting the points themselves (rotation unimportant here)
endef_point = endefector_pose(1:3, 4).';
p2 = point2(1:3, 4).';

plot(endef_point, '.');
plot(p2, '.');
%define parallel vector
vec = endef_point - p2;

t = meshgrid(-1:0.1:1);

x = endef_point(1,1) + vec(1,1).*t;
y = endef_point(1,2) + vec(1,2).*t;
z = endef_point(1,3) + vec(1,3).*t;

%plot3(x,y,z, '*');

xlabel('X');
ylabel('Y');
zlabel('Z');

hold on;

[X,Y] = meshgrid(-10:0.1:10, -10:0.1:10);
Z = (3/2)*(X.^2 + Y.^2);

surface(X,Y,Z);


%solving for contact points (solving for t)
syms var;

try
    %below is z = (3/2)*(x^2 + y^2) but x,y and z has been replaced by the t
    %equivalant
    eq = (3/2)*((endef_point(1,1) + vec(1,1)*var).^2 + (endef_point(1,2) + vec(1,2)*var).^2) == endef_point(1,3) + vec(1,3)*var;
    solved = solve(eq, var);
    solved = vpa(solved).';

    for t_value = solved
        x_temp = endef_point(1,1) + vec(1,1)*t_value;
        y_temp = endef_point(1,2) + vec(1,2)*t_value;
        z_temp = endef_point(1,3) + vec(1,3)*t_value;

        plot3(x_temp, y_temp, z_temp, '*');
        
        new_pose = transl(x_temp, y_temp, z_temp);
        
        inv(endefector_pose)*new_pose
        
        %distance between two points
        sqrt((x_temp - endef_point(1,1)).^2 + (y_temp - endef_point(1,2)).^2 + (z_temp - endef_point(1,3)).^2)
        
    end

catch
    disp('no solution');
end



%% 

 sqrt((-0.3657 ).^2 + (1.4542).^2 + (0.1910).^2)


