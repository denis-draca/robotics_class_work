subplot(1,2,1)
imshow(W1LabEx1_CircularRaceTrack);
axis on;
hold on;

steps = 360;

blue_circumference = 475*pi;
red_circumference = 375 * pi;

blue_car = se2(300, 550, 0);
red_car = se2(300, 125, 0);

blue_plot = trplot2(blue_car, 'frame', '1', 'color', 'b', 'length', 50);
red_plot = trplot2(red_car, 'frame', '1', 'color', 'r', 'length', 50);

blue_transform = se2(blue_circumference/steps, 0, -(360/steps)*(pi/180));
red_transform = se2(red_circumference/steps, 0, 0);
red_rot = se2(0,0,(360/steps)*(pi/180));

dist = zeros(1,steps);

subplot(1,2,2);
xlabel('Timestep');
ylabel('Sensor reading - distance between cars');
hold on;        

for i = 1:steps
    subplot(1,2,2);
    try delete(distPlot_h);end
    dist(i) = sqrt(((blue_car(1,3) - red_car(1,3)).^2) + ((blue_car(2,3) - red_car(2,3)).^2));
    distPlot_h = plot(1:i,dist(1:i),'b-');
    
    subplot(1,2,1);
    delete(blue_plot);
    delete(red_plot);
    blue_car = blue_car * blue_transform;
    blue_plot = trplot2(blue_car, 'frame', '1', 'color', 'b', 'length', 50);
    
    red_car = red_car * red_transform * red_rot;
    red_plot = trplot2(red_car, 'frame', '1', 'color', 'r', 'length', 50);
    
    %pause(0.0001);
    drawnow();
end

