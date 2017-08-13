cowHerd = RobotCows(2);

uav = transl(0,0,0);
up_one_unit = transl(0,0,1);

uav_plot = trplot(uav, 'frame', '1', 'color', 'b', 'length' ,1);
x_rot_one_unit = trotx(-1*pi/180);

y_one_unit = transl(0,1,0);
neg_x = trotx(1*pi/180);

y_rot_one_unit = troty(1*pi/180);
x_one_unit = transl(1,0,0);
neg_y_rot_one_unit = troty(-1*pi/180);

down_one_unit = transl(0,0,-1);
 
for steps = 1:8
    switch steps
        case 1
            for i = 1:10
                if i == 1
                    for cow_no = 1:cowHerd.cowCount()
                        cowHerd.cow{cow_no}.base \ uav;
                    end
                end
                
                try delete(uav_plot); end

                uav = uav*up_one_unit;

                uav_plot = trplot(uav, 'frame', '1', 'color', 'b', 'length' ,1);

                pause(0.1);
                cowHerd.PlotSingleRandomStep();
            end
        case 2
            for i = 1:10
                
                if i == 1
                    for cow_no = 1:cowHerd.cowCount()
                        cowHerd.cow{cow_no}.base \ uav;
                    end
                end
                
                try delete(uav_plot); end

                uav = uav*x_rot_one_unit;

                uav_plot = trplot(uav, 'frame', '1', 'color', 'b', 'length' ,1);

                pause(0.1);
                cowHerd.PlotSingleRandomStep();
            end
            
        case 3
            for i = 1:2
                if i == 1
                    for cow_no = 1:cowHerd.cowCount()
                        cowHerd.cow{cow_no}.base \ uav;
                    end
                end
                try delete(uav_plot); end

                uav = y_one_unit * uav;

                uav_plot = trplot(uav, 'frame', '1', 'color', 'b', 'length' ,1);

                pause(0.1);
                cowHerd.PlotSingleRandomStep();
            end
        case 4
            for i = 1:10
                if i == 1
                    for cow_no = 1:cowHerd.cowCount()
                        cowHerd.cow{cow_no}.base \ uav;
                    end
                end
                try delete(uav_plot); end

                uav = uav * neg_x;

                uav_plot = trplot(uav, 'frame', '1', 'color', 'b', 'length' ,1);

                pause(0.1);
                cowHerd.PlotSingleRandomStep();
            end 
        case 5
            for i = 1:20
                if i == 1
                    for cow_no = 1:cowHerd.cowCount()
                        cowHerd.cow{cow_no}.base \ uav;
                    end
                end
                try delete(uav_plot); end

                uav = uav * y_rot_one_unit;

                uav_plot = trplot(uav, 'frame', '1', 'color', 'b', 'length' ,1);

                pause(0.1);
                cowHerd.PlotSingleRandomStep();
            end
        case 6
            for i = 1:2
                if i == 1
                    for cow_no = 1:cowHerd.cowCount()
                        cowHerd.cow{cow_no}.base \ uav;
                    end
                end
                try delete(uav_plot); end

                uav = x_one_unit * uav;

                uav_plot = trplot(uav, 'frame', '1', 'color', 'b', 'length' ,1);

                pause(0.1);
            end
        case 7
            for i = 1:20
                if i == 1
                    for cow_no = 1:cowHerd.cowCount()
                        cowHerd.cow{cow_no}.base \ uav;
                    end
                end
                try delete(uav_plot); end

                uav = uav * neg_y_rot_one_unit;

                uav_plot = trplot(uav, 'frame', '1', 'color', 'b', 'length' ,1);

                pause(0.1);
                cowHerd.PlotSingleRandomStep();
            end
        case 8
            for i = 1:10
                if i == 1
                    for cow_no = 1:cowHerd.cowCount()
                        cowHerd.cow{cow_no}.base \ uav;
                    end
                end
                try delete(uav_plot); end

                uav = uav * down_one_unit;

                uav_plot = trplot(uav, 'frame', '1', 'color', 'b', 'length' ,1);

                pause(0.1);
                cowHerd.PlotSingleRandomStep();
            end
    end
end
     
    