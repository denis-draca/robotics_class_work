L1 = Link('d',0.18,'a',0.18,'alpha',pi/2,'offset',0 , 'qlim', [-170*pi/180, 170*pi/180])

L2 = Link('d',0,'a',0.385,'alpha',0,'offset',0, 'qlim', [-90*pi/180, 135*pi/180])

L3 = Link('d',0,'a',0,'alpha', -pi/2,'offset',0, 'qlim', [-80*pi/180, 165*pi/180])

L4 = Link('d',0.445,'a',0,'alpha',pi/2,'offset',0, 'qlim', [-185*pi/180, 185*pi/180])

L5 = Link('d',0,'a', 0,'alpha',-pi/2,'offset',0, 'qlim', [-120*pi/180, 120*pi/180])

L6 = Link('d',0,'a',0,'alpha',0,'offset',0, 'qlim', [-360*pi/180, 360*pi/180])

myRobot = SerialLink([L1 L2 L3 L4 L5 L6 ], 'name', 'denso')

q = zeros(1,6)

myRobot.plot(q)

total_steps = 10;

steps = -0.2/total_steps;

for i = 1:total_steps
    q = myRobot.getpos();
    t = myRobot.fkine(q);
    new_pos = myRobot.ikine( t * transl(0,0,steps));
    
    myRobot.animate(new_pos);
end