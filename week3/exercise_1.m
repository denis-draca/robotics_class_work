L1 = Link('d',0.18,'a',0.18,'alpha',pi/2,'offset',0)

L2 = Link('d',0,'a',0.385,'alpha',0,'offset',0)

L3 = Link('d',0,'a',0,'alpha', -pi/2,'offset',0)

L4 = Link('d',0.445,'a',0,'alpha',pi/2,'offset',0)

L5 = Link('d',0,'a', 0,'alpha',-pi/2,'offset',0)

L6 = Link('d',0,'a',0,'alpha',0,'offset',0)

myRobot = SerialLink([L1 L2 L3 L4 L5 L6 ], 'name', 'denso')

q = zeros(1,6)

myRobot.plot(q)