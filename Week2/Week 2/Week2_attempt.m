
%% 
axis on;
hold on;

set(gca,'View',[-45 30])
%{
xlim([0,15]);
ylim([0,15]);
zlim([0,15]);

xlabel('x-axis');
%}

uav = transl(0,0,0);
up_one_unit = transl(0,0,1);

uav_plot = trplot(uav, 'frame', '1', 'color', 'b', 'length' ,1);

% 1 go up 10 units


% 2 rotate -10 degrees
x_rot_one_unit = trotx(-1*pi/180);

% 3 move global y (not relative y)

y_one_unit = transl(0,1,0);

% 4 rotate back (need to make this loop rotate dynamically, regardless of
%current angle
neg_x = trotx(1*pi/180);

% 5 rotate y 20 degrees

y_rot_one_unit = troty(1*pi/180);

% 6 move to global point [2,2,10] along x

x_one_unit = transl(1,0,0);

% 7 rotate back along y axis

neg_y_rot_one_unit = troty(-1*pi/180);

% 8 back to ground

down_one_unit = transl(0,0,-1);

try delete(uav_plot); end

pause(1);
uav = transl(0,0,0);
 
for steps = 1:8
    switch steps
        case 1
            for i = 1:10
                try delete(uav_plot); end

                uav = uav*up_one_unit;

                uav_plot = trplot(uav, 'frame', '1', 'color', 'b', 'length' ,1);

                pause(0.1);
            end
        case 2
            for i = 1:10
                try delete(uav_plot); end

                uav = uav*x_rot_one_unit;

                uav_plot = trplot(uav, 'frame', '1', 'color', 'b', 'length' ,1);

                pause(0.1);
            end
            
        case 3
            for i = 1:2
                try delete(uav_plot); end

                uav = y_one_unit * uav;

                uav_plot = trplot(uav, 'frame', '1', 'color', 'b', 'length' ,1);

                pause(0.1);
            end
        case 4
            for i = 1:10
                try delete(uav_plot); end

                uav = uav * neg_x;

                uav_plot = trplot(uav, 'frame', '1', 'color', 'b', 'length' ,1);

                pause(0.1);
            end 
        case 5
            for i = 1:20
                try delete(uav_plot); end

                uav = uav * y_rot_one_unit;

                uav_plot = trplot(uav, 'frame', '1', 'color', 'b', 'length' ,1);

                pause(0.1);
            end
        case 6
            for i = 1:2
                try delete(uav_plot); end

                uav = x_one_unit * uav;

                uav_plot = trplot(uav, 'frame', '1', 'color', 'b', 'length' ,1);

                pause(0.1);
            end
        case 7
            for i = 1:20
                try delete(uav_plot); end

                uav = uav * neg_y_rot_one_unit;

                uav_plot = trplot(uav, 'frame', '1', 'color', 'b', 'length' ,1);

                pause(0.1);
            end
        case 8
            for i = 1:10
                try delete(uav_plot); end

                uav = uav * down_one_unit;

                uav_plot = trplot(uav, 'frame', '1', 'color', 'b', 'length' ,1);

                pause(0.1);
            end
    end
end
%% 


L1 = Link('d', 0, 'a', 1, 'alpha', 0, 'offset',0);
L2 = Link('d', 0, 'a', 1, 'alpha', 0, 'offset',0);
L3 = Link('d', 0, 'a', 1, 'alpha', 0, 'offset',0);

L = [L1, L2, L3];

robot = SerialLink(L, 'name', 'myrobot');

q = zeros(1,3);

x = 4;
y = 4;
z = 4;

workspace = [-x, x, -y, y, -z, z];

scale = 1;

robot.plot(q, 'workspace',workspace, 'scale', scale);
robot.teach();
