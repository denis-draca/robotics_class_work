cowHerd = RobotCows(1);
uav = transl(0,0,0);

overhead = transl(0,0,5);

tranimate(uav * overhead);

steps = 50;

uav = uav * overhead;

for i = 1:steps
    temp = uav\cowHerd.cow{1}.base ;
    if i == 1
        tranimate(uav, uav * temp * overhead, 'nsteps' , 20);
    else
        tranimate(uav, uav * temp * overhead, 'nsteps' , 3);
    end
    
    uav = uav * temp * overhead;
    cowHerd.PlotSingleRandomStep();
    
end