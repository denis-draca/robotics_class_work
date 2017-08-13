for pos = 1:length(q)
    myRobot.animate(q(pos, 1:6));
    pause(0.01);
end